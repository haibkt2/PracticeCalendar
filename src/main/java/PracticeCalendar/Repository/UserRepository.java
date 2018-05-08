
package PracticeCalendar.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

    User findByEmail(String email);
    User findByUserName(String userName);
    User findByUserId(String userId); 
    
    @Query("Select u from User u")
    List<User> findAllUser();
}
