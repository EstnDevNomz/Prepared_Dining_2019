<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head> 
  <title>Geolocation Demo</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <script type="text/javascript" src="//code.jquery.com/jquery-2.1.0.js"></script> 
</head>
<body onload="getDistance()"> 
 
  <h1>Geolocation Demo</h1>
  <div id="tripmeter"> 
  <input type="text" id="a" value=" ">
    <p> 
      시작 위치 (위도, 경도):<br/> 
      <span id="startLat"></span>°, <span id="startLon"></span>°
    </p> 
    <p> 
      현재 위치  (위도, 경도):<br/> 
      <span id="currentLat"></span>°, <span id="currentLon"></span>°
    </p> 
    <p> 
      시작 위치로 부터의 거리:<br/> 
      <span id="distance">0</span> km
    </p> 
  </div> 
 
  <script> 
    function getDistance() {
      var startPos;
       
      if (navigator.geolocation) { 
        navigator.geolocation.getCurrentPosition(function(position) {
          startPos = position;
         // $('#a').text('startPos.coords.latitude');
         $('#a').val(startPos.coords.latitude);
         // document.getElementById("a").value = startPos.coords.latitude;
          document.getElementById("startLat").innerHTML = startPos.coords.latitude;
          document.getElementById("startLon").innerHTML = startPos.coords.longitude;
        }, function(error) {
          alert("Error occurred. Error code: "+error.code);
        });
    
        navigator.geolocation.watchPosition(function(position) {
          document.getElementById("currentLat").innerHTML = position.coords.latitude;
          document.getElementById("currentLon").innerHTML = position.coords.longitude;
          document.getElementById("distance").innerHTML =
            calculateDistance(startPos.coords.latitude, startPos.coords.longitude,
            				  37.508286743400000, 126.73514674630000);/*<-- store location*/
       					   /* position.coords.latitude, position.coords.longitude); */
        });
      }
    };
    // Reused code - copyright Moveable Type Scripts - retrieved May 4, 2010.
    // http://www.movable-type.co.uk/scripts/latlong.html
    // Under Creative Commons License http://creativecommons.org/licenses/by/3.0/
    function calculateDistance(lat1, lon1, lat2, lon2) {
      var R = 6371; // km
      var dLat = (lat2-lat1).toRad();
      var dLon = (lon2-lon1).toRad(); 
      var a = Math.sin(dLat/2) * Math.sin(dLat/2) +
              Math.cos(lat1.toRad()) * Math.cos(lat2.toRad()) * 
              Math.sin(dLon/2) * Math.sin(dLon/2); 
      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
      var d = R * c;
      return d;
    }
    Number.prototype.toRad = function() {
      return this * Math.PI / 180;
    }
  </script> 
 
</body>

</html>