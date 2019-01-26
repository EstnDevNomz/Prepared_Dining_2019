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
			
		};
		
		