
package PracticeCalendar.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Request;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.OrderCalendarRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.RoomRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.RoomServiceImpl;
import PracticeCalendar.Service.UserServiceImpl;

@Controller
public class UserController {

	private static final String String = null;

	@Autowired
	UserRepository userRepository;

	@Autowired
	OrderCalendarRepository orderRepository;

	@Autowired
	RoomRepository roomRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	MessageSource msgSrc;

	@Autowired
	UserServiceImpl userserviceimpl;

	@Autowired
	RoomServiceImpl roomserviceimpl;

	@Value("${string.domain.default}")
	private String domain;

	private static final String UPLOAD_DIRECTORY = "d:/server_reponsitory";

	@RequestMapping(value = "/orderCld", method = RequestMethod.GET)
	public String orderCld(Model model) {
		return "orderCld";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		// model.addAttribute("userForm", new User());
		return "profile";
	}

	// @RequestMapping(value = "/register")
	// public String register(Model model, HttpServletRequest request) throws
	// Exception {
	// User user = new User();
	// String messageRegis;
	// if (!ServletFileUpload.isMultipartContent(request)) {
	// request.setAttribute("message", "Error: Form tag must has
	// 'enctype=multipart/form-data' attribute");
	// } else {
	// File uploadDir = new File(UPLOAD_DIRECTORY);
	// if (!uploadDir.exists()) {
	// uploadDir.mkdir();
	// }
	// String file = "";
	// List<FileItem> multiparts = new ServletFileUpload(new
	// DiskFileItemFactory()).parseRequest(request);
	// for (FileItem item : multiparts) {
	// // if (!item.isFormField()) {
	// // String name = new File(item.getName()).getName();
	// // item.write(new File(UPLOAD_DIRECTORY + File.separator
	// // + name));
	// // }
	//
	// if (!item.isFormField()) {
	// String name = new File(item.getName()).getName();
	// file = name;
	// item.write(new File(UPLOAD_DIRECTORY + File.separator + name + "massv"));
	// request.setAttribute("message", "File(s) uploaded successfully!");
	// } else {
	// String fieldname = item.getFieldName();
	// String fieldvalue = item.getString();
	//
	// if (fieldname.equals("mssv")) {
	// user.setUserId(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// // new String (s.getBytes ("iso-8859-1"),
	// // "UTF-8");
	// } else if (fieldname.equals("name")) {
	// // next logic goes here...
	// user.setName(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// } else if (fieldname.equals("phone")) {
	// // next logic goes here...
	// user.setPhone(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// } else if (fieldname.equals("mail")) {
	// // next logic goes here...
	// user.setEmail(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// } else if (fieldname.equals("birthday")) {
	// // next logic goes here...
	// user.setBirthday(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// } else if (fieldname.equals("gender")) {
	// // next logic goes here...
	// user.setGender(
	// new String(fieldvalue.getBytes(StandardCharsets.ISO_8859_1),
	// StandardCharsets.UTF_8));
	// }
	// }
	// }
	// System.out.println(1);
	// }
	// try {
	// messageRegis = userserviceimpl.insertUser(user);
	// model.addAttribute("messageRegis", messageRegis);
	// } catch (ParseException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	//
	// return "home";
	// }

	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("userForm") User userForm, Model model, HttpSession session,
			HttpServletRequest request) throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		// String profile = (String) request.getParameter("update");
		User userLg = (User) session.getAttribute("UserLogin");
		User userUp = userRepository.findByUserId(userForm.getUserId());
		// update is user
		int p_n = 1;
		if (userForm.getUserId().equals(userLg.getUserId())) {
			if (userForm.getPassword().isEmpty() || userForm.getPassword() == null) {
				userForm.setPassword(userLg.getPassword());
				p_n =0;
			}
			userForm.setUserName(userLg.getUserName());
			userserviceimpl.updateUser(userForm, p_n);
			model.addAttribute("mss_up", "update finnish");
			return "editProfile";
		} else { // update is admin
			userForm.setPassword(userUp.getPassword());
			userForm.setUserName(userUp.getUserName());
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
	public String editProfile(Model model) {
		return "editProfile";
	}

	@RequestMapping(value = "/historyBooking", method = RequestMethod.GET)
	public String viewHistoryOrder(Model model, HttpSession session) {
		// model.addAttribute("userForm", new User());
		User user = (User) session.getAttribute("UserLogin");
		List<OrderCalendar> listOr = orderRepository.findByOrderUser(user.getUserId());
		model.addAttribute("orderUser", listOr);
		List<OrderCalendar> listRq = orderRepository.findByOrderUser(user.getUserId());
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
		rq.setFlg("Request");
		rq.setTimeOrder(time);
		Room r = roomRepository.findByRoomName(room);
		rq.setRoom(r);
		userserviceimpl.reqCalendar(rq);
		return "redirect:/";
	}
}
