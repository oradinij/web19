$('#tabelle_visite').on('slid.bs.carousel', function () {

	$('.datatable').DataTable().columns.adjust().draw();

});


document.getElementById("bottoneScegliOra").onclick = function () {
	if ($("#dataVisita").val().length == 0)
		window.alert("Scegli una data!");
	else {
		$("#modalSceltaOra").modal("show");
		$("#modalPrenotaVisitaBase").modal("hide");
	}
};


$("#modalSceltaOra").on('show.bs.modal', function () {
	var val = document.getElementById("dataVisita").value;

	// Displaying the value
	document.getElementById("dataSelezionata").innerHTML = val;
});


$(document).ready(function () {

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
		scrollY: 356,
		bInfo: false,
		scrollCollapse: false,

		"columnDefs": [{
			"targets": [1, 2, 3],
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


});
