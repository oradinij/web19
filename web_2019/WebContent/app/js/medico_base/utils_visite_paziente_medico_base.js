window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust().draw();
};


$(document).ready(function () {


	$('#tabellaVisitePrenotate').DataTable({

		ordering: true,
		paging: false,
		scrollY: 250,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		"columnDefs": [{
			"targets": [1, 2],
			"orderable": false
		}]

	});

	$('#tabellaVisiteSpecialistichePrescritte').DataTable({

		ordering: true,
		paging: false,
		scrollY: 250,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		"columnDefs": [{
			"targets": [1, 2],
			"orderable": false
		}]

	});

	$('#tabellaVisiteEffettuate').DataTable({


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



	$("#cercaEsame").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		$("#listaEsami li").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});


	$("#cercaArea").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		$("#listaAree li").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});



});
