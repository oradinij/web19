$('#tabelle_ricette').on('slid.bs.carousel', function () {

	$('.datatable').DataTable().columns.adjust().draw();

});

$(document).ready(function () {


	$('#tabellaRicetteDaErogare').DataTable({

		ordering: false,
		paging: false,
		scrollY: 356,
		bInfo: false,
		scrollCollapse: false

	});


	$('#tabellaRicetteErogate').DataTable({

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
			"targets": [2, 3],
			"orderable": false
		}]
	});
});
