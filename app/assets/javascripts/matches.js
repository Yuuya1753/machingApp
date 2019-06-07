var pattern = new RegExp("/matches/show/*");
var interval;
if(location.pathname.match(pattern)) {
	$(function () {
		$(window).scroll(function() {
			$("#message-header").offset({
				top: $(this).scrollTop() + $(".app-title").height() + ($("#message-header").height() / 2) - 1,
				left: $("#message-header").offset().left
			});
		});

		$("#text").keyup(function () {
			var count = $(this).val().replace(/(\r\n|\r|\n)/g, "\n").length;
			$("div.count.nav.justify-content-end").text(count + " / 255文字");
			if ($("#text").val().length >= 255) {
				var text = $("#text").val().substr(0, 255);
				$("#text").val(text);
			}
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