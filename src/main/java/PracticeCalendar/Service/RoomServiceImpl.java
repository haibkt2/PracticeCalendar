
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
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.RoomRepository;
import PracticeCalendar.Repository.UserRepository;

@Service
public class RoomServiceImpl {
	@Autowired
	private RoomRepository roomRepository;

	@Autowired
	private RoleRepository roleRepository;

	@Value("${string.role.default}")
	private String role;
	@Autowired
	@Qualifier("javasampleapproachMailSender")
	EmailService emailService;
	private BCryptPasswordEncoder bcrypass = new BCryptPasswordEncoder();

	public String orderRoom(Room room) throws ParseException {
		String messInsert = "";
//		Map<String, String> getSendMail = new HashMap<String, String>();
//		CommonService coService = new CommonService();
//		User findUser = userRepository.findByUserId(user.getUserId());
//		if (findUser == null) {
//			if (user.getRole() == null)
//				user.setRole(new Role(1, role));
//			user.setUserName(user.getUserId());
//			user.setCreateDate(coService.currentDate());
//			if (user.getEmail() == null)
//				user.setEmail("mailnull@gmail.com");
//			if (user.getStatus() == null)
//				user.setStatus("Activate");
//			user.setPassword(coService.setPassword(8));
//			getSendMail = emailService.SendMail(user);
//			emailService.sendMail(getSendMail.get("mailform"), getSendMail.get("toMail"), getSendMail.get("subject"),
//					getSendMail.get("body"));
//			user.setPassword(bcrypass.encode(user.getPassword()));
//			userRepository.save(user);
//			messInsert = "Create New User Sussecs";
//		}
//		if (findUser != null)
//			messInsert = "Create New User Fail! UserId already exist.";
		return messInsert;

	}
	
	public Room searchRoomName(String roomName) {
        Room room = roomRepository.findByRoomName(roomName);
        return room;
    }

}