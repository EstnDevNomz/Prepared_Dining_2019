import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class DatePicker {
	
	  public static void main(String[] args) {
		  
		  Date date= new java.util.Date();

		  SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분 ss초 E요일");
		  Date now = new Date();

		  System.out.println(sdf);

		  SimpleDateFormat dayofweek = new SimpleDateFormat("EEE, dd MMM", Locale.ENGLISH);
		  String dow = dayofweek.format(date);
		  String EEE = dow.substring(0, 2);
		  System.out.println("dayofweek : " + dayofweek);



		  System.out.println(now);
		  String strDate = sdf.format(now);
		  System.out.println(strDate);
		  String yyyy = strDate.substring(0, 4);
		  String MM = strDate.substring(6, 8);
		  String dd = strDate.substring(10, 12);
		  String HH = strDate.substring(15, 18);
		  String mm = strDate.substring(19, 22);
		  System.out.println(MM);


		  //count day of week
		  int EEE_n = 0;
		  //convert into Integer type
		  if(EEE.equals("Su")) {
		  	EEE_n = 0;
		  }else if(EEE.equals("Mo")) {
		  	EEE_n = 1;	
		  }else if(EEE.equals("Tu")) {
		  	EEE_n = 2;
		  }else if(EEE.equals("We")) {
		  	EEE_n = 3;
		  }else if(EEE.equals("Th")) {
		  	EEE_n = 4;
		  }else if(EEE.equals("Fr")) {
		  	EEE_n = 5;
		  }else if(EEE.equals("Sa")) {
		  	EEE_n = 6;
		  }else {
		  	System.out.println("fail");
		  }


		  int[] setEEE = new int[20];
		  setEEE[0] = EEE_n;

		  for(int i = 0; i<=6; i++){
		  	
		  	if(i + EEE_n >= 7){
		  			
		  		for(int j=0; j<=6; j++){
		  			setEEE[i++] = j;
		  		}
		  			
		  	}else{
		  		
		  		setEEE[i] = i + EEE_n;
		  	}
		  	
		  }

		  // convert into char type again
		  String EE[] = new String[10];

		  if(setEEE[0] == 0) {
		  	EE[0] = "Su";
		  }else if(setEEE[0] == 1) {
		  	EE[0] = "Mo";
		  }else if(setEEE[0] == 2) {
		  	EE[0] = "Tu";
		  }else if(setEEE[0] == 3) {
		  	EE[0] = "We";
		  }else if(setEEE[0] == 4) {
		  	EE[0] = "Th";
		  }else if(setEEE[0] == 5) {
		  	EE[0] = "Fr";
		  }else if(setEEE[0] == 6) {
		  	EE[0] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  if(setEEE[1] == 0) {
		  	EE[1] = "Su";
		  }else if(setEEE[1] == 1) {
		  	EE[1] = "Mo";
		  }else if(setEEE[1] == 2) {
		  	EE[1] = "Tu";
		  }else if(setEEE[1] == 3) {
		  	EE[1] = "We";
		  }else if(setEEE[1] == 4) {
		  	EE[1] = "Th";
		  }else if(setEEE[1] == 5) {
		  	EE[1] = "Fr";
		  }else if(setEEE[1] == 6) {
		  	EE[1] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  if(setEEE[2] == 0) {
		  	EE[2] = "Su";
		  }else if(setEEE[2] == 1) {
		  	EE[2] = "Mo";
		  }else if(setEEE[2] == 2) {
		  	EE[2] = "Tu";
		  }else if(setEEE[2] == 3) {
		  	EE[2] = "We";
		  }else if(setEEE[2] == 4) {
		  	EE[2] = "Th";
		  }else if(setEEE[2] == 5) {
		  	EE[2] = "Fr";
		  }else if(setEEE[2] == 6) {
		  	EE[2] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  if(setEEE[3] == 0) {
		  	EE[3] = "Su";
		  }else if(setEEE[3] == 1) {
		  	EE[3] = "Mo";
		  }else if(setEEE[3] == 2) {
		  	EE[3] = "Tu";
		  }else if(setEEE[3] == 3) {
		  	EE[3] = "We";
		  }else if(setEEE[3] == 4) {
		  	EE[3] = "Th";
		  }else if(setEEE[3] == 5) {
		  	EE[3] = "Fr";
		  }else if(setEEE[3] == 6) {
		  	EE[3] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  if(setEEE[4] == 0) {
		  	EE[4] = "Su";
		  }else if(setEEE[4] == 1) {
		  	EE[4] = "Mo";
		  }else if(setEEE[4] == 2) {
		  	EE[4] = "Tu";
		  }else if(setEEE[4] == 3) {
		  	EE[4] = "We";
		  }else if(setEEE[4] == 4) {
		  	EE[4] = "Th";
		  }else if(setEEE[4] == 5) {
		  	EE[4] = "Fr";
		  }else if(setEEE[4] == 6) {
		  	EE[4] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }


		  if(setEEE[4] == 0) {
		  	EE[5] = "Su";
		  }else if(setEEE[5] == 1) {
		  	EE[5] = "Mo";
		  }else if(setEEE[5] == 2) {
		  	EE[5] = "Tu";
		  }else if(setEEE[5] == 3) {
		  	EE[5] = "We";
		  }else if(setEEE[5] == 4) {
		  	EE[5] = "Th";
		  }else if(setEEE[5] == 5) {
		  	EE[5] = "Fr";
		  }else if(setEEE[5] == 6) {
		  	EE[5] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }


		  if(setEEE[4] == 0) {
		  	EE[4] = "Su";
		  }else if(setEEE[4] == 1) {
		  	EE[4] = "Mo";
		  }else if(setEEE[4] == 2) {
		  	EE[4] = "Tu";
		  }else if(setEEE[4] == 3) {
		  	EE[4] = "We";
		  }else if(setEEE[4] == 4) {
		  	EE[4] = "Th";
		  }else if(setEEE[4] == 5) {
		  	EE[4] = "Fr";
		  }else if(setEEE[4] == 6) {
		  	EE[4] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }


		  if(setEEE[5] == 0) {
		  	EE[5] = "Su";
		  }else if(setEEE[5] == 1) {
		  	EE[5] = "Mo";
		  }else if(setEEE[5] == 2) {
		  	EE[5] = "Tu";
		  }else if(setEEE[5] == 3) {
		  	EE[5] = "We";
		  }else if(setEEE[5] == 4) {
		  	EE[5] = "Th";
		  }else if(setEEE[5] == 5) {
		  	EE[5] = "Fr";
		  }else if(setEEE[5] == 6) {
		  	EE[5] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  if(setEEE[6] == 0) {
		  	EE[6] = "Su";
		  }else if(setEEE[6] == 1) {
		  	EE[6] = "Mo";
		  }else if(setEEE[6] == 2) {
		  	EE[6] = "Tu";
		  }else if(setEEE[6] == 3) {
		  	EE[6] = "We";
		  }else if(setEEE[6] == 4) {
		  	EE[6] = "Th";
		  }else if(setEEE[6] == 5) {
		  	EE[6] = "Fr";
		  }else if(setEEE[6] == 6) {
		  	EE[6] = "Sa";
		  }else {
		  	System.out.println("fail");
		  }

		  	System.out.println(EE[0]+"요일");

		  //today의 값이 날짜 요일의 기준이되어 윤달까지 정확하게 계산하여 날짜와 요일을 매칭시킨다
		  //convert into Int type from String type
		  	  int year = Integer.parseInt(yyyy);
		  	  int month = Integer.parseInt(MM);
		  	  int today = Integer.parseInt(dd);
		  	  
		  	  int af[] = new int[31];
		  	  af[0] = today;

		  	  
		  	  
		  	  if((month == 1)||(month ==3 )
		  		||(month == 5)||(month == 7)
		  		||(month==8)||(month==10)||(month==12)) {

		  	  	for(int i = 0; i<=5; i++){
		  	  			
		  	  		if(i + today >= 32){
		  	  				
		  	  			for(int j=0; j<=5; j++){
		  	  					
		  	  				af[i++] = j + 1;		
		  	  			}
		  	  				
		  	  		}else{
		  	  			
		  	  			af[i] = i + today;
		  	  			
		  	  		}
		  	  	}
		  	  	
		  	  }else if((month == 4)||(month == 6)
		  			  ||(month == 9)||(month == 11)){
		  	  	
		  	  	for(int i = 0; i<=5; i++){
		  	  		
		  	  		if(i + today >= 31){
		  	  			
		  	  			for(int j=0; j<=5; j++){
		  	  				
		  	  				af[i++] = j + 1;
		  	  			
		  	  			}
		  	  			
		  	  		}else{
		  	  		
		  	  			af[i] = i + today;
		  	  		
		  	  		}
		  	  	}
		  	  	
		  	  }else if(month == 2){
		  		  // 2월 예외처리 cause 윤달
		  		  if((year % 4 == 0 && year % 100 != 0)||(year % 400 == 0)) {
		  			  
		  			  	for(int i = 0; i<=5; i++){
		  			  		
		  			  		if(i + today >= 30){
		  			  			
		  			  			for(int j=0; j<=5; j++){
		  			  				
		  			  				af[i++] = j + 1;
		  			  			
		  			  			}
		  			  			
		  			  		}else{
		  			  		
		  			  			af[i] = i + today;
		  			  			
		  			  		}
		  			  	}			  
		  			  
		  		  }else {
		  			
		  			  	for(int i = 0; i<=5; i++){
		  			  		
		  			  		if(i + today >= 29){
		  			  			
		  			  			for(int j=0; j<=5; j++){
		  			  				
		  			  				af[i++] = j + 1;
		  			  			
		  			  			}
		  			  			
		  			  		}else{
		  			  		
		  			  			af[i] = i + today;
		  			  			
		  			  		}
		  			  	}
		  			  	
		  		  }
		  		  
		  	  }
		  	  
		  	  
		  	  
		  		/* 
		  		 * 
		  		 * Scheduling Time function*/
		  		int[] M_array = new int[1000];
		  		
		  		int m_interval = 30; 	//control time interval
		  		int h_str = 9;	//start hour
		  		int m_str = 20; // start min
		  		int h = 0;
		  		int m = 0;
		  		int rn = 10; //reservation number
		  		String pmam = "AM";
		  		
		  		String[] hours = new String[140];	// array hours
		  		String[] minutes = new String[150]; // array minutes
		  				
		  		//input
		  		for(int i=0; i<=rn; i++) {
		  			M_array[i] = i * m_interval + m_str; // increase minute
		  			
		  		}
		  		//output
		  		for(int i=0; i<=rn; i++) {
		  			h = M_array[i] / 60 + h_str; //hours
		  			m = M_array[i] % 60; //minutes  		
		  			
		  			if( h >= 13) {
		  				h = h - 12;		// Change 12 hour system
		  				//pmam = "PM";	// Change AM --> PM
		  				pmam = "PM";
		  			}
		  			
		  			// attach '0'flag 
		  			String H = String.format("%02d",h);
		  			String M = String.format("%02d", m);
		  			
		  			hours[i] = H;
		  			minutes[i] = M;
		  			
		  			System.out.println(pmam + " " + hours[i] + ":" + minutes[i]);	

		  		}

		  
	  }

}
