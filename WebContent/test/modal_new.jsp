<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="//code.jquery.com/jquery-2.2.4.min.js"></script>

<style type="text/css">
#modal-wrapper {
  display: none;
}
#modal-wrapper #modal-overlay {
  position: fixed;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  z-index: 1;
  cursor: pointer;
  background: rgba(0, 0, 0, 0.3);
}
#modal-wrapper #modal-content {
  position: fixed;
  left: 50%;
  top: 50%;
  z-index: 2;
  transform: translate3d(-50%, -50%, 0);
  background: #fff;
  padding: 30px;
  box-shadow: 0 0 5px #000;
}
</style>

</head>
<body>
<div id="modal-wrapper">
  <div id="modal-overlay"></div>
  <div id="modal-content">
    Lorem ipsum Ex ullamco aliqua consectetur reprehenderit irure est Duis consequat...
    나는 모달이시다. 뒤 검정 오버레이를 누르거나 뒤로가기를 눌러서 닫아보아라.
  </div>  
</div>

<button>모달창 열기</button>

<script type="text/javascript">
var modal = {
		  open : function(){
		    $('#modal-wrapper').show();
		  },
		  close : function(){
		    $('#modal-wrapper').hide();    
		  }
		};
		$(document).on('click', '#modal-overlay', function(){
		  window.history.back();   
		}).on('click', 'button', function(){
		  window.history.pushState({}, 'modal', '/modal');
		  modal.open();
		});

		window.onpopstate = history.onpushstate = function(e) {
		    if(window.location.href.split('/').pop().indexOf('modal')===-1){ // 마지막 segment가 cards라면 모달이 아닌 리스트인 상태이어야한다.
		        modal.close(); // 현재의 모달을 닫는다.
		    }
		}
</script>
</body>
</html>