package PracticeCalendar.Service;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class CommonService {
	public Date currentDate() throws ParseException {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		Date dateCurrent = dateFormat.parse(dateFormat.format(date));
		return dateCurrent;
	}

	public String setPassword(int length) {
		String alphanum = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		int randomInt = 0;
		Random randomGenerator = new Random();
		StringBuffer password = new StringBuffer();
		for (int i = 0; i < length; i++) {
			randomInt = randomGenerator.nextInt(alphanum.length() - 1);
			char ch = alphanum.charAt(randomInt);
			password.append(ch);
		}
		return password.toString();
	}
}