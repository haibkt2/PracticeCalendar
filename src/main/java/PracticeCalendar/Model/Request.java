
package PracticeCalendar.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "Request")
@NamedQuery(name = "Request.findAll", query = "SELECT rq FROM Request rq")
public class Request implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "REQUEST_ID")
	private String reqId;

	@ManyToOne
	@JoinColumn(name = "ROOM_ID")
	private Room rooms;

	@Temporal(TemporalType.DATE)
	@Column(name = "DATE_REQ")
	private Date dateReq;

	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private User user;

	private String creatDate;

	private String status;
	private String timeOrder;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Request() {
	}

	public String getReqId() {
		return reqId;
	}

	public void setReqId(String reqId) {
		this.reqId = reqId;
	}

	public Room getRoom() {
		return rooms;
	}

	public void setRoom(Room room) {
		this.rooms = room;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTimeOrder() {
		return timeOrder;
	}

	public void setTimeOrder(String timeOrder) {
		this.timeOrder = timeOrder;
	}

	public Date getDateReq() {
		return dateReq;
	}

	public void setDateReq(Date dateReq) {
		this.dateReq = dateReq;
	}

	public String getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}

	public String getFlg() {
		return status;
	}

	public void setFlg(String status) {
		this.status = status;
	}

}