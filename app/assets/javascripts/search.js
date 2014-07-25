var SEARCH = SEARCH || {}
SEARCH.clear = function(){
	$('#search').val('')
}
SEARCH.go = function(){
	$('#search').focus();
}
SEARCH.enter = function(k){
		$.get('/search', {search: $("#search").val()})
			.done(function(data){
				$('#main').html(data);
				if(data.length == 1){
					$.each($(savedPage), function(index, value){
						$('#main').append($(value));
					})
				}
			})
}

SEARCH.currentPage = function(){
	return $('#main').children();
}

var savedPage = '';

$(document).ready(function(){
	SEARCH.clear();
	SEARCH.go();
	savedPage = SEARCH.currentPage();

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