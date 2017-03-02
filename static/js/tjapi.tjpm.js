// POST handlers
$("#tjpm-signin").click(function() {
	if ($('#tjpm-login').val() == '') {}
	else if ($('#tjpm-pass').val() == '') {}
	else {
		var hasher = new jsSHA("SHA-256", "TEXT");
		hasher.update($('#tjpm-pass').val());
		var postdata = {'login': $('#tjpm-login').val(), 'password': hasher.getHash("HEX"), 'csrfmiddlewaretoken': csrf_token};
		$.post("login/", postdata, function(data, status) {
			if (status == 'success') location.reload(true);
			else alert("Data: " + data + "\nStatus: " + status);
		});
	}
});
$("#tjpm-signout").click(function() {
	$.post('logout/', {'csrfmiddlewaretoken': csrf_token}, function(data, status) {
		if (status == 'success') location.reload(true);
		else alert("Data: " + data + "\nStatus: " + status);
	});
});