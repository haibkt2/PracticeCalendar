
package PracticeCalendar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Request;

public interface RequestRepository extends CrudRepository<Request, Integer> {

	Request findByReqId(String reqId);

	@Query(value = "SELECT rq.fl,rq.admin_agree,rq.request_id,rq.user_id,rq.date_req,rq.status,rq.room_id,rq.time_order,rq.creat_date FROM request as rq WHERE rq.status='Waiting' ", nativeQuery = true)
	List<Request> findAllRequest();

	@Query(value = "SELECT rq.fl,rq.admin_agree,rq.request_id,rq.user_id,rq.date_req,rq.status,rq.room_id,rq.time_order,rq.creat_date FROM request as rq WHERE rq.status='Booked' ", nativeQuery = true)
	List<Request> findAllAgree();

	@Modifying
	@Transactional
	@Query(value = "Delete from Request where request_id = ?1", nativeQuery = true)
	int deleteRequest(String idRq);

	@Query(value = "SELECT rq.fl,rq.admin_agree,rq.request_id,rq.user_id,rq.date_req,rq.status,rq.room_id,rq.time_order,rq.creat_date,u.name "
			+ "from request as rq join user as u "
			+ "on u.user_id = rq.user_id "
			+ "where u.user_id = ?1", nativeQuery = true)
	List<Request> findByRqUser(String userId);
}
