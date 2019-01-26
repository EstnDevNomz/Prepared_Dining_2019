function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(position) {
	      var locationInfo = position.coords.latitude + ' ' + position.coords.longitude;
	      alert(locationInfo);
	      $('.location').val(locationInfo)
	    }, function(error) {
	      console.error(error);
	    }, {
	      enableHighAccuracy: true,
	      maximumAge: 0,
	      timeout: Infinity
	    });
	  } else {
	    alert('GPS를 지원하지 않습니다');
	  }
	}
	getLocation();