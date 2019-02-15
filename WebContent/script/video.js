//control filename input form
$('.upload').mouseenter(function() {
	$('.filename').css('display', 'block');
});
$('.upload').click(function() {
	$('.filename').css('display', 'none');
});


function change() {
	var video = document.getElementById("admin-video");
	var filename = $('.filename').val();
	filename = 'videos' +filename.substring(filename.lastIndexOf('\\'), filename.length);	//cut file name
	video.src = filename;
}

$('#play').click(function(){
	var video = document.getElementById("video");
	if(video.paused) {
		$(this).removeClass('glyphicon-play');
		$(this).addClass('glyphicon-pause');
		video.play();
	}else{
		$(this).removeClass('glyphicon-pause');
		$(this).addClass('glyphicon-play');
		video.pause();
	}
});
$('#stop').click(function(){
	var video = document.getElementById("video");
	video.src='';
	
	$('#play').removeClass('glyphicon-pause');
	$('#play').addClass('glyphicon-play');
});

$('.video-js').mouseenter(function() {
	$('.vidOps').css('display', 'block');
});
$('.container-fluid').mouseenter(function() {
	$('.vidOps').css('display', 'none');
});

/*$('.frame').click(function() {
	alert('aaa')
	var audio = document.getElementById("audio-frame");
	audio.play();
});*/