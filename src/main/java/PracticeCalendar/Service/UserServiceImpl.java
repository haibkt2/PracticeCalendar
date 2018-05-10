
package PracticeCalendar.Service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;

@Service
public class UserServiceImpl {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Value("${string.role.default}")
	private String role;
	@Autowired
	@Qualifier("javasampleapproachMailSender")
	EmailService emailService;
	private BCryptPasswordEncoder bcrypass = new BCryptPasswordEncoder();

	public String insertUser(User user) throws ParseException {
		String messInsert = "";
		Map<String, String> getSendMail = new HashMap<String, String>();
		CommonService coService = new CommonService();
		User findUser = userRepository.findByUserId(user.getUserId());
		if (findUser == null) {
			if (user.getRole() == null)
				user.setRole(new Role(1, role));
			user.setUserName(user.getUserId());
			user.setCreateDate(coService.currentDate());
			if (user.getEmail() == null)
				user.setEmail("mailnull@gmail.com");
			user.setPassword(coService.setPassword(8));
			getSendMail = emailService.SendMail(user);
			emailService.sendMail(getSendMail.get("mailform"), getSendMail.get("toMail"), getSendMail.get("subject"),
					getSendMail.get("body"));
			user.setPassword(bcrypass.encode(user.getPassword()));
			userRepository.save(user);
			messInsert = "Create New User Sussecs";
		}
		if (findUser != null)
			messInsert = "Create New User Fail";
		return messInsert;

	}

	public String updateUser(User user) throws ParseException {
		String messageInfo = "";
		// Map<String, String> getSendMail = new HashMap<String, String>();
		CommonService coService = new CommonService();
		User findUser = userRepository.findByUserId(user.getUserId());
		Role findRole = roleRepository.findByRoleName(role);
		if (user.getRole() == null)
			user.setRole(findRole);
		user.setPassword(findUser.getPassword());
		user.setUserName(user.getUserId());
		user.setCreateDate(coService.currentDate());
		messageInfo = "Update Sussecs";
		// if(user.getEmail() == null)
		// user.setEmail("mailnull@gmail.com");
		// user.setPassword(coService.setPassword(8));
		// getSendMail = emailService.SendMail(user);
		// emailService.sendMail(getSendMail.get("mailform"), getSendMail.get("toMail"),
		// getSendMail.get("subject"),
		// getSendMail.get("body"));
		// user.setPassword(bcrypass.encode(user.getPassword()));
		userRepository.save(user);
		return messageInfo;

	}

	public User searchUserId(String userId) {
		User user = userRepository.findByUserId(userId);
		return user;
	}

}