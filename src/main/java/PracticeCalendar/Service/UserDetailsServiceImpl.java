/*
 * System name: Time record system
 * Company name: ARCH-VN
 * Author: doan-xuanliem
 * Create day: 2017/11/30
 * Version: 1.0
 */

package PracticeCalendar.Service;

import java.util.HashSet;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.UserRepository;

/*
 * Class name: UserDetailsServiceImpl
 *
 * Used in order to lookup the username, password and GrantedAuthorities for any given user
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

     @Autowired
    private UserRepository userRepository;

     /*
      * Method name: loadUserByUsername
      *
      * Locates the user based on the username.
      * Parameters: username
      * Returns: user record
      * Throws: UsernameNotFoundException
      */
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        User user = userRepository.findByUserId(userId);
        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        Role roles = user.getRole();
        grantedAuthorities.add(new SimpleGrantedAuthority(roles.getRoleName()));

        return new org.springframework.security.core.userdetails.User(
                user.getUserName(), user.getPassword(), grantedAuthorities);
    }
}
