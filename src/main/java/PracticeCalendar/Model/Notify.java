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
	private String notify_id;

	@Column(name = "NOTIFY_TITLE")
	private String notify_title;
	
	@Column(name = "NOTIFY_CONTENT")
	private String notify_content;
	
	@Temporal(TemporalType.DATE)
    @Column(name="CREATE_DATE")
    private Date createDate;
	
	@ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;

	public String getNotify_id() {
		return notify_id;
	}

	public void setNotify_id(String notify_id) {
		this.notify_id = notify_id;
	}

	public String getNotify_title() {
		return notify_title;
	}

	public void setNotify_title(String notify_title) {
		this.notify_title = notify_title;
	}

	public String getNotify_content() {
		return notify_content;
	}

	public void setNotify_content(String notify_content) {
		this.notify_content = notify_content;
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
