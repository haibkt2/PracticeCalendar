
package PracticeCalendar.Controller;

import java.text.ParseException;

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

	@Value("${string.domain.default}")
	private String domain;

	@GetMapping("/403")
	public String accessDenied() {
		return "403";
	}

	@RequestMapping(value = "/loginOrSigin", method = RequestMethod.GET)
	public String login(Model model, String error, String logout, HttpSession session, HttpServletRequest req) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName = auth.getName();
		User user = userRepository.findByUserName(userName);
		// check

		if (user != null) {
			model.addAttribute("userLogin", user.getUserId());
			return "home";
		}

		if (error != null)
			model.addAttribute("error", "msg.login.invalid");
		if (logout != null)
			model.addAttribute("message", "msg.logout");
		return "loginOrSigin";
	}

	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String home(Model model) {
		// model.addAttribute("userForm", new User());
		return "home";
	}

	// @RequestMapping(value = "/register", method = RequestMethod.GET)
	// public String homeRe(Model model) {
	// model.addAttribute("userForm", new User());
	// return "register";
	// }

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public String register(Model model, HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		User user = new User();
		String fg_pass = request.getParameter("mssv_fg");
		if (fg_pass != null)
			user = userRepository.findByUserId(fg_pass);
		else {
			user.setUserId(request.getParameter("mssv"));
			user.setName(request.getParameter("f_name") + " " + request.getParameter("l_name"));
			user.setPhone(request.getParameter("phone"));
			user.setEmail(request.getParameter("mssv") + domain);
			// userValidator.validate(userForm, bindingResult);
		}
		userserviceimpl.insertOrUpdateUser(user);
		return "mySelf" + user.getPhone();
	}

}
