
$(document).ready(function () {
	
	
	
	$('.tabellaVisita').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false, 
		searching: false
		

	});
	

	
	$('#tabelle_visite').carousel({
		interval: false
	});
	
	
	$('#tabelle_visite').on('slid.bs.carousel', function () {

		$('.datatable').DataTable().columns.adjust();

	});



	$('#tabellaVisitePrenotate').DataTable({

		ordering: false,
		paging: false,
		scrollY: 356,
		bInfo: false,
		scrollCollapse: false

	});

	
	$('#tabellaVisiteDaPrenotare').DataTable({


		ordering: true,
		paging: false,
		bInfo: false,
		scrollX: true,
		scrollY: 314,
		scrollCollapse: false,
		"lengthMenu": [
			[5, 10, 25, 50, -1],
			[5, 10, 25, 50, "All"]
		],
		"columnDefs": [{
			"targets": [2,3],
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
	
	


});
