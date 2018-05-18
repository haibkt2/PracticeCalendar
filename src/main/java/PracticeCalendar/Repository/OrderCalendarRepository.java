package PracticeCalendar.Repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Room;

public interface OrderCalendarRepository extends CrudRepository<OrderCalendar, Integer>{
	
}
