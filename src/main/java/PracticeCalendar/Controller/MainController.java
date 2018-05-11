
package PracticeCalendar.Controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

	@Value("${button.save.success}")
	private String messageSave;

	@GetMapping("/403")
	public String accessDenied() {
		return "404";
	}

	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String login(Model model, String error, String logout, String view, HttpServletRequest req,
			HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logout = req.getParameter("logout");
		if (logout != null) {
			if (auth != null) {
				new SecurityContextLogoutHandler().logout(req, response, auth);
			}
			return "home";
		}
		return "home";
	}
}
