$(function () {
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function (e) {
				$("#image-prev").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	$("#post-img").change(function () {
		$("#image-prev").removeClass('d-none');
		$("#image-current").remove();
		readURL(this);
	});
});