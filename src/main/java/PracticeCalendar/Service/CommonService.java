package PracticeCalendar.Service;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Random;

import com.mysql.fabric.xmlrpc.base.Array;

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

	public String getDayOfWeekName(String year, String month, String date, Locale locale) {
		Calendar cal = initDate(year, month, date);
		return cal.getDisplayName(Calendar.DAY_OF_WEEK, Calendar.SHORT, locale);
	}

	public Calendar initDate(String year, String month, String date) {
		int _year = Integer.parseInt(year);
		int _month = Integer.parseInt(month);
		int _date = Integer.parseInt(date);
		Calendar cal = Calendar.getInstance();
		cal.setFirstDayOfWeek(Calendar.MONDAY);
		cal.set(_year, _month - 1, _date);
		return cal;
	}

	public List<String> setDay() {
		List<String> setDay = new ArrayList<>();
		CommonService cmsv = new CommonService();
		Date crdate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");
		for (int i = 0; i < 7; i++) {
			Date d_set = new Date(crdate.getTime() + (1000 * 60 * 60 * 24 * i));
			String crday[] = simpleDateFormat.format(d_set).split("/");
			String Yeart = crday[0];
			String Month = crday[1];
			String Day = crday[2];
			String dayOfW = cmsv.getDayOfWeekName(Yeart, Month, Day, new Locale("en"));
			setDay.add(dayOfW + " " + Day + "-" + Month);
		}
		return setDay;
	}

	public String autoOrderId(String orderId) {
		String strorderid = orderId.substring(5, 9);
		int odId = Integer.parseInt(strorderid);
		++odId;
		String countUserId = "" + odId;
		if (countUserId.trim().length() != 4) {
			int count = 4 - countUserId.trim().length();
			for (int i = 0; i < count; i++) {
				countUserId = "0" + countUserId;
			}
		}
		return "ORDER".concat("" + countUserId);
	}

	public Date setDateOrder(String date) {
		String d = date.split("-")[1];
		String m = date.split("-")[0];
		Date day = null;
		Calendar myCal = Calendar.getInstance();
		myCal.setTime(day);
		int year = myCal.get(Calendar.YEAR);
		myCal.set(year,Integer.parseInt(m),Integer.parseInt(d));
		day =  myCal.getTime();
		return day;
	}

}