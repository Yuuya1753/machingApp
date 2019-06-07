$(function() {
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$("#image-prev").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#post-img").change(function() {
		$("#image-prev").removeClass('d-none');
		$("#image-current").remove();
		readURL(this);
	});

	$("#self_introduction").keyup(function() {
		var count = $(this).val().replace(/(\r\n|\r|\n)/g, "\r\n").length;
		$("div.count.nav.justify-content-end").text(count + " / 200文字");
	});
});