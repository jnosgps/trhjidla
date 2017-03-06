// POST handlers
var hasher = new jsSHA("SHA-256", "TEXT");
$('.login-form').on('submit', false);

$("#tjpm-signin").on('click', function(e) {
	e.preventDefault();
	console.log('SignIn called...');
	if ($('#tjpm-login').val() == '') {
		console.log('tjpm-login is blank...');}
	else if ($('#tjpm-pass').val() == '') {
		console.log('tjpm-pass is blank...');}
	else {
		console.log('doing login...');
		hasher.update($('#tjpm-pass').val());
		var postdata = {'login': $('#tjpm-login').val(), 'password': hasher.getHash("HEX"), 'csrfmiddlewaretoken': csrf_token};
		console.log('post data: ' + postdata);
		$.post("login/", postdata, function(data, status) {
			if (status == 'success') { location.reload(true);
			console.log('LOGIN WAS SUCCESSFULL');}
			else alert("Data: " + data + "\nStatus: " + status);
		});
		console.log('everything has been done');
	}
});

function tjpmSignOut() {
	$.post('logout/', {'csrfmiddlewaretoken': csrf_token}, function(data, status) {
		if (status == 'success') { location.reload(true);
			console.log('LOGIN WAS SUCCESSFULL');}
		else alert("Data: " + data + "\nStatus: " + status);
	});
});
$("#tjpm-signout").on('click', tjpmSignOut);