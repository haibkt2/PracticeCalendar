package PracticeCalendar.Repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import PracticeCalendar.Model.Notify;

public interface NotifyRepository extends CrudRepository<Notify, Integer> {
	Notify findByNotifyId(String id);
	@Modifying
	@Transactional
	@Query(value="Delete from notify where notify_id = ?1",nativeQuery = true)
    int deleteNotifyId(String notifyId);
}
