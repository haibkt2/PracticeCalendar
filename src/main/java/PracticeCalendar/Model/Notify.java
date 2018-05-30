package PracticeCalendar.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Entity
@NamedQuery(name="Notify.findAll", query="SELECT n FROM Notify n")
public class Notify implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "NOTIFY_ID")
	private String notifyId;

	@Column(name = "NOTIFY_TITLE")
	private String notifyTitle;
	
	@Column(name = "NOTIFY_CONTENT")
	private String notifyContent;
	
	@Temporal(TemporalType.DATE)
    @Column(name="CREATE_DATE")
    private Date createDate;
	
	@ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;
	private CommonsMultipartFile[] fileDatas;
	public CommonsMultipartFile[] getFileDatas() {
		return fileDatas;
	}

	public void setFileDatas(CommonsMultipartFile[] fileDatas) {
		this.fileDatas = fileDatas;
	}

	public String getNotify_id() {
		return notifyId;
	}

	public void setNotify_id(String notify_id) {
		this.notifyId = notify_id;
	}

	public String getNotify_title() {
		return notifyTitle;
	}

	public void setNotify_title(String notify_title) {
		this.notifyTitle = notify_title;
	}

	public String getNotify_content() {
		return notifyContent;
	}

	public void setNotify_content(String notify_content) {
		this.notifyContent = notify_content;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	
}
