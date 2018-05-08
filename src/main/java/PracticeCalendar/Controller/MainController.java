
package PracticeCalendar.Controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import PracticeCalendar.Model.Role;
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
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	   System.out.println("cac");
	    if (auth != null){    
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/home?logout";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String login(Model model, String error, String logout, HttpSession session, HttpServletRequest req) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName = auth.getName();
		User user = userRepository.findByUserName(userName);
		if (user != null) {
			return "profile";
		}

		if (error != null)
			model.addAttribute("error", "msg.login.invalid");
		if (logout != null)
			model.addAttribute("message", "msg.logout");
		return "home";
	}
	@RequestMapping(value = "/PracticeCalendar", method = RequestMethod.GET)
	public String homePublic(Model model, HttpServletRequest req ,HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null){    
		        new SecurityContextLogoutHandler().logout(req, response, auth);
		    }
		return "home";
	}

	@RequestMapping(value = "/profile" , method = RequestMethod.GET)
	public String profile(Model model) {
		// model.addAttribute("userForm", new User());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userName = auth.getName();
		User user = userRepository.findByUserName(userName);
		if (user != null) {
			model.addAttribute("userLogin", user.getName());
		}
		return "profile";
	}
	@RequestMapping(value = "/management" , method = RequestMethod.GET)
	public String management(Model model,HttpServletRequest request) {
	List<User> listUser = userRepository.findAllUser();
	model.addAttribute("listUser",listUser);
	return "management";
	}
	@RequestMapping(value = "/addUser" , method = RequestMethod.GET)
	public String addUser(Model model) {
		return "addUser";
	}

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
	 @RequestMapping(value = "/addUser", method = RequestMethod.GET)
	    public String registration(Model model, HttpServletRequest request, HttpSession session) {

	        List<Role> lstrole = (List<Role>) roleRepository.findAll();
	        List<Timezone> lstTimezone = (List<Timezone>) timezoneRepository.findAll();
	        // set model
	        model.addAttribute("lstRole", lstrole);
	        model.addAttribute("lstTimezone", lstTimezone);
	        model.addAttribute("userForm", new User());
	        model.addAttribute("userId", userserviceimpl.autoCodeUserId());
	        return "AddUser";
	    }

	    // Insert staff information
	    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
	    public String insertOrupdateUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,
	            Model model, HttpSession session) throws ParseException {
	        userValidator.validate(userForm, bindingResult);
	        // get session userId
	        String sessionUserid = (String) session.getAttribute("userid");
	        List<Role> lstrole = (List<Role>) roleRepository.findAll();
	        List<Timezone> lstTimezone = (List<Timezone>) timezoneRepository.findAll();
	        model.addAttribute("lstRole", lstrole);
	        model.addAttribute("lstTimezone", lstTimezone);
	        // check error input
	        if (bindingResult.hasErrors()) {
	            model.addAttribute("userId", userserviceimpl.autoCodeUserId());
	            return "AddUser";
	        }

	        userForm.setCreateId(sessionUserid);
	        userserviceimpl.insertOrupdate(userForm);
	        model.addAttribute("message", messageSave);
	        model.addAttribute("userId", userserviceimpl.autoCodeUserId());
	        model.addAttribute("userForm", new User());
	        return "AddUser";
	    }

	    // Update Staff information
	    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	    public String updateUser(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model,
	            HttpSession session, final RedirectAttributes redirectAttributes) throws ParseException {
	        updateuserValidator.validate(userForm, bindingResult);

	        // contructor user
	        List<Role> lstrole = (List<Role>) roleRepository.findAll();
	        List<Timezone> lstTimezone = (List<Timezone>) timezoneRepository.findAll();
	        String sessionUserid = (String) session.getAttribute("userid");
	        User u = new User();
	        u = userRepository.findByUserId(userForm.getUserId());

	        // check error input
	        if (bindingResult.hasErrors()) {
	            redirectAttributes.addFlashAttribute("bindingResult", bindingResult);
	            redirectAttributes.addFlashAttribute("userForm", userForm);
	            return "redirect:/updateUser" + "?userid=" + userForm.getUserId();
	        }

	        model.addAttribute("lstRole", lstrole);
	        model.addAttribute("lstTimezone", lstTimezone);
	        userForm.setCreateId(u.getCreateId());
	        userForm.setUpdateId(sessionUserid);
	        userserviceimpl.insertOrupdate(userForm);
	        session.setAttribute("userTimezone", userForm.getTimezone().getValue());
	        session.setAttribute("userTimezoneName", userForm.getTimezone().getName());
	        return "redirect:/updateUser" + "?userid=" + userForm.getUserId() + "&updateUser=" + messageInfo;
	    }

	    // Show view form update information 
	    @RequestMapping(value = "/updateUser", method = RequestMethod.GET)
	    public String updateInfo(Model model, HttpServletRequest request,
	            @ModelAttribute("userForm") final User userForm, Locale locale) {

	        // get parameter date
	        String userId = request.getParameter("userid");
	        String resetPass = request.getParameter("resetPass");
	        String updateuser = request.getParameter("updateUser");

	        User user = new User();
	        user = userserviceimpl.searchUserId(userId);
	        List<Role> lstrole = (List<Role>) roleRepository.findAll();
	        List<Timezone> lstTimezone = (List<Timezone>) timezoneRepository.findAll();
	        Map<String, String> mapStatus = new HashMap<String, String>();
	        String localeString = locale.toString();
	        // Set date of week English
	        if (localeString.equalsIgnoreCase("en")) {
	            mapStatus = commonservice.mapStatus("en");
	        } else if (localeString.equalsIgnoreCase("ja_JP")) {
	            mapStatus = commonservice.mapStatus("ja_JP");
	        }
	        // set model
	        model.addAttribute("listStaus", mapStatus);
	        model.addAttribute("lstRole", lstrole);
	        model.addAttribute("lstTimezone", lstTimezone);
	        model.addAttribute("userForm", user);

	        if (resetPass != null) {
	            // set message value "Reseted Password Success!"

	            model.addAttribute("message", messagePass);
	        }
	        if (updateuser != null) {
	            // set message value "Update Information Success!"
	            model.addAttribute("message", messageInfo);
	        }

	        if (model.asMap().containsKey("bindingResult")) {
	            model.addAttribute("org.springframework.validation.BindingResult.userForm",
	                    model.asMap().get("bindingResult"));
	        }

	        return "UpdateUser";
	    }

}
