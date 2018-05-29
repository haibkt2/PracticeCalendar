
package PracticeCalendar.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import PracticeCalendar.Model.Request;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.OrderCalendarRepository;
import PracticeCalendar.Repository.RequestRepository;
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
	@Autowired
	private RequestRepository requestRepository;

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
		String orderId = "";
		if (lstOrder.size() > 0)
			orderId = lstOrder.get(lstOrder.size() - 1).getOrderId();
		CommonService autoCode = new CommonService();
		String uId = autoCode.autoOrderId(orderId);
		return uId;
	}

	public String autoCodeRequsetId() {
		List<Request> lstRq = (List<Request>) requestRepository.findAll();
		String rqId = "";
		if (lstRq.size() > 0)
			rqId = lstRq.get(lstRq.size() - 1).getReqId();
		CommonService autoCode = new CommonService();
		String rId = autoCode.autoRqId(rqId);
		return rId;
	}

	public Date currentDate() throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		Date dateCurrent = dateFormat.parse(dateFormat.format(date));
		return dateCurrent;
	}

	public Date setDateOrder(String date) throws ParseException {
		String d = date.split("-")[0];
		String m = date.split("-")[1];
		Date day = null;
		Calendar myCal = Calendar.getInstance();
		int year = myCal.get(Calendar.YEAR);
		day = new SimpleDateFormat("yyyy-MM-dd").parse(year + "-" + m + "-" + d);

		return day;
	}

	public void orderCalendar(OrderCalendar orderCalendar) {
		OrderCalendar order = orderCalendarRepository.findByOrderId(orderCalendar.getOrderId());
		if (order == null)
			orderCalendarRepository.save(orderCalendar);

	}

	public void reqCalendar(Request request) {
		Request req = requestRepository.findByReqId(request.getReqId());
		if (req == null)
			requestRepository.save(request);

	}
}