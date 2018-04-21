
package PracticeCalendar.Model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

@Entity
@Table(name="devices_order")
@NamedQuery(name="DevicesOrder.findAll", query="SELECT do FROM DevicesOrder do")
public class DevicesOrder implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="DEVICE_ORDER_ID")
    private String deviceOrderId;
    
    @ManyToOne
    @JoinColumn(name="DEVICE_ID")
    private Devices devices;
    
    @Temporal(TemporalType.DATE)
    @Column(name="DATE")
    private Date date;
    
    @Column(name="TIME_ORDER")
    private String timeOrder;
    
    @ManyToOne
    @JoinColumn(name="USER_ID")
    private User users;

    public DevicesOrder() {
    }

	public String getDeviceOrderId() {
		return deviceOrderId;
	}

	public void setDeviceOrderId(String deviceOrderId) {
		this.deviceOrderId = deviceOrderId;
	}

	public Devices getDevices() {
		return devices;
	}

	public void setDevices(Devices devices) {
		this.devices = devices;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getTimeOrder() {
		return timeOrder;
	}

	public void setTimeOrder(String timeOrder) {
		this.timeOrder = timeOrder;
	}

	public User getUsers() {
		return users;
	}

	public void setUsers(User users) {
		this.users = users;
	}

   
}
