// trhJidla.cz JS API - Version 1

$('.dropdown').on('show.bs.dropdown', function() {
	$(this).find('.dropdown-menu').first().stop(true, true).slideDown();
});

$('.dropdown').on('hide.bs.dropdown', function() {
	$(this).find('.dropdown-menu').first().stop(true, true).slideUp();
});

$('#algo-hash').hide();
$('#algo').on('click', function() {
	var q = prompt('Co chceš zahashovat?');
	if (q) {
		$.get('algo/?q=' + q, function(data, status) {
			if (status == 'success') {
				alert(data)
			}
		});
	}
});


// POST handlers
$("#login-a").click(function() {
	if ($('#login-login').val() == '') {}
	else if ($('#login-password').val() == '') {}
	else {
		var hasher = new jsSHA("SHA-256", "TEXT");
		hasher.update($('#login-password').val());
		var postdata = {'login': $('#login-login').val(), 'password': hasher.getHash("HEX"), 'csrfmiddlewaretoken': csrf_token};
		$.post("/shop1/login/", postdata, function(data, status) {
			if (status == 'success') location.reload(true);
			else alert("Data: " + data + "\nStatus: " + status);
		});
	}
});
$("#logout-a").click(function() {
	$.post('/shop1/logout/', {'csrfmiddlewaretoken': csrf_token}, function(data, status) {
		if (status == 'success') location.reload(true);
		else alert("Data: " + data + "\nStatus: " + status);
	});
});


$('.addToCart').on('click', function() {
	var postdata = {'productId': $(this).data('productid'), 'productValue': $(this).data('productvalue'), 'csrfmiddlewaretoken': csrf_token};
	//console.log(postdata)
	$.post('/shop1/addToCart/', postdata, function(data, status) {
		if (status == 'success') location.reload(true);
		else alert("Data: " + data + "\nStatus:" + status);
	});
});


$('.cartItemRemove').on('click', function() {
	var itemId = $(this).data.itemid;
	$.get('/shop1/cartItemRemove/' + itemId + '/', function(data, status) {
		if (status == 'success') location.reload(true);
		else alert('Data: ' + data + '\nStatus: ' + status);
	});
});


$('.backbutton').on('click', function() {
	window.history.back();
});
$('.twobackbutton').on('click', function() {
	window.history.go(-2);
});