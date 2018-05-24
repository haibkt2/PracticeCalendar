
package PracticeCalendar.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.OrderCalendarRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;

@Service
public class UserServiceImpl {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private OrderCalendarRepository orderCalendarRepository;

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
			if (user.getStatus() == null)
				user.setStatus("Activate");
			user.setPassword(coService.setPassword(8));
			getSendMail = emailService.SendMail(user);
			emailService.sendMail(getSendMail.get("mailform"), getSendMail.get("toMail"), getSendMail.get("subject"),
					getSendMail.get("body"));
			user.setPassword(bcrypass.encode(user.getPassword()));
			userRepository.save(user);
			messInsert = "Create New User Sussecs";
		}
		if (findUser != null)
			messInsert = "Create New User Fail! UserId already exist.";
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
		userRepository.save(user);
		return messageInfo;

	}

	public User searchUserId(String userId) {
		User user = userRepository.findByUserId(userId);
		return user;
	}

	public String autoCodeOrderId() {
		List<OrderCalendar> lstOrder = (List<OrderCalendar>) orderCalendarRepository.findAll();
		String orderId = lstOrder.get(lstOrder.size() - 1).getOrderId();
		CommonService autoCode = new CommonService();
		String uId = autoCode.autoOrderId(orderId);
		return uId;
	}

	public Date currentDate() throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		Date dateCurrent = dateFormat.parse(dateFormat.format(date));
		return dateCurrent;
	}

}