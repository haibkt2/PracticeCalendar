package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;

public interface RoomRepository extends CrudRepository<Room, Integer>{

	Room findByRoomName(String roomName);

}
