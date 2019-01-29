	// previous process
		function init() {
			$('#insite').hide();
			$('.tp').hide(); // hide reserve time
			getDistance();
			$('#inputpay').hide();
			//delay excute
			setTimeout(function() {
				printClock();
			}, 3000);
			
			$('#inputpay').hide();
			$('#pay').hide();
			
			$('.table_1').hide();$('.table_2').hide();$('.table_3').hide();
			$('.table_4').hide();$('.table_5').hide();$('.table_6').hide();
			$('.table_7').hide();$('.table_8').hide();$('.table_9').hide();
			$('.table_10').hide();
			
		};
		
		