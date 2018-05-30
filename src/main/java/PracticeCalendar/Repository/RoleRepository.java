
package PracticeCalendar.Repository;

import org.springframework.data.repository.CrudRepository;

import PracticeCalendar.Model.Role;


public interface RoleRepository extends CrudRepository<Role, Integer> {
    Role findByRoleName(String roleName);
}
