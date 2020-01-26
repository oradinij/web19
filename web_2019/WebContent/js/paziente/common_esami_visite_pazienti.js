$(".carousel").carousel({
	interval: false
});

window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust().draw();
};

$("#modalCancellazionePrenotazione").on('show.bs.modal', function () {
	$('.modalPrenotazione').each(function () {
		$(this).modal('hide');
	});
});


$(document).on('shown.bs.modal', '.modal', function () {

	$('.datatable').DataTable().columns.adjust().draw();

});
