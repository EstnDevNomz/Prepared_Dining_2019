/* Hide all view for search*/
$('#keyword').mouseenter(function() {
	$('.search_table').show();
	$('.level0').hide();
	$('#logout').hide();
	$('#modify').hide();
	$('.pList').hide();
	$('.reserv-info').hide();
	$('.admin_footer').text('When you move the cursor down, all menus are visible again.');
});
/* Hide search view for all menus*/
$('.admin_footer').mouseenter(function() {
	$('.search_table').hide();
	$('.level0').show();
	$('#logout').show();
	$('#modify').show();
	$('.pList').hide();
	$('.reserv-info').show();
	$('.admin_footer').text('');
});
$('#delete').mouseenter(function() {
	$('.pList').css('display', 'block');
	$('.pList').show();
	$('.search_table').hide();
	$('.level0').hide();
	$('#logout').hide();
	$('#modify').hide();
	$('.reserv-info').hide();
	$('.admin_footer').text('When you move the cursor down, all menus are visible again.');
});

/* Automatic Manuals*/
$('#login').mouseenter(function() {
	$('#footer').text('Click to open the login window.');
});
$('#login').mouseleave(function() {
	$('#footer').text('');
});
$('#join').mouseenter(function() {
	$('#footer').text('Click to open the Sign up window.');
});
$('#join').mouseleave(function() {
	$('#footer').text('');
});
$('#logout').mouseenter(function() {
	$('#footer').text('Click to Sign out.');
});
$('#logout').mouseleave(function() {
	$('#footer').text('');
});
$('#modify').mouseenter(function() {
	$('#footer').text('Click to open the Edit your membership information window.');
});
$('#modify').mouseleave(function() {
	$('#footer').text('');
});
$('#home').mouseenter(function() {
	$('#footer').text('Your current location information.');
});
$('#home').mouseleave(function() {
	$('#footer').text('');
});
$('#cl').mouseenter(function() {
	$('#footer').text('Click to see the location of the store.');
});
$('#cl').mouseleave(function() {
	$('#footer').text('');
});
$('.distance').mouseenter(function() {
	$('#footer').text('Distance information from store to my location');
});
$('.distance').mouseleave(function() {
	$('#footer').text('');
});
$('#menu').mouseenter(function() {
	$('#footer').text('Please select menu to make reservation.');
});
$('#menu').mouseleave(function() {
	$('#footer').text('');
});
$('#reserve').mouseenter(function() {
	$('#footer').text('Click on the picture.');
});
$('#reserve').mouseleave(function() {
	$('#footer').text('');
});
$('.tableImg').mouseenter(function() {
	$('#footer').text('Please select the number of the table you want.');
});
$('.tableImg').mouseleave(function() {
	$('#footer').text('');
});
$('#book').mouseenter(function() {
	$('#footer').text('Please select menu and table before booking');
});
$('#book').mouseleave(function() {
	$('#footer').text('');
});
$('.t1').click(function() {
	$('#footer').text('You have selected table No 1. Please select date.');
});
$('.t1').mouseleave(function() {
	$('#footer').text('');
});
$('.t2').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t2').mouseleave(function() {
	$('#footer').text('');
});
$('.t3').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t3').mouseleave(function() {
	$('#footer').text('');
});
$('.t4').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t4').mouseleave(function() {
	$('#footer').text('');
});
$('.t5').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t5').mouseleave(function() {
	$('#footer').text('');
});
$('.t6').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t6').mouseleave(function() {
	$('#footer').text('');
});
$('.t7').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t7').mouseleave(function() {
	$('#footer').text('');
});
$('.t8').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t8').mouseleave(function() {
	$('#footer').text('');
});
$('.t9').click(function() {
	$('.footer').text('You have selected table No 1. Please select date.');
});
$('.t9').mouseleave(function() {
	$('#footer').text('');
});
$('#today').click(function() {
	$('#footer').text('You chose today. Please select your preferred time.');
});
$('.pList').mouseleave(function() {
	$('#footer').text('');
});
$('#today').mouseenter(function() {
	$('#footer').text('If you press the Cancel button to cancel the reservation.');
});
$('.pList').mouseleave(function() {
	$('#footer').text('');
});

$('.time_admin').mouseenter(function() {
	$('.admin_footer').text('Are you sure you want to delete this time?');
});
$('.time_admin').mouseleave(function() {
	$('.admin_footer').text('');
});

$('.add_cal').mouseenter(function() {
	$('.admin_footer').text('Add an event to this calendar');
});
$('.add_cal').mouseleave(function() {
	$('.admin_footer').text('');
});

$('.addMenu').mouseenter(function() {
	$('.admin_footer').text('Add a Menu to this List');
});
$('.addMenu').mouseleave(function() {
	$('.admin_footer').text('');
});

$('.upload').mouseenter(function() {
	$('.admin_footer').text('Post a promotional video');
});
$('.upload').mouseleave(function() {
	$('.admin_footer').text('');
});