setInterval(function () {
	var nomer     = Math.floor(Math.random()*4 + 1);
	var first_url = 'url("http://localhost:3000/img/title';
	var sec_url   = '_980_250.png")';
	var url = first_url + nomer + sec_url;
	console.info( $('#roof').css('background-image') );
	$('#roof').css( 'background-image', url );
}, 2000)