var SEARCH = SEARCH || {}
SEARCH.clear = function(){
	$('#search').val('')
}
SEARCH.go = function(){
	$('#search').focus();
}

$(document).ready(function(){
	SEARCH.clear();
	SEARCH.go();

	$('#search').blur(function() {
	  SEARCH.clear();
	});
})