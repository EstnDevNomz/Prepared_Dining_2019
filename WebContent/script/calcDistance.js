/*
 * Calculate Distance to my location from store
 * 
 * */

function getDistance() {
      var startPos;
       
      if (navigator.geolocation) { 
        navigator.geolocation.getCurrentPosition(function(position) {
          startPos = position;
         // $('#a').text('startPos.coords.latitude');
         //$('#startLat').text(startPos.coords.latitude);
        // $('#startLon').text(startPos.coords.longitude);
          document.getElementById("startLat").innerHTML = startPos.coords.latitude;
          document.getElementById("startLon").innerHTML = startPos.coords.longitude;
          document.getElementById("a").value = startPos.coords.latitude;
          document.getElementById("b").value = startPos.coords.longitude;
        }, function(error) {
          alert("Error occurred. Error code: "+error.code);
        });
    
        navigator.geolocation.watchPosition(function(position) {
         // $('#currentLat').text(startPos.coords.latitude);
         // $('#currentLon').text(startPos.coords.longitude);
         /* $('#distance').val(calculateDistance(startPos.coords.latitude, startPos.coords.longitude,
				  37.508286743400000, 126.73514674630000));*/	/*	<-- store location	*/

          var calc =  calculateDistance(startPos.coords.latitude, startPos.coords.longitude,
            				  37.508286743400000, 126.73514674630000);
       					   /* position.coords.latitude, position.coords.longitude); */
          calc = calc.toString();
          document.getElementById("currentLat").innerHTML = 37.508286743400000;
          document.getElementById("currentLon").innerHTML = 126.73514674630000;
          calc1 = calc.substr(0,7);
          calc2 = calc.substr(0,4);
          
          document.getElementById("distance").value = calc1;
          $('.distance').text(calc2 + "km");
          document.getElementById("dist").value = calc1;   

        });
      }
    };
    
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
    
    
    // bring data of .distance into the paymentMainForm
    
    function distance() {
    	alert($('.distance').val());
    	$('.dist').val($('.distance').val());
    }
    