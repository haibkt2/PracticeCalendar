package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Notify;

public interface NotifyRepository extends CrudRepository<Notify, Integer> {
	Notify findByNotifyId(String id);
}
