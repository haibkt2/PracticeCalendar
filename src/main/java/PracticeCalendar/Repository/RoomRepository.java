package PracticeCalendar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Room;

public interface RoomRepository extends CrudRepository<Room, Integer>{

	Room findByRoomName(String roomName);
	
	@Query(value ="select room.room_id ,room.room_status_id, room.room_type_id,room.info,room.room_name, room.order_max, tbv.time_order,tbv.min_order, room_type.room_type_value, room_status.room_status_value from room "
			+ "left join " + 
			"(SELECT count(order_calendar.date_order) as min_order , order_calendar.ROOM_ID, order_calendar.time_order  FROM order_calendar where order_calendar.date_order = ?1 group by order_calendar.ROOM_ID,order_calendar.date_order  ) as tbv on tbv.ROOM_ID = room.ROOM_ID " 
			+ "join room_type on room.room_type_id = room_type.room_type_id "  
			+ "join room_status on room_status.room_status_id = room.room_status_id", nativeQuery = true)
	List<Room> findByOrderTime(String dateOrder);

}
