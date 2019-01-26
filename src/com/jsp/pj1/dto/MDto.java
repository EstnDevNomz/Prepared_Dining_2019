package com.jsp.pj1.dto;

public class MDto {
	//menu
	private int seq;
	private String menuImg;
	private String menuName;
	private String content;
	private String price;
	
	public MDto(int seq, String menuImg, String menuName, String content, String price) {
		// TODO Auto-generated constructor stub
		this.menuImg = menuImg;
		this.menuName = menuName;
		this.content = content;
		this.price = price;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	
}
