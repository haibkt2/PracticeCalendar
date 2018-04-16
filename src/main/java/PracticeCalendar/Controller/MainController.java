
package PracticeCalendar.Controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.UserServiceImpl;

@Controller
public class MainController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	MessageSource msgSrc;

	@Autowired
	UserServiceImpl userserviceimpl;

	@GetMapping("/403")
	public String accessDenied() {
		return "403";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout, HttpSession session, HttpServletRequest req) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName = auth.getName();
		User user = userRepository.findByUserName(userName);

		if (user != null) {
			return "home";
		}

		if (error != null)
			model.addAttribute("error", "msg.login.invalid");
		if (logout != null)
			model.addAttribute("message", "msg.logout");
		return "login";
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String homeLogin(Model model) {
		model.addAttribute("userForm", new User());
		return "home";
	}
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String homeRe(Model model) {
		model.addAttribute("userForm", new User());
		return "register";
	}
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("userForm") User user) throws ParseException {
		model.addAttribute("userForm", new User());
		// userValidator.validate(userForm, bindingResult);
		userserviceimpl.insertOrUpdateUser(user);
		return "mySelf" + user.getPhone();
	}

}
