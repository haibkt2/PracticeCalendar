
package PracticeCalendar.Controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;

import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
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

	@RequestMapping(value = "/viewClass", method = RequestMethod.GET)
	public String viewClass(Model model) {
		// model.addAttribute("userForm", new User());

		return "viewClass";
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
			User  userlg =(User) session.getAttribute("UserLogin");
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

	@RequestMapping(value = "/orderCalendar", method = RequestMethod.POST)
	public String orderCalendar(@ModelAttribute("roomForm") Room roomForm, Model model, HttpSession session)
			throws ParseException {
		List<Room> lstroom = (List<Room>) roomRepository.findAll();
		model.addAttribute("lstroom", lstroom);
		String messageInfo = roomserviceimpl.orderRoom(roomForm);
		return "redirect:/orderCalendar" + "?roomName=" + roomForm.getRoomName() + "&messageInfo=" + messageInfo;
	}

	@RequestMapping(value = "/orderCalendar", method = RequestMethod.GET)
	public String viewRoom(Model model, HttpServletRequest request, @ModelAttribute("roomForm") final User userForm) {
		// get parameter date
		String roomName = request.getParameter("roomName");
		Room room = new Room();
		room = roomserviceimpl.searchRoomName(roomName);
		String messageInfo = request.getParameter("messageInfo");
		if (messageInfo != null) {
			model.addAttribute("messUpdate", messageInfo);
			model.addAttribute("messUpdate", roomName);
		}
		model.addAttribute("roomForm", room);
		return "orderCalendar";
	}

	@RequestMapping(value = "/viewRoom", method = RequestMethod.GET)
	public String listRoom(@RequestParam("d") String date, Model model, String error, String logout,
			HttpSession session, HttpServletRequest req, HttpServletResponse response) throws ParseException {
		if (date == null || date.isEmpty()) {
			CommonService coService = new CommonService();
			date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		}
		// Get date, month, year value
		// String yearVal = date.substring(0, 4);
		// String monthVal = date.substring(5, 7);
		// String dateVal = date.substring(8);
		String roomType = "public";
		User user = (User) session.getAttribute("UserLogin");
		if (user.getRole().getRoleName().equals("ROLE_TEACHER"))
			roomType = "protected";
		else if (user.getRole().getRoleName().equals("ROLE_STUDENT")) {
			roomType = "public";
		}
		List<Room> listRoom = (List<Room>) roomRepository.findAllRoom(roomType);
		model.addAttribute("listRoom", listRoom);
		return "viewRoom";
	}
}
