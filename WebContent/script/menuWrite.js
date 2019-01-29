function change() {
	var filename = document.box.menuImg.value;
	alert(filename)
	filename = filename.substring(filename.lastIndexOf("\\"), filename.length);	//cut file name
	document.box.img.src = "../img/" + filename;	//Input the file Image into 'src' attribute
}

/*
 * submit product write function
 * */
function checkProductWrite () {
	if (document.box.menuImg.value == "") {
		alert("please insert into image");
	} else if (document.box.menuName.value == "") {
		alert("please insert into menu name");
		document.box.menuName.focus();

	} else if (document.box.content.value == "") {
		alert("please insert into content");
		document.menuWrite.content.focus();
	} else if (document.box.price.value == "") {
		alert("please insert into price");
		document.box.price.focus();
	}else {
		document.box.submit();
	}
}