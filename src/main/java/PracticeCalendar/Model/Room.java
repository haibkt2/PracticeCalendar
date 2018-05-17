package PracticeCalendar.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;

@Entity
@NamedQuery(name="Room.findAll", query="SELECT r FROM Room r")
public class Room implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="ROOM_ID")
    private String roomId;

    @Column(name="ROOM_NAME")
    private String roomName;

    private String info;
    
    //bi-directional many-to-one association to Role
    
    @ManyToOne
    @JoinColumn(name="ROOM_TYPE_ID")
    private RoomType roomType;
    
    private String orderMin;
	private String orderMax;
	
	@ManyToOne
    @JoinColumn(name="ROOM_STATUS_ID")
    private RoomStatus roomStatus;
	
    public String getOrderMin() {
		return orderMin;
	}


	public void setOrderMin(String orderMin) {
		this.orderMin = orderMin;
	}


	public String getOrderMax() {
		return orderMax;
	}


	public void setOrderMax(String orderMax) {
		this.orderMax = orderMax;
	}


	public Room() {
    }


	public String getRoomId() {
		return roomId;
	}


	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}


	public String getRoomName() {
		return roomName;
	}


	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}


	

	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public Room getRoom() {
		return getRoom();
	}


	public void setRoom(RoomType roomType) {
		this.roomType = roomType;
	}


	public RoomType getRoomType() {
		return roomType;
	}


	public void setRoomType(RoomType roomType) {
		this.roomType = roomType;
	}


	public RoomStatus getRoomStatus() {
		return roomStatus;
	}


	public void setRoomStatus(RoomStatus roomStatus) {
		this.roomStatus = roomStatus;
	}


}