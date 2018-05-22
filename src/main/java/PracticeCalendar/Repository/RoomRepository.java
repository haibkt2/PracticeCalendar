package PracticeCalendar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Room;

public interface RoomRepository extends CrudRepository<Room, Integer> {

	Room findByRoomName(String roomName);

	@Query(value = "SELECT rod.room_type_id,rod.room_id ,rod.room_status_id, rod.room_type_value,rod.info,rod.room_name, rod.order_max , rod.room_status_value,od.time_order "
			+ "FROM (SELECT r.room_type_id,r.room_id ,r.room_status_id,r.info,r.room_name, rs.room_status_value, r.order_max,rt.room_type_value "
			+ "FROM room AS r JOIN room_type AS rt ON rt.room_type_id =r.room_type_id "
			+ "JOIN room_status as rs ON rs.room_status_id = r.room_status_id ) AS rod "
			+ "LEFT JOIN (SELECT od.room_id, od.date_order,od.time_order "
			+ "FROM order_calendar as od WHERE od.date_order =?1 ) AS od ON rod.room_id = od.room_id "
			+ "WHERE rod.room_type_value=?2",nativeQuery = true)
	List<Room> findByOrderTime(String date,String tyVl);
	@Query(value = "SELECT r.room_status_id,r.room_id,r.info,r.room_name,r.order_max,r.room_type_id "
			+ "FROM room AS r "
			+ "JOIN room_type AS rt "
			+ "ON r.room_type_id = rt.room_type_id "
			+ "WHERE rt.room_type_value = ?1", nativeQuery = true)
	List<Room> findAllRoom(String string);

}
