/*
 * System name: Time record system
 * Company name: ARCH-VN
 * Author: doan-xuanliem
 * Create day: 2017/11/30
 * Version: 1.0
 */

package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Role;

/*
 * Class name: RoleRepository
 *
 * Provide the basic CRUD functions of Role table on a repository
 */
public interface RoleRepository extends CrudRepository<Role, Integer> {

    Role findByRoleName(String roleName);
}
