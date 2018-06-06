package PracticeCalendar.Repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import PracticeCalendar.Model.OrderCalendar;

public interface OrderCalendarRepository extends CrudRepository<OrderCalendar, Integer>{
	
	@Query(value = "select od.order_id,od.date_order,od.room_id,od.creat_date,od.time_order,od.user_id from order_calendar as od where od.date_order = ?1 and  od.time_order = ?2 and od.user_id = ?3",nativeQuery = true)
	OrderCalendar findOrdercalendarUser(String day, String time,String userId);
	OrderCalendar findByOrderId(String id);
	
	@Query(value = "SELECT od.user_id,od.order_id,od.creat_date,od.date_order,od.flg,od.time_order,od.room_id "
			+ "FROM user AS u JOIN order_calendar as od "
			+ "ON od.user_id = u.user_id "
			+ "WHERE u.user_id = ?1 and od.flg = '1' ORDER BY od.date_order DESC",nativeQuery = true)
	List<OrderCalendar> findByOrderUser(String userId);
	
	@Modifying
	@Transactional
	@Query(value="Delete from order_calendar where order_id = ?1",nativeQuery = true)
    int deleteOrderId(String orderId);
	
	@Query(value = "select od.order_id,od.date_order,od.room_id,od.creat_date,od.time_order,od.user_id from order_calendar as od where od.date_order = ?1 and  od.time_order = ?2 and od.user_id = ?3 and od.room_id = ?4",nativeQuery = true)
	OrderCalendar findCheckOrdercalendarUser(Date day, String time,String userId,String roomId);
	
	
	@Query(value = "select od.flg,od.order_id,od.date_order,od.room_id,od.creat_date,od.time_order,od.user_id from order_calendar as od where od.room_id = ?1",nativeQuery = true)
	List<OrderCalendar> findOrderByRoom(String roomId);
}
