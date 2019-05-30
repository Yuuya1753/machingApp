$(function() {
	if (location.pathname == "/users/search") {
		$("div#search-form").show();
		$("div#search-result").hide();
	}

	$("#self_introduction").keyup(function() {
		var count = $(this).val().replace(/(\r\n|\r|\n)/g, "\r\n").length;
		$("div.count.nav.justify-content-end").text(count + " / 200文字");
	});

	$("input#search-submit").click(function() {
		$("div#search-form").hide();
		$("div#search-result").show();
	});
	
	$("button#return-search-form").click(function() {
		$("div#search-form").show();
		$("div#search-result").hide();
	});
	
});