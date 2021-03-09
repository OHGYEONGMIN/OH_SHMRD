package Model;

public class ElectricVO {
	String room,item_name, day,use_hour,use_wh;

	public ElectricVO(String room, String item_name, String day, String use_hour, String use_wh) {
		super();
		this.room = room;
		this.item_name = item_name;
		this.day = day;
		this.use_hour = use_hour;
		this.use_wh = use_wh;
	}
	
	

	public ElectricVO(String room, String use_wh) {
		super();
		this.room = room;
		this.use_wh = use_wh;
	}



	public ElectricVO() {
	}



	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getUse_hour() {
		return use_hour;
	}

	public void setUse_hour(String use_hour) {
		this.use_hour = use_hour;
	}

	public String getUse_wh() {
		return use_wh;
	}

	public void setUse_wh(String use_wh) {
		this.use_wh = use_wh;
	}
	
	
}
