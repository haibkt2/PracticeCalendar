
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
import PracticeCalendar.Repository.RoomRepository;
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
	RoomRepository roomRepository;
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
		List<Request> listReq = (List<Request>) requestRepository.findAllRequest();
		List<Request> listAgr = (List<Request>) requestRepository.findAllAgree();
		model.addAttribute("listReq", listReq);
		model.addAttribute("listAgr", listAgr);
		return "userStatistics";
	}

	@RequestMapping(value = "/responseRequest", method = RequestMethod.GET)
	public String responseRequest(Model model, HttpServletRequest request, HttpSession session) {
		String agree = request.getParameter("agree");
		User u = (User) session.getAttribute("UserLogin");
		String disagree = request.getParameter("disagree");
		if (agree != null) {
			Request rq = requestRepository.findByReqId(agree);
			if (rq != null) {
				rq.setStatus("Booked");
				rq.setAdminAgree(u.getName());
				requestRepository.save(rq);
			}
		} else {
			Request rq = requestRepository.findByReqId(disagree);
			if (rq != null) {
				requestRepository.deleteRequest(rq.getReqId());
			}
		}
		return "redirect:/userStatistics";
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.POST)
	public String updatePost(@ModelAttribute("notifyForm") Notify notifyForm, Model model, HttpSession session,
			HttpServletRequest request) throws ParseException {
		User u = (User) session.getAttribute("UserLogin");
		notifyForm.setCreateDate(userserviceimpl.currentDate());
		notifyForm.setUser(u);
		model.addAttribute("mess_nt", "sussecess");
		Notify nt = notifyRepository.findByNotifyId(notifyForm.getNotifyId());
		if (nt != null)
			notifyRepository.save(notifyForm);
		notifyRepository.save(notifyForm);
		return "redirect:/managementPost?mess_nt=sussecess";
	}

	@RequestMapping(value = "/updatePost", method = RequestMethod.GET)
	public String updateInfoPost(Model model, HttpServletRequest request,
			@ModelAttribute("notifyForm") final Notify notifyForm) {
		// get parameter date
		String notifyIdUp = request.getParameter("updatePid");
		String notifyIdDel = request.getParameter("deletePid");
		if (notifyIdDel != null) {
			notifyRepository.deleteNotifyId(notifyIdDel);
			return "redirect:/managementPost?mess_nt=delss";
		} else {
			Notify notify = new Notify();
			notify = notifyRepository.findByNotifyId(notifyIdUp);
			model.addAttribute("notifyForm", notify);
			String mess = request.getParameter("mess_nt");
			if (mess != null)
				model.addAttribute("mess_nt", mess);
			return "updatePost";
		}
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
		List<Room> listRm = (List<Room>) roomRepository.findAll();
		model.addAttribute("listRm", listRm);
		return "managementClass";
	}

	@RequestMapping(value = "/managementPost", method = RequestMethod.GET)
	public String managementPost(Model model, String error, String logout, HttpSession session, HttpServletRequest req,
			HttpServletResponse response) {
		List<Notify> listNt = (List<Notify>) notifyRepository.findAll();
		model.addAttribute("listNt", listNt);
		model.addAttribute("mess_nt", req.getParameter("mess_nt"));
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
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Notify notify = new Notify();
		User u = (User) session.getAttribute("UserLogin");
		notify.setNotifyId(userserviceimpl.autoCodeNotifyId());
		notify.setCreateDate(userserviceimpl.currentDate());
		notify.setUser(u);
		notify.setNotifyContent(content);
		notify.setNotifyTitle(title);
		userserviceimpl.creNotify(notify);
		model.addAttribute("mess_nt", "sussecess");
		return "redirect:/managementPost?mess_nt=sussecess";
	}
}
