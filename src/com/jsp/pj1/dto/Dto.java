package com.jsp.pj1.dto;

import java.sql.Timestamp;

public class Dto {
	// 怨좉컼 踰덊샇 
	private int customerIndex;
	// �꽦 
	private String firstName;
	// �씠由�
	private String lastName;
    // 怨좉컼 �씠硫붿씪 
	private String customerEmail;
    // 怨좉컼 �븫�샇 
	private String customerPwd;
    // 怨좉컼 �쟾�솕踰덊샇 
	private String customerPhone;
    // 怨좉컼 二쇱냼 
	private String customerAddr;
    // �벑濡� 媛��엯�씪�옄 
	private Timestamp regJointime;
    // 怨좉컼 嫄곕━ �젙蹂� 
	private String customerDistanceInfo;
		
	
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
	
}
