
package PracticeCalendar.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import PracticeCalendar.Model.Notify;
import PracticeCalendar.Model.OrderCalendar;
import PracticeCalendar.Model.Request;
import PracticeCalendar.Model.Role;
import PracticeCalendar.Model.Room;
import PracticeCalendar.Model.User;
import PracticeCalendar.Repository.NotifyRepository;
import PracticeCalendar.Repository.RequestRepository;
import PracticeCalendar.Repository.RoleRepository;
import PracticeCalendar.Repository.UserRepository;
import PracticeCalendar.Service.UserServiceImpl;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	UserRepository userRepository;

	@Autowired
	RoleRepository roleRepository;

	@Autowired
	RequestRepository requestRepository;
	@Autowired
	NotifyRepository notifyRepository;

	@Autowired
	MessageSource msgSrc;

	@Autowired
	UserServiceImpl userserviceimpl;
	@Autowired
	ServletContext context;
	@Value("${string.domain.default}")
	private String domain;
	private static final String UPLOAD_DIRECTORY = "d:/server_reponsitory";

	@RequestMapping(value = "/userStatistics", method = RequestMethod.GET)
	public String userStatistics(Model model) {
		List<Request> listReq = (List<Request>) requestRepository.findAll();
		model.addAttribute("listReq", listReq);
		return "userStatistics";
	}

	@RequestMapping(value = "/managementAccount", method = RequestMethod.GET)
	public String managementAccount(Model model, String error, String logout, HttpSession session,
			HttpServletRequest req, HttpServletResponse response) {
		List<User> listUser = (List<User>) userRepository.findAll();
		model.addAttribute("listUser", listUser);
		return "managementAccount";
	}

	@RequestMapping(value = "/managementClass", method = RequestMethod.GET)
	public String managementClass(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
		return "managementClass";
	}

	@RequestMapping(value = "/managementPost", method = RequestMethod.GET)
	public String managementPost(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
		List<Notify> listNt = (List<Notify>) notifyRepository.findAll();
		model.addAttribute("listNt", listNt);
		model.addAttribute("mess_nt", req.getAttribute("mess_nt"));
		return "managementPost";
	}

	// show view form insert formation
	@RequestMapping(value = "/addUser", method = RequestMethod.GET)
	public String registration(Model model, HttpServletRequest request, HttpSession session) {

		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		// set model
		model.addAttribute("lstRole", lstrole);
		model.addAttribute("userForm", new User());
		return "addUser";
	}

	// Insert staff information
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("userForm") User userForm, Model model, HttpSession session)
			throws ParseException {
		List<Role> lstrole = (List<Role>) roleRepository.findAll();
		model.addAttribute("lstRole", lstrole);
		String messageSave = userserviceimpl.insertUser(userForm);
		model.addAttribute("messageSave", messageSave);
		model.addAttribute("userForm", new User());
		return "addUser";
	}

	@RequestMapping(value = "/createNotify", method = RequestMethod.GET)
	public String showNotify(Model model, HttpServletRequest request, HttpSession session) {
		return "createNotify";
	}

	// Insert staff information
	@RequestMapping(value = "/createNotify", method = RequestMethod.POST)
	public String createNotify(Model model, HttpSession session, HttpServletRequest request) throws Exception {
		File uploadDir = new File(UPLOAD_DIRECTORY);
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Notify notify = new Notify();
		User u = (User) session.getAttribute("UserLogin");
		notify.setNotify_id(userserviceimpl.autoCodeNotifyId());
		notify.setCreateDate(userserviceimpl.currentDate());
		notify.setUser(u);
		notify.setNotify_content(content);
		notify.setNotify_title(title);
		userserviceimpl.creNotify(notify);
		model.addAttribute("mess_nt", "sussecess");
		return "redirect:/managementPost";
	}
}
