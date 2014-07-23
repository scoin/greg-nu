var SEARCH = SEARCH || {}
SEARCH.clear = function(){
	$('#search').val('')
}
SEARCH.go = function(){
	$('#search').focus();
}
SEARCH.enter = function(k){
		$.get('/search', {search: $("#search").val()}, 'json')
			.done(function(data){
			if(data != undefined){
				$('#main').html(data);
			}
			})
}

$(document).ready(function(){
	SEARCH.clear();
	SEARCH.go();

	$('#search').blur(function() {
	  SEARCH.clear();
	});

	$('#search').keyup(function(k){
		SEARCH.enter(k);
	});

	$('#headsearch').submit(function(e){
		e.preventDefault();
	})
})