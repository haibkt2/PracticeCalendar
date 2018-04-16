/*
 * System name: Time record system
 * Company name: ARCH-VN
 * Author: doan-xuanliem
 * Create day: 2017/12/04
 * Version: 1.0
 */

package PracticeCalendar.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "devices")
@NamedQuery(name = "Devices.findAll", query = "SELECT d FROM Devices d")
public class Devices implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "DEVICE_ID")
    private String deviceId;

    @Column(name = "DEVICE_CODE")
    private String deviceCode;
    
    @Column(name = "DEVICE_NAME")
    private String deviceName;

    @ManyToOne
    @JoinColumn(name="ROOM_ID")
    private Room room;
    
    @ManyToOne
    @JoinColumn(name="DEVICE_STATUS_ID")
    private DeviceStatus deviceStatus;
    
    public Devices() {
    }

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}

	public String getDeviceCode() {
		return deviceCode;
	}

	public void setDeviceCode(String deviceCode) {
		this.deviceCode = deviceCode;
	}

	public String getDeviceName() {
		return deviceName;
	}

	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}

	public Room getRoom() {
		return room;
	}

	public void setRoom(Room room) {
		this.room = room;
	}

	public DeviceStatus getDeviceStatus() {
		return getDeviceStatus();
	}

	public void setDeviceStatuses(DeviceStatus deviceStatuses) {
		this.deviceStatus = deviceStatuses;
	}

   
}