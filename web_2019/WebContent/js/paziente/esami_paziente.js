

$(document).ready(function () {
	
	$("#tabelle_esami").carousel({
		interval: false
	});

	$('#tabelle_esami').on('slid.bs.carousel', function () {

		$('.datatable').DataTable().columns.adjust();

	});
	
	
	$('#tabellaEsamiPrenotati').DataTable({

		ordering: false,
		paging: false,
		scrollY: 356,
		bInfo: false,
		scrollCollapse: false

	});


	$('#tabellaEsamiDaPrenotare').DataTable({

		ordering: true,
		paging: false,
		scrollY: 356,
		bInfo: false,
		scrollCollapse: false,

		"columnDefs": [{
			"targets": [2, 3],
			"orderable": false
		}]

	});


	$('#tabellaEsamiEffettuati').DataTable({

		ordering: true,
		paging: true,
		bInfo: false,
		scrollX: true,
		scrollY: 314,
		scrollCollapse: false,
		"lengthMenu": [
			[5, 10, 25, 50, -1],
			[5, 10, 25, 50, "All"]
		],
		"columnDefs": [{
			"targets": [3],
			"orderable": false
		}]
	});

	$('.tabellaRicetteEsami').each(function () {

		$(this).DataTable({

			ordering: false,
			paging: false,
			scrollY: 200,
			bInfo: false,
			searching: false,
			scrollCollapse: false
		});


	});
	
	$("#cercaStruttura").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		$("#listaEsami li").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});


});
