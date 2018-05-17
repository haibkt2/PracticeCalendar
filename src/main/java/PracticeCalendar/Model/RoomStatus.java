package PracticeCalendar.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="room_status")
@NamedQuery(name="RoomStatus.findAll", query="SELECT rst FROM RoomStatus rst")
public class RoomStatus implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="ROOM_STATUS_ID")
    private int roomStatusId;

    @Column(name="ROOM_STATUS_VALUE")
    private String roomStatusValue;

    @OneToMany(mappedBy="roomStatus")
    private List<Room> rooms;

    public RoomStatus() {
    }

	public int getRoomStatusId() {
		return roomStatusId;
	}

	public void setRoomStatusId(int roomStatusId) {
		this.roomStatusId = roomStatusId;
	}

	public String getRoomStatusValue() {
		return roomStatusValue;
	}

	public void setRoomStatusValue(String roomStatusValue) {
		this.roomStatusValue = roomStatusValue;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

	
}