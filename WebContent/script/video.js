$('.upload').mouseenter(function() {
	$('.filename').css('display', 'block');
});

function change() {
	var video = document.getElementById("video");
	var filename = $('.filename').val();
	filename = 'videos' +filename.substring(filename.lastIndexOf('\\'), filename.length);	//cut file name
	video.src = filename;
	alert(filename);
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