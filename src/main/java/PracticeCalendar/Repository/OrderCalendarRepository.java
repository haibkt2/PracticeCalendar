package PracticeCalendar.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.OrderCalendar;

public interface OrderCalendarRepository extends CrudRepository<OrderCalendar, Integer>{
	
	@Query(value = "select od.order_id,od.date_order,od.room_id,od.creat_date,od.time_order,od.user_id from order_calendar as od where od.date_order = ?1 and  od.time_order = ?2 and od.user_id = ?3",nativeQuery = true)
	OrderCalendar findOrdercalendarUser(String day, String time,String userId);
	OrderCalendar findByOrderId(String id);
}
