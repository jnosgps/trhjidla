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
		$.post("login/", postdata, function(data, status) {
			if (status == 'success') location.reload(true);
			else alert("Data: " + data + "\nStatus: " + status);
		});
	}
});
$("#logout-a").click(function() {
	$.post('logout/', {'csrfmiddlewaretoken': csrf_token}, function(data, status) {
		if (status == 'success') location.reload(true);
		else alert("Data: " + data + "\nStatus: " + status);
	});
});