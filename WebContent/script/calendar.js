				
	var reArray = new Array();

		$('#basket').click(function() {
			$('#bkTitle').hide();
			$('#insite').show();			
		});

		$('#book').click(function() {
			

		});
		$('.time').click(function() {
			$('.re-label').css('display', 'block');
		});
		$('#today').click(function() {
			// reset color
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			// convert color
			$('#today').css('background-color', '#fb6974');
			$('#today').css('color', 'white');
			$('.tp').hide();
			$('.timepicker0').show();
		});
		$('#manana').click(function() {
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			
			$('#manana').css('background-color', '#fb6974');
			$('#manana').css('color', 'white');
			
			$('.tp').hide();
			$('.timepicker1').show();
		});
		$('#third').click(function() {
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			
			$('#third').css('background-color', '#fb6974');
			$('#third').css('color', 'white');
			
			$('.tp').hide();
			$('.timepicker2').show();

		});
		$('#fourth').click(function() {
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			
			$('#fourth').css('background-color', '#fb6974');
			$('#fourth').css('color', 'white');
			
			$('.tp').hide();
			$('.timepicker3').show();

		});
		$('#fifth').click(function() {
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			
			$('#fifth').css('background-color', '#fb6974');
			$('#fifth').css('color', 'white');
		
			$('.tp').hide();
			$('.timepicker4').show();

		});
		$('#sixth').click(function() {	
			$('.date_f').css('background-color', '#F6F5F4');
			$('.admin_date_sh').css('background-color', '#000');
			$('.date_f').css('color', '#aaaaaa');
			$('.admin_date_f').css('color', '#aaaaaa');
			
			$('#sixth').css('background-color', '#fb6974');
			$('#sixth').css('color', 'white');
			
			$('.tp').hide();
			$('.timepicker5').show();

		});	
		$('.tp').click(function() {	
			$('.reCon').css('display', 'block');
		});
		