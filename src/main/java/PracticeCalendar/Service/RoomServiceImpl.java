
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

	public List<Room> listRoom(List<Room> listRoom) throws ParseException {
		CommonService cm = new CommonService();
		Date dateCr = cm.currentDate();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

		//
		// for(int i = 0 ; i<7 ;i++) {
		// Date dateSet = new Date(dateCr.getTime() + (1000 * 60 * 60 * 24*i));
		// Date curenddate = dateFormat.parse(dateFormat.format(dm)) ;
		// }
		for (Room room : listRoom) {
			for (int i = 0; i < 7; i++) {
				Date dateSet = new Date(dateCr.getTime() + (1000 * 60 * 60 * 24 * i));
				Date curenddate = dateFormat.parse(dateFormat.format(dateSet));
				room.getOrderCalendar().get(i).setDateOrder(curenddate);
			}
		}
		System.out.println(1);
		return listRoom;

	}

	public Room searchRoomName(String roomName) {
		Room room = roomRepository.findByRoomName(roomName);
		return room;
	}

}