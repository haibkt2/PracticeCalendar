package PracticeCalendar.Model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="room_type")
@NamedQuery(name="RoomType.findAll", query="SELECT rt FROM RoomType rt")
public class RoomType implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name="ROOM_TYPE_ID")
    private int roomTypeId;

    @Column(name="ROOM_TYPE_VALUE")
    private String roomTypeValue;

    @OneToMany(mappedBy="roomType")
    private List<Room> rooms;

    public RoomType() {
    }

	public int getRoomTypeId() {
		return roomTypeId;
	}

	public void setRoomTypeId(int roomTypeId) {
		this.roomTypeId = roomTypeId;
	}

	public String getRoomTypeValue() {
		return roomTypeValue;
	}

	public void setRoomTypeValue(String roomTypeValue) {
		this.roomTypeValue = roomTypeValue;
	}

	public List<Room> getRooms() {
		return rooms;
	}

	public void setRooms(List<Room> rooms) {
		this.rooms = rooms;
	}

}