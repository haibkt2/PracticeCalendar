package PracticeCalendar.Config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.UserRepository;

@Component
public class CheckAutheticationSuccessHandler implements AuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Autowired
	UserRepository userRepo;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		HttpSession session = request.getSession();
		String userName = auth.getName();
		User loginUser = userRepo.findByUserName(userName);
		session.setAttribute("UserLogin", loginUser);
		if (loginUser.getRole().getRoleName().equals("ROLE_ADMIN"))
			redirectStrategy.sendRedirect(request, response, "/management");
		else if (loginUser.getRole().getRoleName().equals("ROLE_ADMIN"))
			redirectStrategy.sendRedirect(request, response, "/profile");
		else redirectStrategy.sendRedirect(request, response, "/home");
	}
}
