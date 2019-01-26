//realtime typing action
$('#cdn').change(function(){
	$('#recdn').text($('#cdn').val());
	$('.cdn').val($('#cdn').val());
});

$('#expd').change(function(){
	$('#validthru').text($('#expd').val());
	$('.validthru').val($('#expd').val());
});

$('#cvc').change(function(){
	$('.cvc').val($('#cvc').val());
});

$('#installment').change(function(){
	$('.installment').val($('#installment').val());
});