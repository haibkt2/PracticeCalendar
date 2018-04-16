/*
 * System name: Time record system
 * Company name: ARCH-VN
 * Author: doan-xuanliem
 * Create day: 2017/11/30
 * Version: 1.0
 */

package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.User;

/*
 * Class name: UserDetailsServiceImpl
 *
 * Provide the basic CRUD functions of Role table on a repository
 */
public interface UserRepository extends CrudRepository<User, Integer> {

    User findByEmail(String email);
    User findByUserName(String userName);
    User findByUserId(String userId);
}
