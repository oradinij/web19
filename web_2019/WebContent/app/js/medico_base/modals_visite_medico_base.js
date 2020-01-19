 $("#modalNuovaRicetta").on('show.bs.modal', function () {
 	$('.modalToClose').each(function () {
 		$(this).modal('hide');

 	});
 });

 $("#modalNuovaRicetta").on('hide.bs.modal', function () {
 	$('.modalToClose').each(function () {
 		$(this).modal('show');
 	});
 });

 $("#modalNuovoEsame").on('show.bs.modal', function () {
 	$('.modalToClose').each(function () {
 		$(this).modal('hide');
 	});
 });

 $("#modalNuovoEsame").on('hide.bs.modal', function () {
 	$('.modalToClose').each(function () {
 		$(this).modal('show');
 	});
 });


 $('#modalCompilazione').on('show.bs.modal', function () {
 	$('#modalPrenotazioneBase').modal('hide');
 });

 $('#modalCompilazione').on('hide.bs.modal', function () {
 	$('#modalPrenotazioneBase').modal('hide');
 });
