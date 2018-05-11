
package PracticeCalendar.Controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.UserServiceImpl;

@Controller
public class UserController {

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
	public String updateUser(@ModelAttribute("userForm") User userForm, Model model, HttpSession session)
			throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
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

}
