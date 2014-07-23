var SEARCH = SEARCH || {}
SEARCH.go = function(){
	$('#search').val('')
	$('#search').focus();
}

$(document).ready(function(){
	SEARCH.go();

	$('#search').blur(function() {
	  SEARCH.go();
	});
})