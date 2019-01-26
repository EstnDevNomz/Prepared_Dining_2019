package com.jsp.pj1.dto;

public class CDto {
	// 테이블번호
	private String calendarTable;
	
    // 일정 일자 
    private String calendarDay;

    // 일정 시간 
    private String calendarTime;
	
	public CDto(String calendarTable, String calendarDay, String calendarTime) {
		this.calendarTable= calendarTable;
		this.calendarDay = calendarDay;
		this.calendarTime = calendarTime;
		
	}


    public String getCalendarTable() {
		return calendarTable;
	}


	public void setCalendarTable(String calendarTable) {
		this.calendarTable = calendarTable;
	}


	public String getCalendarDay() {
        return calendarDay;
    }

    public void setCalendarDay(String calendarDay) {
        this.calendarDay = calendarDay;
    }

    public String getCalendarTime() {
        return calendarTime;
    }

    public void setCalendarTime(String calendarTime) {
        this.calendarTime = calendarTime;
    }

}
