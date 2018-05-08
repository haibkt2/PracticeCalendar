/*
 * System name: Time record system
 * Company name: ARCH-VN
 * Author: nguyen-dinhtoan
 * Create day: 2017/11/30
 * Version: 1.0
 */

package PracticeCalendar.Service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
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

	public void insertOrUpdateUser(User user) throws ParseException {
		Map<String, String> getSendMail = new HashMap<String, String>();
		CommonService coService = new CommonService();
		User findUserId = userRepository.findByUserId(user.getUserId());
		Role findRole = roleRepository.findByRoleName(role);
		if (findUserId == null) {
			if (user.getRole() == null)
				user.setRole(findRole);
			user.setUserName(user.getUserId());
			user.setCreateDate(coService.currentDate());
		}
		if(user.getEmail() == null)
			user.setEmail("mailnull@gmail.com");
		user.setPassword(coService.setPassword(8));
		getSendMail = emailService.SendMail(user);
		emailService.sendMail(getSendMail.get("mailform"), getSendMail.get("toMail"), getSendMail.get("subject"),
				getSendMail.get("body"));
		user.setPassword(bcrypass.encode(user.getPassword()));
		userRepository.save(user);

	}

}