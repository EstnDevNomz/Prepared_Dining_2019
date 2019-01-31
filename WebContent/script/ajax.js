		var request = new XMLHttpRequest();
		
		function searchProcess() {
			var AT = document.getElementById("ajaxTable");
			AT.innerHTML = "";
			
			//접속상태 확인
			if(request.readyState = 4 && request.status == 200) {
				var object = eval('(' + request.responseText + ')'); //받아온 객체를 제이슨으로 변환
				var result = object.result;
				
				// 셀구성
				for(var i = 0; i < result.length; i++) {
					var row = AT.insertRow(0);
					
					for(var j = 0; j < result[i].length; j++) {
						
						var cell = row.insertCell(j);
						cell.innerHTML = '<br />' + result[i][j].value + '<br />';
						
					}
				}
			}
		}
		window.onload = function() {
			searchFunction();
		}
		
		$('.cs').click(function (){
			alert('a');
			var url = $(this).attr("id");
			alert(url);
			
		});
		
		function searchFunction() {	
			request.open("Post", "./index.com?keyword=" + encodeURIComponent(document.getElementById("keyword").value), true);
			request.onreadystatechange = searchProcess;
			request.send(null);
	
		}	
		function cancel() {		
			request.open("Post", "./cancel.com?bseq=" + encodeURIComponent($('.bseq').val()), true);
			request.onreadystatechange = searchProcess;
			request.send(null);
			alert("Canceled reservation number "+ $('.bseq').val());
			setTimeout(function() {
					self.location.reload();
			}, 500);
		
		}	
		function deleteProduct() {
			request.open("Post", "./deleteMenu.com?menuname=" + encodeURIComponent($('#mn').val()), true);
			request.send(null);
			alert('Deleted menu ' + $('#mn').val())
		
		}
		function deleteCalendar(table, time, day) {
			request.open("Post", "./deleteCalendar.com?table=Table No." + encodeURIComponent(table) + "&time=" + encodeURIComponent(time) + "&day=" + encodeURIComponent(day), true);
			request.send(null);
			alert("Deleted Table No." + table + " " + day + " " + time)
			
			setTimeout(function() {
				self.location.reload();
			}, 500);
			
		}
		function insertVideo() {
			var filename = $('.filename').val()
			filename = "videos" + filename.substring(filename.lastIndexOf('\\'), filename.length);
			request.open("Post", "./insertVideo.com?filename=" + encodeURIComponent(filename), true);
			request.send(null);
			alert("insertVideo().filename : " + filename);
		}
		
		
		
		