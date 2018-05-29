
package PracticeCalendar.Controller;

import java.text.ParseException;
import java.util.Calendar;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.RoomRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.CommonService;
import PracticeCalendar.Service.RoomServiceImpl;
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

	@Autowired
	RoomRepository roomRepository;

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
			if (!user.getRole().getRoleName().equals("ROLE_ADMIN")) {
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
			} else
				return "redirect:/userStatistics";
		}
		return "home";
	}

	@RequestMapping(value = "/getServerTime", method = RequestMethod.GET)
	@ResponseBody
	public String getServerTime() {
		return String.valueOf(Calendar.getInstance().getTimeInMillis());
	}
}
