	/* execute modal window from index.jsp*/
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
				$('#payment').modal({backdrop: 'static', keyboard: false}) ;
				$("#payment").modal();
			})
		});
		$(window).load(function(){ 
			$('.tos').on('click', function(){
				$(this).unbind('click.zoomNotClickable');
				$("#tos").modal();
			})
		});
	/*carried in main.jsp */
	function modal_view(menuImg, menuName, content, price) {
		/* function for enter on the HTML*/

		$("#img").attr("src", "img/" + menuImg);
			$("#name").text(menuName);
			$("#mn").val(menuName);	/* hidden value for menuName*/
			$("#pr").val(price);	/* hidden value for menuName*/
			
			$("#content").html(content);
			$("#price").text("$"+ price + " USD");
	}
