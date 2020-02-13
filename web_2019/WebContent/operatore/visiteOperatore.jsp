<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visite</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/datatables.min.js"></script>
<script src="../js/jquery.dataTables.js"></script>
<script src="../js/dataTables.bootstrap4.min.js"></script>
<script src="../js/moment-with-locales.min.js"></script>
<script src="../js/tempusdominus-bootstrap-4.min.js"></script>
<script src="../js/dataTables.buttons.min.js"></script>
<script src="../js/buttons.html5.min.js"></script>
<script src="../js/buttons.flash.min.js"></script>
<script src="../js/jszip.min.js"></script>

</head>

<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark">
		<a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a class="nav-link" onclick="loadingModal()" href="./homeOperatore.jsp">Home <span
						class="sr-only">
							 
						</span></a></li>
				
				<li class="nav-item"><a class="nav-link " onclick="loadingModal()" href="../operatore/ricetteOperatore.jsp"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette 
				</a></li>
				<li class="nav-item active"><a onclick="loadingModal()" class="nav-link" href="../operatore/visiteOperatore" role="button"
					 aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">${user.getVisiteNonPagate().size()}</span>
				</a></li>
				<li class="nav-item"><a onclick="loadingModal()" class="nav-link" href="../operatore/esamiOperatore"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">${user.getEsamiNonPagati().size()}</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="${user.foto_path}"></li>
				<li class="nav-item"><a class="btn btn-danger  " href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a>
				</li>
			</ul>
		</div>
	</nav>
&nbsp;

<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px; margin-bottom:20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Visite effettuate: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaVisiteEffettuate" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%;">
        <thead>
          <tr>
          	<th>Id</th>
            <th>Data</th>
            <th>Tipo</th>
            <th>Dottore</th>
            <th>Costo</th>
            <th>Stato</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${user.listaVisiteErogate}" var="visita">
          <tr>
            <td style="vertical-align: middle">${visita.id_prenotazione}</td>
           	<td style="vertical-align: middle">${visita.data}</td>
           	<td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
           	<td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
           	<td style="vertical-align: middle">50 €</td>
           <c:if test="${visita.stato==3}">	
            <td style="vertical-align: middle"><span class="badge badge-pill badge-success">Pagata</span></td>
            </c:if>
              <c:if test="${visita.stato!=3}">	
            <td style="vertical-align: middle"><span class="badge badge-pill badge-warning">Non pagata</span></td>
            </c:if>
           	<td style="vertical-align: middle"><button  id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_specialistica(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<br>
<div class="text-center" style="margin-bottom: 40px;">
	<a class="btn btn-info" href="homeOperatore.jsp"><i class="fa fa-home"></i> Torna alla home</a>
	</div>


<div class="modal fade" id="loading_modal" style="border-radius:20px;">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
     
      <div class="modal-body text-center">
        
		<div class="spinner-border text-info" role="status">
 			 
		</div>
		<h5><span>Caricamento...</span></h5>
      </div>
     
    </div>
  </div>
  </div>
  

<script>

function loading_modal (){
	  
	$('#loading_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	})


	  
	  }
	  
	
	
  function modal_svolta_specialistica(id){
 
		document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

	  
   $.ajax({
        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
        type: "GET",
        success: function (result) { 
        	console.log(result);
            document.getElementById('completata_data_spec').innerHTML=result.visita.data;
            document.getElementById('completata_nome_medico_spec').innerHTML=result.visita.nome_medico + " " + result.visita.cognome_medico;
            document.getElementById('completata_referto_spec').innerHTML=result.visita.referto;
            document.getElementById('completata_tipo_visita_spec').innerHTML=result.visita.nome_visita;
            document.getElementById('completata_luogo_spec').innerHTML=result.visita.luogo;
            document.getElementById('completata_numero_footer_specialistica').innerHTML="Codice visita: " + id; 
            document.getElementById('completata_numero_footer_specialistica').innerHTML="Codice visita: " + id; 
            if(result.visita.stato==3){
            document.getElementById('bottone_modal_pagata').outerHTML="<h5>Visita già pagata!</h5>"; 
            } else {
            	
            	
                document.getElementById('bottone_modal_pagata').outerHTML="<a class=\"btn btn-success\" href=\"#\" onclick=\"modal_paga("+ id + ")\" id=\"bottone_modal_pagata\"><i class=\"fa fa-file-invoice-dollar\"></i> Contrassegna la visita come pagata</a>"; 
	
            	
            }

            document.getElementById('tbody_ricette_specialistica_completata').innerHTML="";
            
            if(result.figli.lista_prescrizioni.length==0){
	            	
	            	$('#tabella_ricette_specialistica_completata').DataTable().columns.adjust().draw();
	            	
	            	
	            }
            
            result.figli.lista_prescrizioni.forEach(el =>{
        		
        		
            	
            	
	        	$("#tbody_ricette_specialistica_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prescrizione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.farmaco+ "</td>");
				
	        	
	        		           
	        	});
            
           

            document.getElementById('tbody_esami_specialistica_completata').innerHTML="";

				if(result.figli.lista_esami.length==0){
	            	
	            	$('#tabella_esami_specialistica_completata').DataTable().columns.adjust().draw();
				}
            
				result.figli.lista_esami.forEach(el =>{
        		
        		
	        	$("#tbody_esami_specialistica_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prenotazione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.nome_esame+ "</td>");
					
	        		           
	        	});
				
				
				
	            	
	            
				
				  document.getElementById('tbody_visite_specialistica_completata').innerHTML="";

				 if(result.figli.lista_visite.length==0){
	            	
	            	$('#tabella_visite_specialistica_completata').DataTable().columns.adjust().draw();
	            	
	            	
	            }
		            
	 				result.figli.lista_visite.forEach(el =>{
		        		
		        		
			        	$("#tbody_visite_specialistica_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prenotazione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.nome_visita+ "</td>");
							
			        		           
			        	});
	 				
	 				
            
            
            $('#modalVisitaSpecialistica').modal('show');
            
        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_svolta_specialistica("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

            
            },
         error: function (result){
        	
        	console.log(result);
        	
        	
        }
        });
    
  
};

window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust();
};

$(document).on('shown.bs.modal','.modal', function () {

	$('.datatable').DataTable().columns.adjust();

});

$(document).ready(function () {
	

	$('#tabella_ricette_specialistica_completata').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		searching: false
		

	});
	
	
	$('#tabella_esami_specialistica_completata').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		searching: false
		

	});
	
	

	$('#tabella_visite_specialistica_completata').DataTable({

		ordering: false,
		paging: false,
		scrollY: 200,
		scrollX: true,
		bInfo: false,
		scrollCollapse: false,
		searching: false
		

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
			"targets": [6],
			"orderable": false
		}],
		buttons: [
			{
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [0,1,2,3]
                }
            }
       ],
       dom: 'Bfrtip'

	});




});


