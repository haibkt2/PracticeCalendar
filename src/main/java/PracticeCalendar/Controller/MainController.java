
package PracticeCalendar.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import PracticeCalendar.Model.Notify;
import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Request;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.NotifyRepository;
import PracticeCalendar.Repository.OrderCalendarRepository;
import PracticeCalendar.Repository.RequestRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.RoomRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.CommonService;
import PracticeCalendar.Service.UserServiceImpl;

@Controller
public class MainController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;
	@Autowired
	NotifyRepository notifyRepository;

	@Autowired
	MessageSource msgSrc;
	@Autowired
	OrderCalendarRepository orderRepository;
	@Autowired
	UserServiceImpl userserviceimpl;
	@Autowired
	RequestRepository requestRepository;
	@Value("${string.domain.default}")
	private String domain;

	@Value("${button.save.success}")
	private String messageSave;

	@Autowired
	RoomRepository roomRepository;
	@Value("${string.reponsitory.post}")
	private String localPost;
	@Value("${string.reponsitory.image}")
	private String localImage;

	@GetMapping("/403")
	public String accessDenied() {
		return "404";
	}

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String login(Model model, String error, String logout, String view, HttpServletRequest req,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName = auth.getName();
		User user = userRepository.findByUserName(userName);
		if (user != null) {
//			if (!user.getRole().getRoleName().equals("ROLE_ADMIN")) {
				String roomType = "public";
				if (user.getRole().getRoleName().equals("ROLE_TEACHER"))
					roomType = "protected";
				else if (user.getRole().getRoleName().equals("ROLE_STUDENT")) {
					roomType = "public";
				}
				CommonService cmsv = new CommonService();
				List<String> setDay = cmsv.setDay();
				List<Room> listRoom;
				listRoom = (List<Room>) roomRepository.findAllRoom(roomType);
				model.addAttribute("listRoom", listRoom);
				// System.out.println(listRoom.get(0).getRequestCalendar().get(0).getStatus());
				model.addAttribute("setDay", setDay);
				return "viewRoom";
//			} else
//				return "redirect:/userStatistics";
		} else {
			List<Notify> listNt = (List<Notify>) notifyRepository.findAll();
			model.addAttribute("listNt", listNt);
			return "home";
		}

	}

	@RequestMapping(value = "/getServerTime", method = RequestMethod.GET)
	@ResponseBody
	public String getServerTime() {
		return String.valueOf(Calendar.getInstance().getTimeInMillis());
	}

	@RequestMapping(value = "/orderCld", method = RequestMethod.GET)
	public String orderCld(Model model) {
		return "orderCld";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		// model.addAttribute("userForm", new User());
		return "profile";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@RequestParam("file") MultipartFile file, @RequestParam("mssv") String mssv,
			@RequestParam("name") String name, @RequestParam("mail") String mail,
			@RequestParam("birthday") String birthday, @RequestParam("phone") String phone,
			@RequestParam("gender") String gender, Model model, HttpSession session, HttpServletRequest request)
			throws Exception {

		User user = new User();
		user.setUserId(mssv);
		user.setName(name);
		user.setBirthday(birthday);
		user.setGender(gender);
		user.setPhone(phone);
		File uploadDir = new File(localImage);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		String fileName = null;
		if (!file.isEmpty()) {
			try {
				fileName = mssv + "-" + file.getOriginalFilename();
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(
						new FileOutputStream(new File(localImage + fileName)));
				buffStream.write(bytes);
				buffStream.close();
				user.setAvatar(fileName);
			} catch (Exception e) {
				return "redirect:/home";
			}
		}
		userserviceimpl.insertUser(user);
		return "home?register=ss";
	}

	@RequestMapping(value = "/updateInfoUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("userForm") User userForm, @RequestParam("file") MultipartFile file,
			Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		// String profile = (String) request.getParameter("update");
		User userLg = (User) session.getAttribute("UserLogin");
		User userUp = userRepository.findByUserId(userForm.getUserId());
		// update is user
		int p_n = 1;
		if (userForm.getUserId().equals(userLg.getUserId())) {
			if (userForm.getPassword() == null) {
				userForm.setPassword(userLg.getPassword());
				p_n = 0;
			} else {
				if (userForm.getPassword().isEmpty()) {
					userForm.setPassword(userLg.getPassword());
					p_n = 0;
				}
			}
			String fileName = null;
			if (!file.isEmpty()) {
				try {
					fileName = userLg.getUserId() + "-" + file.getOriginalFilename();
					byte[] bytes = file.getBytes();
					BufferedOutputStream buffStream = new BufferedOutputStream(
							new FileOutputStream(new File(localImage + fileName)));
					buffStream.write(bytes);
					buffStream.close();
					userForm.setAvatar(fileName);
				} catch (Exception e) {
					model.addAttribute("mss_up", "update fail");
					return "editProfile";
				}
			}
			else userForm.setAvatar(userLg.getAvatar());
			userForm.setUserName(userLg.getUserName());
			userserviceimpl.updateUser(userForm, p_n);
			model.addAttribute("mss_up", "update finnish");
//			if (userLg.getRole().getRoleName().equals("ROLE_ADMIN")) {
//				return "redirect:/updateInfo" + "?userid=" + userForm.getUserId() + "&messageInfo=updatess";
//			} else
				return "redirect:/editProfile";
		} else { // update is admin
			userForm.setPassword(userUp.getPassword());
			userForm.setUserName(userUp.getUserName());
			userForm.setAvatar(userUp.getAvatar());
			String messageInfo = userserviceimpl.updateUser(userForm, 0);
			return "redirect:/updateInfo" + "?userid=" + userForm.getUserId() + "&messageInfo=" + messageInfo;
		}
	}

	@RequestMapping(value = "/updateInfo", method = RequestMethod.GET)
	public String updateInfo(Model model, HttpServletRequest request, @ModelAttribute("userForm") final User userForm) {
		// get parameter date
		String userId = request.getParameter("userid");
		String messageInfo = request.getParameter("messageInfo");

		User user = new User();
		user = userserviceimpl.searchUserId(userId);
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		model.addAttribute("userForm", user);

		if (messageInfo != null) {
			model.addAttribute("messUpdate", messageInfo);
		}
		return "updateUser";
	}

	@RequestMapping(value = "/orderCalendar", method = RequestMethod.GET)
	public String orderCalendar(Model model, HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ParseException {
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		String day = req.getParameter("dayBooking");
		String time = req.getParameter("timeBooking");
		String room = req.getParameter("room");
		User u = (User) session.getAttribute("UserLogin");
		OrderCalendar orderCalendar = new OrderCalendar();
		orderCalendar.setOrderId(userserviceimpl.autoCodeOrderId());
		orderCalendar.setCreatDate(userserviceimpl.currentDate().toString());
		orderCalendar.setDateOrder(userserviceimpl.setDateOrder(day));
		orderCalendar.setCreatDate(sdfDate.format(userserviceimpl.currentDate()));
		orderCalendar.setUser(u);
		orderCalendar.setFlg("1");
		orderCalendar.setTimeOrder(time);
		Room r = roomRepository.findByRoomName(room);
		orderCalendar.setRoom(r);
		userserviceimpl.orderCalendar(orderCalendar);
		return "redirect:/";
	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfile(Model model,HttpServletRequest request,Authentication auth) {
		String userName = auth.getName();
		HttpSession session = request.getSession();
		User loginUser = userRepository.findByUserName(userName);
		session.setAttribute("UserLogin", loginUser);
		return "editProfile";
	}

	@RequestMapping(value = "/historyBooking", method = RequestMethod.GET)
	public String viewHistoryOrder(Model model, HttpSession session) {
		// model.addAttribute("userForm", new User());
		User user = (User) session.getAttribute("UserLogin");
		List<OrderCalendar> listOr = orderRepository.findByOrderUser(user.getUserId());
		model.addAttribute("orderUser", listOr);
		if (!user.getRole().getRoleName().equals("ROLE_STUDENT")) {
			List<Request> listRq = requestRepository.findByRqUser(user.getUserId());
			model.addAttribute("listRq", listRq);
		}
		model.addAttribute("orderUser", listOr);
		return "historyOrder";
	}

	@RequestMapping(value = "/manageOrder", method = RequestMethod.GET)
	public String manageOrder(Model model, HttpSession session, HttpServletRequest request) {
		// model.addAttribute("userForm", new User());
		// User user = (User) session.getAttribute("UserLogin");
		String cancel = request.getParameter("cancel");
		String delete = request.getParameter("delete");
		if (cancel != null) {
			orderRepository.deleteOrderId(cancel);
		} else if (delete != null) {
			OrderCalendar orderCalendar = orderRepository.findByOrderId(delete);
			if (orderCalendar != null)
				orderCalendar.setFlg("0");
			orderRepository.save(orderCalendar);
		}
		return "redirect:/historyBooking";
	}
	@RequestMapping(value = "/manageRequest", method = RequestMethod.GET)
	public String manageRequest(Model model, HttpSession session, HttpServletRequest request) {
		// model.addAttribute("userForm", new User());
		// User user = (User) session.getAttribute("UserLogin");
		String cancel = request.getParameter("cancel");
		String delete = request.getParameter("delete");
		if (cancel != null) {
			requestRepository.deleteRequest(cancel);
		} else if (delete != null) {
			Request rq = requestRepository.findByReqId(delete);
			if (rq != null)
				rq.setFl("0");
			requestRepository.save(rq);
		}
		return "redirect:/historyBooking";
	}

	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String request(Model model, HttpSession session, HttpServletRequest request) throws ParseException {
		SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd");
		String day = request.getParameter("dayBooking");
		String time = request.getParameter("timeBooking");
		String room = request.getParameter("room");
		User u = (User) session.getAttribute("UserLogin");
		Request rq = new Request();
		rq.setReqId(userserviceimpl.autoCodeRequsetId());
		rq.setCreatDate(userserviceimpl.currentDate().toString());
		rq.setDateReq(userserviceimpl.setDateOrder(day));
		rq.setCreatDate(sdfDate.format(userserviceimpl.currentDate()));
		rq.setUser(u);
		rq.setStatus("Waiting");
		rq.setTimeOrder(time);
		rq.setFl("1");
		Room r = roomRepository.findByRoomName(room);
		rq.setRoom(r);
		userserviceimpl.reqCalendar(rq);
		return "redirect:/";
	}

	@RequestMapping(value = "/userStatistics", method = RequestMethod.GET)
	public String userStatistics(Model model) {
		List<Request> listReq = (List<Request>) requestRepository.findAllRequest();
		List<Request> listAgr = (List<Request>) requestRepository.findAllAgree();
		model.addAttribute("listReq", listReq);
		model.addAttribute("listAgr", listAgr);
		return "userStatistics";
	}

	@RequestMapping(value = "/responseRequest", method = RequestMethod.GET)
	public String responseRequest(Model model, HttpServletRequest request, HttpSession session) {
		String agree = request.getParameter("agree");
		User u = (User) session.getAttribute("UserLogin");
		String disagree = request.getParameter("disagree");
		if (agree != null) {
			Request rq = requestRepository.findByReqId(agree);
			if (rq != null) {
				rq.setStatus("Booked");
				rq.setAdminAgree(u.getName());
				requestRepository.save(rq);
			}
		} else {
			Request rq = requestRepository.findByReqId(disagree);
			if (rq != null) {
				requestRepository.deleteRequest(rq.getReqId());
			}
		}
		return "redirect:/userStatistics";
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("notifyForm") Notify notifyForm, Model model, HttpSession session,
			HttpServletRequest request) throws ParseException {
		User u = (User) session.getAttribute("UserLogin");
		notifyForm.setCreateDate(userserviceimpl.currentDate());
		notifyForm.setUser(u);
		model.addAttribute("mess_nt", "sussecess");
		Notify nt = notifyRepository.findByNotifyId(notifyForm.getNotifyId());
		if (nt != null)
			notifyRepository.save(notifyForm);
		notifyRepository.save(notifyForm);
		return "redirect:/managementPost?mess_nt=sussecess";
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.GET)
	public String updateInfoPost(Model model, HttpServletRequest request,
			@ModelAttribute("notifyForm") final Notify notifyForm) {
		// get parameter date
		String notifyIdUp = request.getParameter("updatePid");
		String notifyIdDel = request.getParameter("deletePid");
		if (notifyIdDel != null) {
			notifyRepository.deleteNotifyId(notifyIdDel);
			return "redirect:/managementPost?mess_nt=delss";
		} else {
			Notify notify = new Notify();
			notify = notifyRepository.findByNotifyId(notifyIdUp);
			model.addAttribute("notifyForm", notify);
			String mess = request.getParameter("mess_nt");
			if (mess != null)
				model.addAttribute("mess_nt", mess);
			return "updatePost";
		}
	}

	@RequestMapping(value = "/managementAccount", method = RequestMethod.GET)
	public String managementAccount(Model model, String error, String logout, HttpSession session,
			HttpServletRequest req, HttpServletResponse response) {
		List<User> listUser = (List<User>) userRepository.findAll();
		model.addAttribute("listUser", listUser);
		return "managementAccount";
	}

	@RequestMapping(value = "/managementClass", method = RequestMethod.GET)
	public String managementClass(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
		List<Room> listRm = (List<Room>) roomRepository.findAll();
		model.addAttribute("listRm", listRm);
		return "managementClass";
	}

	@RequestMapping(value = "/managementPost", method = RequestMethod.GET)
	public String managementPost(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
		List<Notify> listNt = (List<Notify>) notifyRepository.findAll();
		model.addAttribute("listNt", listNt);
		model.addAttribute("mess_nt", req.getParameter("mess_nt"));
		return "managementPost";
	}

	// show view form insert formation
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String registration(Model model, HttpServletRequest request, HttpSession session) {

		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		// set model
		model.addAttribute("lstRole", lstrole);
		model.addAttribute("userForm", new User());
		return "addUser";
	}

	// Insert staff information
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("userForm") User userForm, Model model, HttpSession session)
			throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		String messageSave = userserviceimpl.insertUser(userForm);
		model.addAttribute("messageSave", messageSave);
		model.addAttribute("userForm", new User());
		return "addUser";
	}

	@RequestMapping(value = "/createNotifybk", method = RequestMethod.GET)
	public String showNotify(Model model, HttpServletRequest request, HttpSession session) {
		return "createNotify";
	}

	// Insert staff information
	@RequestMapping(value = "/createNotifybk", method = RequestMethod.POST)
	public String createNotify(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Notify notify = new Notify();
		User u = (User) session.getAttribute("UserLogin");
		notify.setNotifyId(userserviceimpl.autoCodeNotifyId());
		notify.setCreateDate(userserviceimpl.currentDate());
		notify.setUser(u);
		notify.setNotifyContent(content);
		notify.setNotifyTitle(title);
		userserviceimpl.creNotify(notify);
		model.addAttribute("mess_nt", "sussecess");
		return "redirect:/managementPost?mess_nt=sussecess";
	}

	@RequestMapping(value = "/createNotify")
	public String singleUpload() {
		return "createNotify";
	}

	@RequestMapping(value = "/savePost", method = RequestMethod.POST)
	public String singleSave(@RequestParam("file") MultipartFile file, @RequestParam("content") String content,
			@RequestParam("title") String title, Model model, HttpSession session) throws ParseException {
		File uploadDir = new File(localPost);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		String fileName = null;
		Notify notify = new Notify();
		User u = (User) session.getAttribute("UserLogin");
		notify.setNotifyId(userserviceimpl.autoCodeNotifyId());
		notify.setCreateDate(userserviceimpl.currentDate());
		notify.setUser(u);
		notify.setNotifyContent(content);
		notify.setNotifyTitle(title);
		if (!file.isEmpty()) {
			try {
				fileName = file.getOriginalFilename();
				byte[] bytes = file.getBytes();
				BufferedOutputStream buffStream = new BufferedOutputStream(
						new FileOutputStream(new File(localPost + fileName)));
				buffStream.write(bytes);
				buffStream.close();
				notify.setFileDatas(fileName);
				userserviceimpl.creNotify(notify);
				return "redirect:/managementPost?mess_nt=sussecess";
			} catch (Exception e) {
				return "redirect:/managementPost?mess_nt=fail";
			}
		}
		userserviceimpl.creNotify(notify);
		return "redirect:/managementPost?mess_nt=sussecess";
	}

	@RequestMapping(value = "/downloadFile", method = RequestMethod.GET)
	public String download(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset();
		PrintWriter out = response.getWriter();
		String file = request.getParameter("file");
		String path = localPost;
		response.setContentType("APPLICATION/OCTET-STREAM");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + file + "\"");

		FileInputStream fileInputStream = new FileInputStream(path + file);

		int i;
		while ((i = fileInputStream.read()) != -1) {
			out.write(i);
		}
		fileInputStream.close();
		out.close();
		return "home";
	}
}
