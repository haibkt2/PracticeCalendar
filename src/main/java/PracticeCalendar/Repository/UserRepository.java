
package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

    User findByEmail(String email);
    User findByUserName(String userName);
    User findByUserId(String userId);
}
