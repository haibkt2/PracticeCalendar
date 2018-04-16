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
@NamedQuery(name="Feedback.findAll", query="SELECT n FROM Feedback n")
public class Feedback implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name = "Feedback_ID")
	private String Feedback_id;

	@Column(name = "Feedback_TITLE")
	private String Feedback_title;
	
	@Column(name = "Feedback_CONTENT")
	private String Feedback_content;
	
	@Temporal(TemporalType.DATE)
    @Column(name="CREATE_DATE")
    private Date createDate;
	
	@ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;

	public String getFeedback_id() {
		return Feedback_id;
	}

	public void setFeedback_id(String Feedback_id) {
		this.Feedback_id = Feedback_id;
	}

	public String getFeedback_title() {
		return Feedback_title;
	}

	public void setFeedback_title(String Feedback_title) {
		this.Feedback_title = Feedback_title;
	}

	public String getFeedback_content() {
		return Feedback_content;
	}

	public void setFeedback_content(String Feedback_content) {
		this.Feedback_content = Feedback_content;
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
