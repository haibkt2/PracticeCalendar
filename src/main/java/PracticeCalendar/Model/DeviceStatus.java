package PracticeCalendar.Model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "devices_status")
@NamedQuery(name = "DeviceStatus.findAll", query = "SELECT ds FROM DeviceStatus ds")
public class DeviceStatus implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "DEVICE_STATUS_ID")
	private String deviceStatusId;

	@Column(name = "DEVICE_STATUS_VALUE")
	private String deviceStatusValue;
	
	
    @OneToMany(mappedBy="deviceStatus")
    private List<Devices> devices;
	 
	public DeviceStatus() {

	}

	public String getDeviceStatusId() {
		return deviceStatusId;
	}

	public void setDeviceStatusId(String deviceStatusId) {
		this.deviceStatusId = deviceStatusId;
	}

	public String getDeviceStatusValue() {
		return deviceStatusValue;
	}

	public void setDeviceStatusValue(String deviceStatusValue) {
		this.deviceStatusValue = deviceStatusValue;
	}

	public List<Devices> getDevices() {
		return devices;
	}

	public void setDevices(List<Devices> devices) {
		this.devices = devices;
	}

	
}
