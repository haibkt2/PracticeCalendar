package PracticeCalendar.Service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import PracticeCalendar.Model.User;

@Component("javasampleapproachMailSender")
public class EmailService {
	@Autowired
	JavaMailSender javaMailSender;

	@Value("${spring.mail.username}")
	private String username;
	@Value("${string.domain.default}")
	private String domain;
	public void sendMail(String from, String to, String subject, String body) {

		SimpleMailMessage mail = new SimpleMailMessage();
		mail.setFrom(from);
		mail.setTo(to);
		mail.setSubject(subject);
		mail.setText(body);
		javaMailSender.send(mail);
	}

	public Map<String, String> SendMail(User user) {
		Map<String, String> mapSendmail = new HashMap<String, String>();
		mapSendmail.put("mailform", username);
		mapSendmail.put("toMail", user.getUserId()+domain);
		mapSendmail.put("subject", "Password");
		mapSendmail.put("body", "User Id : "+user.getUserId()+" Password : " + user.getPassword());
		return mapSendmail;
	}
	public Map<String, String> SendMailRP(String from, String to, String subject, String body) {
		Map<String, String> mapSendmail = new HashMap<String, String>();
		mapSendmail.put("mailform", from);
		mapSendmail.put("toMail", to);
		mapSendmail.put("subject", subject);
		mapSendmail.put("body", body);
		return mapSendmail;
	}
}