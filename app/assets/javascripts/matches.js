$(function () {
	$("#text").keyup(function () {
		var count = $(this).val().replace(/(\r\n|\r|\n)/g, "\r\n").length;
		$("div.count.nav.justify-content-end").text(count + " / 255文字");
	});
});