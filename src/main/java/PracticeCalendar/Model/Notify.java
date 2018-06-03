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
	private String fileDatas;

	public String getFileDatas() {
		return fileDatas;
	}

	public void setFileDatas(String fileDatas) {
		this.fileDatas = fileDatas;
	}

	public String getNotifyId() {
		return notifyId;
	}

	public void setNotifyId(String notifyId) {
		this.notifyId = notifyId;
	}

	public String getNotifyTitle() {
		return notifyTitle;
	}

	public void setNotifyTitle(String notifyTitle) {
		this.notifyTitle = notifyTitle;
	}

	public String getNotifyContent() {
		return notifyContent;
	}

	public void setNotifyContent(String notifyContent) {
		this.notifyContent = notifyContent;
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
