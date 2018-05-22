
package PracticeCalendar.Repository;


import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Request;

public interface RequestRepository extends CrudRepository<Request, Integer> {

    Request findByReqId(String reqId);
}
