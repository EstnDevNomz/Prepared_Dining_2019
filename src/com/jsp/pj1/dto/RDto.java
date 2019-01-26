package com.jsp.pj1.dto;

import java.sql.Timestamp;

public class RDto {
	private Timestamp b_seq;
	private String t_index;
	private String email;
	private String menuname;
	private String withdraw;
	private String distance;
	private String reserved_wmy;
	private String reserved_day; 
	private String reserved_Time;


	public RDto(Timestamp b_seq, String t_index, String email, String menuname, String withdraw,
			String distance, String reserved_wmy,String reserved_day, String reserved_Time) {
		this.b_seq = b_seq;
		this.t_index = t_index;
		this.email = email;
		this.menuname = menuname;
		this.withdraw = withdraw;
		this.email = email;
		this.distance = distance;
		this.reserved_wmy = reserved_wmy;
		this.reserved_day = reserved_day;
		this.reserved_Time = reserved_Time;
	
	}


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

	public String getWithdraw() {
		return withdraw;
	}


	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
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