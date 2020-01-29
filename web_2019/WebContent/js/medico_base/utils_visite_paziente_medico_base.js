window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust();
};

$(document).on('shown.bs.modal','.modal', function () {

	$('.datatable').DataTable().columns.adjust();

});

$(document).ready(function () {


	$('#tabellaEsami').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		searching: false
		

	});
	
	
	$('#tabellaRicette').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false, 
		searching: false
		

	});
	
	
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
