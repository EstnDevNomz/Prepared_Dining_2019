function setCookie(c_name,value,exdays)
{
   var exdate=new Date();
   exdate.setDate(exdate.getDate() + exdays);
   var c_value=escape(value) + ((exdays==null) ? "" : ("; expires="+exdate.toUTCString()));
   document.cookie=c_name + "=" + c_value;
}

function getCookie(c_name)
{
   var i,x,y,ARRcookies=document.cookie.split(";");
   for (i=0; i<ARRcookies.length; i++)
   {
      x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
      y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
      x=x.replace(/^\s+|\s+$/g,"");
      if (x==c_name)
      {
        return unescape(y);
      }
   }
}

/* table numbers for bookup */
	$('.t1').click(function(){
		var a = $('.t1').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);		
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t5, .t6, .t7, .t8, .t9').hide();
		$('.table_2, .table_3, .table_4, .table_5, .table_6, .table_7, .table_8, .table_9').hide();
		$('.table_1').css('display', 'block');
		$('.table_1').show();
		
	});
	
	$('.t2').click(function(){
		var a = $('.t2').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t1, .t3, .t4, .t5, .t6, .t7, .t8, .t9').hide();
		$('.table_2, .table_1, .table_4, .table_5, .table_6, .table_7, .table_8, .table_9').hide();
		$('.table_2').css('display', 'block');
		$('.table_2').show();

	});
	
	$('.t3').click(function(){
		var a = $('.t3').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t1, .t4, .t5, .t6, .t7, .t8, .t9').hide();
		$('.table_2, .table_1, .table_4, .table_5, .table_6, .table_7, .table_8, .table_9').hide();
		$('.table_3').css('display', 'block');
		$('.table_3').show();

	});
	
	$('.t4').click(function(){
		var a = $('.t4').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t1, .t5, .t6, .t7, .t8, .t9').hide();
		$('.table_2, .table_3, .table_1, .table_5, .table_6, .table_7, .table_8, .table_9').hide();
		$('.table_4').css('display', 'block');
		$('.table_4').show();

	});
	
	$('.t5').click(function(){
		var a = $('.t5').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t1, .t6, .t7, .t8, .t9').hide();
		$('.table_2, .table_3, .table_4, .table_1, .table_6, .table_7, .table_8, .table_9').hide();
		$('.table_5').show();

	});
	
	$('.t6').click(function(){
		var a = $('.t6').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t5, .t1, .t7, .t8, .t9').hide();
		$('.table_2, .table_3, .table_4, .table_5, .table_1, .table_7, .table_8, .table_9').hide();
		$('.table_6').css('display', 'block');
		$('.table_6').show();

	});
	
	$('.t7').click(function(){
		var a = $('.t7').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t5, .t6, .t1, .t8, .t9').hide();
		$('.table_2, .table_3, .table_4, .table_5, .table_6, .table_1, .table_8, .table_9').hide();
		$('.table_7').css('display', 'block');
		$('.table_7').show();

	});
	
	$('.t8').click(function(){
		var a = $('.t8').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t5, .t6, .t7, .t1, .t9').hide();
		$('.table_2, .table_3, .table_4, .table_5, .table_6, .table_7, .table_1, .table_9').hide();
		$('.table_8').css('display', 'block');
		$('.table_8').show();

	});
	
	$('.t9').click(function(){
		var a = $('.t9').val();
		$('.t_num').val("Table No."+a);
		$('.t_num').text("Table No."+a);
		$('.ptn').text(a);
		alert('Selected No.'+a+' table')
		$('.t2, .t3, .t4, .t5, .t6, .t7, .t8, .t1').hide();
		$('.table_2, .table_3, .table_4, .table_5, .table_6, .table_7, .table_8, .table_1').hide();
		$('.table_9').css('display', 'block');
		$('.table_9').show();

	});
	
	/*	input time	*/
//	$('.time').click(function(){
//		var a = $('.time').val();
//		$('#reserve_time').val(a);
//		$('.reserve_time').val(a);		
//		$('.time').hide();
//	});
	
	//onclick TimePicker
	function time(t) {
		var a = t
		$('.reserve_label').text('book at');
		$('.re_time').text(a);
		$('.reserve_time').val(a);
		$('.reserve_time').text(a);
		$('.time').hide();
		$('.date').hide();
	}
	/*	input day	*/
	$('#today').click(function(){
		var a = 'today';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
		$('.day').val(a);
	});
	$('#manana').click(function(){
		var a = 'manana';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
	});
	$('#third').click(function(){
		var a = 'third';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
	});
	$('#fourth').click(function(){
		var a = 'fourth';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
	});
	$('#fifth').click(function(){
		var a = 'fifth';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
	});
	$('#sixth').click(function(){
		var a = 'sixth';
		$('.re_day').text(a);
		$('.re_day').val(a);
		$('.reserve_day').val(a);
		$('.reserve_day').text(a);
	});
