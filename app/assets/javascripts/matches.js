var pattern = new RegExp("/matches/show/*");
var interval;
if(location.pathname.match(pattern)) {
	$(function () {
		$(window).scroll(function() {
			$("#new-message").offset({
				top: $(this).scrollTop() + $(".app-title").height() + $("#new-message").height(),
				left: $(".container").offset().left
			});
		});

		$("#text").keyup(function () {
			var count = $(this).val().replace(/(\r\n|\r|\n)/g, "\r\n").length;
			$("div.count.nav.justify-content-end").text(count + " / 255文字");
		});

		interval = setInterval(function() {
			$.ajax({
				url: "/messages/count_message",
				type: "POST",
				data: {
					message_id: $("p.id:last").text(),
					matching_id: $("p#matching-id").text()
				},
				success: function () {
				}
			});
		}, 10000);
	});
} else {
	clearInterval(interval);
}