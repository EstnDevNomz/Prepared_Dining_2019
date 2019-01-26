	  <!-- TODO: Missing CoffeeScript 2 -->
		$(window).load(function(){ 
			$('.listImg').on('click', function(){
				$(this).unbind('click.zoomNotClickable');
				$("#myModal").modal();
			})
		});
		
		$(window).load(function(){ 
			$('.insite').on('click', function(){
				$(this).unbind('click.zoomNotClickable');
				$("#payment").modal();
			})
		});
