
package PracticeCalendar.Controller;

import java.text.ParseException;
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

import PracticeCalendar.Model.Notify;
import PracticeCalendar.Model.Request;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RequestRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.UserServiceImpl;

@Controller
public class AdminController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;
	
	@Autowired
	RequestRepository requestRepository;

	@Autowired
	MessageSource msgSrc;

	@Autowired
	UserServiceImpl userserviceimpl;

	@Value("${string.domain.default}")
	private String domain;

	
	@RequestMapping(value = "/userStatistics", method = RequestMethod.GET)
	public String userStatistics(Model model) {
		List<Request> listReq = (List<Request>) requestRepository.findAll();
		model.addAttribute("listReq", listReq);
		return "userStatistics";
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
		return "managementClass";
	}

	@RequestMapping(value = "/managementPost", method = RequestMethod.GET)
	public String managementPost(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
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

	@RequestMapping(value = "/createNotify", method = RequestMethod.GET)
	public String showNotify(Model model, HttpServletRequest request, HttpSession session) {
		return "createNotify";
	}

	// Insert staff information
	@RequestMapping(value = "/createNotify", method = RequestMethod.POST)
	public String createNotify(@ModelAttribute("postForm") Notify notify, Model model, HttpSession session)
			throws ParseException {
//		List<Role> lstrole = (List<Role>) roleRepository.findAll();
//		model.addAttribute("lstRole", lstrole);
//		String messageSave = userserviceimpl.insertUser(userForm);
//		model.addAttribute("messageSave", messageSave);
//		model.addAttribute("userForm", new User());
		return "createNotify";
	}
	

}
