window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust().draw();
};


$(document).ready(function () {


	$('#tabellaEsamiPrescritti').DataTable({

		ordering: true,
		paging: false,
		scrollY: 250,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		"columnDefs": [{
			"targets": [3],
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

});
