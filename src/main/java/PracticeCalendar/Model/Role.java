
package PracticeCalendar.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@NamedQuery(name="Role.findAll", query="SELECT r FROM Role r")
public class Role implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="ROLE_ID", insertable=false, updatable=false)
    private int roleId;

    @Column(name="ROLE_NAME")
    private String roleName;

    @OneToMany(mappedBy="role")
    private List<User> users;

    public Role() {
    }

    public int getRoleId() {
        return this.roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return this.roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<User> getUsers() {
        return this.users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public User addUsers(User users) {
        getUsers().add(users);
        users.setRole(this);
        return users;
    }

    public User removeUsers(User users) {
        getUsers().remove(users);
        users.setRole(null);
        return users;
    }
}
