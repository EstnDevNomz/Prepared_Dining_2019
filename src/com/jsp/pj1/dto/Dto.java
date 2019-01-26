package com.jsp.pj1.dto;

import java.sql.Timestamp;

public class Dto {
	// 고객 번호 
	private int customerIndex;
	// 성 
	private String firstName;
	// 이름
	private String lastName;
    // 고객 이메일 
	private String customerEmail;
    // 고객 암호 
	private String customerPwd;
    // 고객 전화번호 
	private String customerPhone;
    // 고객 주소 
	private String customerAddr;
    // 등록 가입일자 
	private Timestamp regJointime;
    // 고객 거리 정보 
	private String customerDistanceInfo;
	
	private String menuImg;
	private String menuName;
	private String content;
	private int price;
	
	
	
	public int getCustomerIndex() {
		return customerIndex;
	}
	public void setCustomerIndex(int customerIndex) {
		this.customerIndex = customerIndex;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getCustomerEmail() {
		return customerEmail;
	}
	public void setCustomerEmail(String customerEmail) {
		this.customerEmail = customerEmail;
	}
	public String getCustomerPwd() {
		return customerPwd;
	}
	public void setCustomerPwd(String customerPwd) {
		this.customerPwd = customerPwd;
	}
	public String getCustomerPhone() {
		return customerPhone;
	}
	public void setCustomerPhone(String customerPhone) {
		this.customerPhone = customerPhone;
	}
	public String getCustomerAddr() {
		return customerAddr;
	}
	public void setCustomerAddr(String customerAddr) {
		this.customerAddr = customerAddr;
	}
	public Timestamp getRegJointime() {
		return regJointime;
	}
	public void setRegJointime(Timestamp regJointime) {
		this.regJointime = regJointime;
	}
	public String getCustomerDistanceInfo() {
		return customerDistanceInfo;
	}
	public void setCustomerDistanceInfo(String customerDistanceInfo) {
		this.customerDistanceInfo = customerDistanceInfo;
	}
	public String getMenuImg() {
		return menuImg;
	}
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
