package user;

import java.sql.Timestamp;

public class URDto {
	private Timestamp b_seq;
	private String t_index;
	private String email;
	private String menuname;
	private String distance;
	private String reserved_wmy;
	private String reserved_day; 
	private String reserved_Time;


	public Timestamp getB_seq() {
		return b_seq;
	}


	public void setB_seq(Timestamp b_seq) {
		this.b_seq = b_seq;
	}


	public String getT_index() {
		return t_index;
	}


	public void setT_index(String t_index) {
		this.t_index = t_index;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getMenuname() {
		return menuname;
	}


	public void setMenuname(String menuname) {
		this.menuname = menuname;
	}


	public String getDistance() {
		return distance;
	}


	public void setDistance(String distance) {
		this.distance = distance;
	}


	public String getReserved_wmy() {
		return reserved_wmy;
	}


	public void setReserved_wmy(String reserved_wmy) {
		this.reserved_wmy = reserved_wmy;
	}


	public String getReserved_day() {
		return reserved_day;
	}


	public void setReserved_day(String reserved_day) {
		this.reserved_day = reserved_day;
	}


	public String getReserved_Time() {
		return reserved_Time;
	}


	public void setReserved_Time(String reserved_Time) {
		this.reserved_Time = reserved_Time;
	}
	
	
	
	
}