<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Esami</title>
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
				<li class="nav-item"><a onclick="loadingModal()" class="nav-link" href="../operatore/visiteOperatore" role="button"
					 aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">${user.getVisiteNonPagate().size()}</span>
				</a></li>
				<li class="nav-item active"><a onclick="loadingModal()" class="nav-link" href="../operatore/esamiOperatore"
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

&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Esami effettuati: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaEsamiEffettuati" class="table text-center datatable table-striped table table-hover tabella_visite" style="width: 100%;">
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
        <c:forEach items="${user.listaEsamiErogati}" var="esame">
         <tr>
            <td style="vertical-align: middle">${esame.id_prenotazione}</td>
           	<td style="vertical-align: middle">${esame.data}</td>
           	<td style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.nomeEsame}</span></td>
           	<td style="vertical-align: middle">${esame.nome_medico} ${esame.cognome_medico}</td>
           	<td style="vertical-align: middle">11 €</td>
           <c:if test="${esame.stato==3}">	
            <td style="vertical-align: middle"><span class="badge badge-pill badge-success">Pagato</span></td>
            </c:if>
              <c:if test="${esame.stato!=3}">	
            <td style="vertical-align: middle"><span class="badge badge-pill badge-warning">Non pagato</span></td>
            </c:if>
           	<td style="vertical-align: middle"><button  id="bottone_dettagli${esame.id_prenotazione}" onclick="modal_esame_svolto(${esame.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
&nbsp;

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


function loadingModal() {
	  
	$('#loading_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	});


	  
	  }
	  



function modal_esame_svolto(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";
	
	  $.ajax({
	 
	  url: 'http://localhost:8080/web2019/medico/modal/dettagli_esame?id_prenotazione='+id,
      type: "GET",
      success: function (result) { 
      	console.log(result);
          document.getElementById('data_svolto').innerHTML=result.data;
          document.getElementById('medico_svolto').innerHTML=result.nome_medico + " " + result.cognome_medico;    
          document.getElementById('visita_riferimento_svolto').innerHTML=result.id_riferimento;
          document.getElementById('nome_esame_svolto').innerHTML=result.nome_esame;
          document.getElementById('codice_footer_svolto').innerHTML="Codice esame: " + id; 
          document.getElementById('area_svolto').innerHTML=result.area;
          document.getElementById('referto_svolto').innerHTML=result.referto;
          if(result.stato==3){
              document.getElementById('bottone_modal_pagata').outerHTML="<h5>Esame già pagato!</h5>"; 
              } else {
              	
              	
                  document.getElementById('bottone_modal_pagata').outerHTML="<a class=\"btn btn-success\" href=\"#\" onclick=\"modal_paga("+ id + ")\" id=\"bottone_modal_pagata\"><i class=\"fa fa-file-invoice-dollar\"></i> Contrassegna l'esame come pagato</a>"; 
  	
              	
              }
          
        
             
          
          $('#modalEsame').modal('show');
          
       	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_esame_prescritto("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

          
          
          },
          
       error: function (result){
      	
      	console.log(result);
      	
      	
      }
      });
  
	    
	  
	};

		

		$(document).ready(function () {
			

		
			
		});
		
		window.onresize = function (event) {
			$('.datatable').DataTable().columns.adjust();
		};

		$(document).on('shown.bs.modal','.modal', function () {

			$('.datatable').DataTable().columns.adjust();

		});
		
		


		function modal_paga(id){
			
			$('#modalEsame').modal('hide');
			
			$('#modalPaga').modal('show');
			
			document.getElementById('id_to_pay').innerHTML=id;
			document.getElementById('input_to_pay').value = id;
			
		}


</script>




<div class="modal fade" id="modalEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
         <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Esame</p>
          </h5>
          <h5 id="nome_esame_svolto"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Specializzazione</p>
          </h5>
          <h5 id="area_svolto"></h5>
          <hr>
          <h5>
            <p class="badge badge-info">Medico prescrivente</p>
          </h5>
          <h5 id="medico_svolto"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5 id="data_svolto"></h5>
          <hr class="bg-light">
           <h5>
            <p class="badge badge-info">Referto</p>
          </h5>
          <p  id="referto_svolto" class="card-body text-left" style="border-style: solid; border-radius: 20px;"></p>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>   
          </h5>
           <h5 id="visita_riferimento_svolto"></h5>
          
           <hr class="bg-light">
			<h5>
            <p class="badge badge-info">Contrassegna come pagato</p>
          </h5> 
		<a class="btn btn-success" href="#" id="bottone_modal_pagata"><i class="fa fa-file-invoice-dollar"></i> Contrassegna l'esame come pagato</a>
			 
          
          
          </div>
          
			 
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6  id="codice_footer_svolto" class="badge badgeNumeroVisitaEsame"></h6>
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
        <h4 class="modal-title">Contrassegna esame come pagato</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <h5 class="bg-warning text-center" id="delete_confirm_message" style="border-radius: 20px; padding: 10px;">Sei sicuro di voler contrassegnare l'esame <span id="id_to_pay"></span> come pagato per il paziente?</h5>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      <form action="./pagaEsame">
      <input name="id_prenotazione" id="input_to_pay" type="hidden">
      <button type="submit" onclick="$('#modalPaga').modal('hide'); $('#modalEsame').modal('hide'); loadingModal()" class="btn btn-warning">Pagato</button>
       </form>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>


<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script>

window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust().draw();
};


$(document).ready(function () {



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
			"targets": [6],
			"orderable": false
		}],
		buttons: [
			{
                extend: 'excelHtml5',
                exportOptions: {
                    columns: [0,1,2,3,4,5]
                }
            }
       ],
       dom: 'Bfrtip'

	});

});



</script>
</body>
</html>