
package PracticeCalendar.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="order_calendar")
@NamedQuery(name="OrderCalendar.findAll", query="SELECT oc FROM OrderCalendar oc")
public class OrderCalendar implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="ORDER_ID")
    private String orderId;
    
    @ManyToOne
    @JoinColumn(name="ROOM_ID")
    private Room room;
    
    @Temporal(TemporalType.DATE)
	@Column(name = "DATE_ORDER")
	private Date dateOrder;
    
    @Column(name="TIME_ORDER")
    private String timeOrder;
    
    @ManyToOne
    @JoinColumn(name="USER_ID")
    private User user;
    
    private String creatDate;
    
    private String flg;
    
    private String orderMin;
    
    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public OrderCalendar() {
    }

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}


	public Date getDateOrder() {
		return dateOrder;
	}

	public void setDateOrder(Date dateOrder) {
		this.dateOrder = dateOrder;
	}

	public String getCreatDate() {
		return creatDate;
	}

	public void setCreatDate(String creatDate) {
		this.creatDate = creatDate;
	}

	public String getTimeOrder() {
		return timeOrder;
	}

	public void setTimeOrder(String timeOrder) {
		this.timeOrder = timeOrder;
	}

	public User getUsers() {
		return user;
	}

	public void setUsers(User user) {
		this.user = user;
	}

	public String getFlg() {
		return flg;
	}

	public void setFlg(String flg) {
		this.flg = flg;
	}

	public String getOrderMin() {
		return orderMin;
	}

	public void setOrderMin(String orderMin) {
		this.orderMin = orderMin;
	}
	

}
