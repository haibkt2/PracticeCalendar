
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
