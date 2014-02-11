
function login() {
	document.getElementById('get_started').style.display = 'none';
	document.getElementById('login').style.display = 'block';
}

function signUp() {
	document.getElementById('get_started').style.display = 'none';
	document.getElementById('signup').style.display = 'block';
}

function refresh() {
	setTimeout(function() {
	document.getElementById('get_started').style.display = 'block';
	document.getElementById('signup').style.display = 'none';
	document.getElementById('login').style.display = 'none';
},200);
}