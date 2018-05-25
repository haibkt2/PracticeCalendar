
package PracticeCalendar.Controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.OrderCalendarRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.RoomRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.CommonService;
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

	@RequestMapping(value = "/orderCld", method = RequestMethod.GET)
	public String orderCld(Model model) {
		return "orderCld";
	}

	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String profile(Model model) {
		// model.addAttribute("userForm", new User());
		return "profile";
	}

	

	@RequestMapping(value = "/register")
	public String register(Model model, HttpServletRequest request) {
		User user = new User();
		user.setUserId(request.getParameter("mssv"));
		user.setName(request.getParameter("f_name") + " " + request.getParameter("l_name"));
		user.setPhone(request.getParameter("phone"));
		user.setEmail(request.getParameter("mail"));
		user.setBirthday(request.getParameter("birthday"));
		user.setGender(request.getParameter("gender"));
		String messageRegis;
		try {
			messageRegis = userserviceimpl.insertUser(user);
			model.addAttribute("messageRegis", messageRegis);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return "home";
	}

	@RequestMapping(value = "/updateInfo", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("userForm") User userForm, Model model, HttpSession session,
			HttpServletRequest request) throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		String profile = (String) request.getParameter("update");
		if (profile.equals("profile")) {
			User userlg = (User) session.getAttribute("UserLogin");
			userForm.setPassword(userlg.getPassword());
			userForm.setUserId(userlg.getUserId());
			userForm.setUserName(userlg.getUserName());
		}
		String messageInfo = userserviceimpl.updateUser(userForm);
		return "redirect:/updateInfo" + "?userid=" + userForm.getUserId() + "&messageInfo=" + messageInfo;
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

		if (model.asMap().containsKey("bindingResult")) {
			model.addAttribute("org.springframework.validation.BindingResult.userForm",
					model.asMap().get("bindingResult"));
		}

		return "updateUser";
	}

	@RequestMapping(value = "/orderCalendar", method = RequestMethod.GET)
	public String orderCalendar(Model model, HttpSession session, HttpServletRequest req, HttpServletResponse resp)
			throws ParseException {
		String day = req.getParameter("dayBooking");
		String time = req.getParameter("timeBooking");
		String room = req.getParameter("room");
		User u = (User) session.getAttribute("UserLogin");
		OrderCalendar orderCalendar = new OrderCalendar();
		orderCalendar.setOrderId(userserviceimpl.autoCodeOrderId());
		orderCalendar.setCreatDate(userserviceimpl.currentDate().toString());
		orderCalendar.setDateOrder(userserviceimpl.setDateOrder(day));
		orderCalendar.setCreatDate(userserviceimpl.currentDate().toString());
		orderCalendar.setUser(u);
		orderCalendar.setFlg("1");
		orderCalendar.setTimeOrder(time);
		Room r = roomRepository.findByRoomName(room);
		orderCalendar.setRoom(r);
		userserviceimpl.orderCalendar(orderCalendar);
		return "redirect:/home";
	}

	@RequestMapping(value = "/editProfile", method = RequestMethod.GET)
	public String editProfile(Model model) {
		return "editProfile";
	}
	@RequestMapping(value = "/historyBooking", method = RequestMethod.GET)
	public String viewHistoryOrder(Model model) {
		// model.addAttribute("userForm", new User());

		return "historyOrder";
	}
}