function modal_paga(id){
	
	$('#modalVisitaSpecialistica').modal('hide');
	
	$('#modalPaga').modal('show');
	
	document.getElementById('id_to_pay').innerHTML=id;
	document.getElementById('input_to_pay').value = id;
	
}


function loadingModal() {
	  
	$('#loading_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	})


	  
	  }

</script>


	
<div class="modal fade" id="loading_modal" style="border-radius:20px;">
  <div class="modal-dialog" role="document" >
    <div class="modal-content">
     
      <div class="modal-body text-center">
        
		<div class="spinner-border text-info" role="status">
 			 
		</div>
		<h5><span>Caricamento...</span></h5>
      </div>
     
    </div>
  </div>
  </div>


<div class="modal fade" id="modalVisitaSpecialistica">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli visita</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Tipologia</p>
          </h5>
          <h5 id="completata_tipo_visita_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5 id="completata_nome_medico_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data</p>
          </h5>
          <h5 id="completata_data_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Luogo</p>
          </h5>
          <h5 id="completata_luogo_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Referto</p>
          </h5>
          <p id="completata_referto_spec" class="card-body text-left" style="border-style: solid; border-radius: 20px;"></p>
          <hr class="bg-light">
         <h5>
            <p class="badge badge-info">Ricette</p>
          </h5>
          <div class="container">
            <table id="tabella_ricette_specialistica_completata" class="table datatable table-hover table-striped table-bordered tabellaRicetteEsami" style="width:100%">
              <thead >
                <tr>
                  <th>Numero Ricetta</th>
                  <th>Farmaco</th>
                </tr>
              </thead>
              <tbody id="tbody_ricette_specialistica_completata">
              </tbody>
            </table id="tabella_esami_base_completata">
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
          <div class="container">
            <table id="tabella_esami_specialistica_completata" class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
              <thead style="width:100%">
                <tr>
                  <th>Numero Esame</th>
                  <th>Esame</th>
                </tr>
              </thead>
              <tbody id="tbody_esami_specialistica_completata">
              </tbody>
            </table>
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visite</p>
          </h5>
          <div class="container">
            <table id="tabella_visite_specialistica_completata" class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
              <thead >
                <tr>
                  <th>Numero Visita</th>
                  <th>Tipo</th>
                </tr>
              </thead>
              <tbody id="tbody_visite_specialistica_completata">
              </tbody>
            </table>
          </div>
			 <hr class="bg-light">
			<h5>
            <p class="badge badge-info">Contrassegna come pagata</p>
          </h5> 
		<a class="btn btn-success" href="#" id="bottone_modal_pagata"><i class="fa fa-file-invoice-dollar"></i> Contrassegna la visita come pagata</a>
			 
			 
      </div>
       
      
      </div>
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="completata_numero_footer_specialistica" class="badge badgeNumeroVisitaEsame"></h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="modalPaga">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Contrassegna visita come pagata</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <h5 class="bg-warning text-center" id="delete_confirm_message" style="border-radius: 20px; padding: 10px;">Sei sicuro di voler contrassegnare la visita <span id="id_to_pay"></span> come pagata per il paziente?</h5>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      <form action="./pagaVisita">
      <input name="id_prenotazione" id="input_to_pay" type="hidden">
      <button type="submit" onclick="$('#modalPaga').modal('hide'); $('#modalVisitaSpecialistica').modal('hide'); loadingModal()" class="btn btn-warning">Pagata</button>
       </form>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>

<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>

<script src="../js/medico_base/prenota_visita_timepicker.js"></script> 
<script src="../js/medico_base/modals_visite_medico_base.js"></script>
</body>
</html>