<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Ricette</title>
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
<script src="../js/qrcode.js"></script>
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item "> <a class="nav-link"  onclick="loadingModal()" href="./homeMedicoBase.jsp">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link "  onclick="loadingModal()" href="./pazientiMedicoBase.jsp"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti</a> </li>
      <li class="nav-item"><a class="nav-link"  onclick="loadingModal()" href="CalendarioVisiteBase" role="button" aria-haspopup="true" aria-expanded="false"> Visite</a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="${user.immagine}"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
    </ul>
  </div>
</nav>


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
  
  <script type="text/javascript">

  function loadingModal() {
  
$('#loading_modal').modal({
    backdrop: 'static',
    keyboard: false
})


  
  }
  
</script>
  


&nbsp;
<div class="container text-center" style="background-color: #C1D4D9; border-radius: 20px; padding:20px; max-width: 70%"><img class="rounded-circle " src="${visita_corrente.paziente.foto_path}" width="150" height="150" alt="user" style="margin-bottom: 10px;">
  <h2>Ricette di: <span class="badge badge-info">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</span></h2>
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPazienteBase">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button class="btn btn-success" type="submit" onclick="loadingModal()"><i class="fa fa-arrow-circle-left"></i> Torna al paziente</button>
  </form>
</div>
&nbsp;
<hr>
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px; margin-bottom: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    
    &nbsp;
    <div class="container">
      <table id="tabellaRicette" class="table datatable text-center table-striped table-hover table-light tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Medico prescrittore</th>
            <th>Stato</th>
            <th>Data prescrizione/erogazione</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.listaPrescrizioni}" var="prescrizione">
          <tr>
            <td>${prescrizione.nome_medico}</td>
            <c:if test="${prescrizione.stato==0}">
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">Non erogata</span></td>
            </c:if>
            <c:if test="${prescrizione.stato==1}">
            <td style="vertical-align: middle"><span class="badge badge-pill badge-secondary">Erogata</span></td>
            </c:if>
            <c:if test="${prescrizione.stato==1}">
            <td style="vertical-align: middle">${prescrizione.data_ora}</td>
            </c:if>
             <c:if test="${prescrizione.stato==0}">
            <td style="vertical-align: middle">${prescrizione.data}</td>
            </c:if>
            <c:if test="${prescrizione.stato==0}">
            <td style="vertical-align: middle"><button  id="bottone_dettagli${prescrizione.id_prescrizione}" onclick="modal_ricetta_da_erogare(${prescrizione.id_prescrizione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
             <c:if test="${prescrizione.stato!=0}">
            <td style="vertical-align: middle"><button  id="bottone_dettagli${prescrizione.id_prescrizione}" onclick="modal_ricetta_erogata(${prescrizione.id_prescrizione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
          </tr>
         </c:forEach>
        </tbody>
      </table>
      <hr>
      <h5>Per prescrivere una nuova ricetta compila una visita: </h5>
      <br>
      <form id="formVisite" action="VisitePaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
      <button href="#" type="submit"  class="btn btn-success" onclick="loadingModal()"><i class="fa fa-arrow-circle-right" ></i> Vai alle visite del paziente</button>
    </form>
    </div>
  </div>
</div>
&nbsp;
<div class="modal fade" id="modalRicettaErogata">
  
	<div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light" style="background-color: #205373">
        <h4 class="modal-title">Dettagli ricetta erogata</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body" style="background-color:  #C1D4D9">
         <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px; margin-bottom: 20px;">
          <h5>
            <p class="badge badge-info">Medico prescrittore</p>
          </h5>
          <h5 id="nome_medico_erogata"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data e ora erogazione</p>
          </h5>
          <h5 id="data_erogata"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>
          </h5>
         <h5 id="visita_riferimento_erogata"></h5>
         <button id="bottone_riferimento_erogata" class="btn btn-info">Vedi visita</button>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Farmacia erogatrice</p>
          </h5>
         <h5 id="farmacia_erogata"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Prescrizione</p>
          </h5>
          <p id="farmaco_erogata" class="card-body text-left" style="border-style: solid; border-radius: 20px;"></p>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Ticket ricetta</p>
          </h5>
         <form id="formScaricaTicketPrescrizione" name="formScaricaTicketPrescrizione" method="GET" action="scaricaTicketPrescrizione">
          <a href="#" type="submit" class="btn btn-success"><i class="fa fa-ticket"></i> Scarica Ticket</a>
          </form>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Codice QR</p>
          </h5>
          <button class="btn btn-success" data-toggle="collapse" data-target="#collpase_qr_erogata"><i class="fa fa-qrcode"></i> Mostra QR</button>
          <div id="collpase_qr_erogata" class="collapse text-center" style="margin-top: 20px;"> <div id="qr_erogata" class="text-center container" style="width: 300px; height: 300px;"></div> </div>
        </div>
         </div>
        
        <!-- Modal footer -->
        <div class="modal-footer text-light" style="background-color: #205373">
          <h6 id="codice_footer_erogata" class="badge text-dark badgeNumeroVisitaEsame" style="margin-top:10px;"></h6>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
        </div>
      </div>
    </div>
  </div>


<script>

function modal_ricetta_erogata(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/modal/dettagli_ricetta?id_ricetta='+id,
	        type: "GET",
	        success: function (result) { 
	        	console.log(result);
	            document.getElementById('data_erogata').innerHTML=result.data_ora;
	            document.getElementById('nome_medico_erogata').innerHTML=result.nome_medico + " " + result.cognome_medico;    
	            document.getElementById('visita_riferimento_erogata').innerHTML=result.id_riferimento;
	            document.getElementById('farmaco_erogata').innerHTML=result.farmaco;
	            document.getElementById('codice_footer_erogata').innerHTML="Codice ricetta: " + id; 
	            document.getElementById('farmaco_erogata').innerHTML=result.farmaco;
	            document.getElementById('farmacia_erogata').innerHTML=result.farmacia;
	            document.getElementById('formScaricaTicketPrescrizione').innerHTML="<input type=\"hidden\" value=\"" + id +  "\" name=\"id_prescrizione\"> <button href=\"#\" type=\"submit\" class=\"btn btn-success\"><i class=\"fa fa-ticket\"></i> Scarica Ticket</button>"; 

	            if(result.tipo_riferimento==1){
		            document.getElementById('bottone_riferimento_erogata').outerHTML="<button id=\"bottone_riferimento_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ result.id_riferimento + ",2)\">Vedi visita</button>"
		            } else{
		            	
					document.getElementById('bottone_riferimento_erogata').outerHTML="<button id=\"bottone_riferimento_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ result.id_riferimento + ",2)\">Vedi visita</button>"
		            	
		            }
	            
	            
	            
	            document.getElementById('qr_erogata').innerHTML="";
	            
	            var qrcode = new QRCode("qr_erogata");

	            function makeCode () {		
	            	var elText = "Ricetta numero: "+ id + ", data prescrizione: " + result.data + ", medico prescrittore: " +
								result.nome_medico + " " + result.cognome_medico + ", prescrizione: "+ result.farmaco + ", farmacia erogatrice: "+ result.farmacia + ".";
	            	
	            	qrcode.makeCode(elText);
	            }

	            makeCode();

	            
	            
	            
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_ricetta_erogata("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	            
	            
	            $('#modalRicettaErogata').modal('show');
	            
	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};



function modal_ricetta_da_erogare(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/modal/dettagli_ricetta?id_ricetta='+id,
	        type: "GET",
	        success: function (result) { 
	        	
	        	var data = result.data.split(' ')[0];
	        	
	        	console.log(result);
	            document.getElementById('data_non_erogata').innerHTML=data;
	            document.getElementById('nome_medico_non_erogata').innerHTML=result.nome_medico + " " + result.cognome_medico;    
	            document.getElementById('visita_riferimento_non_erogata').innerHTML=result.id_riferimento;
	            document.getElementById('farmaco_non_erogata').innerHTML=result.farmaco;
	            document.getElementById('codice_footer_non_erogata').innerHTML="Codice ricetta: " + id; 
	            document.getElementById('formScaricaPrescrizione').innerHTML="<input type=\"hidden\" value=\"" + id +  "\"name=\"id_prescrizione\"> <button href=\"#\" type=\"submit\" class=\"btn btn-success\"><i class=\"fa fa-file-pdf\"></i> Scarica PDF</button>"; 

	            if(result.tipo_riferimento==1){
	            document.getElementById('bottone_riferimento_non_erogata').outerHTML="<button id=\"bottone_riferimento_non_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ result.id_riferimento + ",1)\">Vedi visita</button>"
	            } else{
	            	
				document.getElementById('bottone_riferimento_non_erogata').outerHTML="<button id=\"bottone_riferimento_non_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ result.id_riferimento + ",1)\">Vedi visita</button>"
	            	
	            }
	            
	            document.getElementById('qr_non_erogata').innerHTML="";

	            var qrcode = new QRCode("qr_non_erogata");

	            function makeCode () {		
	            	var elText = "Ricetta numero: "+ id + ", data prescrizione: " + data + ", medico prescrittore: " +
								result.nome_medico + " " + result.cognome_medico + ", prescrizione: "+ result.farmaco + ".";
	            	
	            	qrcode.makeCode(elText);
	            }

	            makeCode();

	            
	            
	            
	            
	            
	            
	            $('#modalRicettaDaErogare').modal('show');
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_ricetta_da_erogare("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	            
	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	   
	  
	};


	
	
	
	  function modal_svolta_specialistica(id, stato){
		  
		  if(stato==1){
			  
				document.getElementById("bottone_riferimento_non_erogata").outerHTML="<div id=\"spinner_visita_non_erogata\" class=\"spinner-grow text-info\"></div>";
			  } else {
				  
				  
					document.getElementById("bottone_riferimento_erogata").outerHTML="<div id=\"spinner_visita_erogata\" class=\"spinner-grow text-info\"></div>";

				  
				  
			  }
	 
	   $.ajax({
	        url: 'dettagli_visita?id_prenotazione='+id,
	        type: "GET",
	        success: function (result) { 
	        	console.log(result);
	            document.getElementById('completata_data_spec').innerHTML=result.visita.data;
	            document.getElementById('completata_nome_medico_spec').innerHTML=result.visita.nome_medico + " " + result.visita.cognome_medico;
	            document.getElementById('completata_referto_spec').innerHTML=result.visita.referto;
	            document.getElementById('completata_tipo_visita_spec').innerHTML=result.visita.nome_visita;
	            document.getElementById('completata_luogo_spec').innerHTML=result.visita.luogo;
	            document.getElementById('completata_numero_footer_specialistica').innerHTML="Codice visita: " + id; 
	            

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
	            
	            if(stato==1){
		            
	 				document.getElementById("spinner_visita_non_erogata").outerHTML="<button id=\"bottone_riferimento_non_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ id + ",1)\">Vedi visita</button>";

		            } else {
		            	
		 				document.getElementById("spinner_visita_erogata").outerHTML="<button id=\"spinner_visita_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ id + ",2)\">Vedi visita</button>";
		
		            	
		            }
		            
	            
	            
	            },
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};

	function modal_svolta_base(id, stato){
		
		 if(stato==1){
			  
				document.getElementById("bottone_riferimento_non_erogata").outerHTML="<div id=\"spinner_visita_non_erogata\" class=\"spinner-grow text-info\"></div>";
			  } else {
				  
				  
					document.getElementById("bottone_riferimento_erogata").outerHTML="<div id=\"spinner_visita_erogata\" class=\"spinner-grow text-info\"></div>";

				  
				  
			  }
		
		 
		   $.ajax({
		        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
		        type: "GET",
		        success: function (result) { 
		        	console.log(result);
		            document.getElementById('completata_data_base').innerHTML=result.visita.data;
		            document.getElementById('completata_nome_medico_base').innerHTML=result.visita.nome_medico + " " + result.visita.cognome_medico;    
		            document.getElementById('completata_tipo_visita_base').innerHTML=result.visita.nome_visita;
		            document.getElementById('completata_luogo_spec').innerHTML=result.visita.luogo;
		            document.getElementById('completata_numero_footer_base').innerHTML="Codice visita: " + id; 
		            
		            
		            document.getElementById('tbody_ricette_base_completata').innerHTML="";
		            

	           	 if(result.figli.lista_prescrizioni.length==0){
		            	
		            	$('#tabella_ricette_base_completata').DataTable().columns.adjust().draw();
		            	
		            	
		            }
		            
		            result.figli.lista_prescrizioni.forEach(el =>{
		        		
		        		
		            	
			        	$("#tbody_ricette_base_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prescrizione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.farmaco+ "</td>");
						
			        	
			        		           
			        	});
		            
		           

		            document.getElementById('tbody_esami_base_completata').innerHTML="";

	 				if(result.figli.lista_esami.length==0){
	 	            	
	 	            	$('#tabella_esami_base_completata').DataTable().columns.adjust().draw();
	 				}
		            
	 				result.figli.lista_esami.forEach(el =>{
		        		
		        		
			        	$("#tbody_esami_base_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prenotazione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.nome_esame+ "</td>");
							
			        		           
			        	});
	 				
	 				
	 				
	 	            	
	 	            
	 				
	 				  document.getElementById('tbody_visite_base_completata').innerHTML="";

	 				 if(result.figli.lista_visite.length==0){
			            	
			            	$('#tabella_visite_base_completata').DataTable().columns.adjust().draw();
			            	
			            	
			            }
	 		            
	 	 				result.figli.lista_visite.forEach(el =>{
	 		        		
	 		        		
	 			        	$("#tbody_visite_base_completata").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.id_prenotazione + "</td><td  align=\"center\" style=\"vertical-align:middle\">"+el.nome_visita+ "</td>");
	 							
	 			        		           
	 			        	});
	 	 				
	 	 				
	 	 				 
		            
		            
		            $('#modalVisitaBase').modal('show');
		            
		            if(stato==1){
			            
		 				document.getElementById("spinner_visita_non_erogata").outerHTML="<button id=\"bottone_riferimento_non_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ id + ",1)\">Vedi visita</button>";

			            } else {
			            	
			 				document.getElementById("spinner_visita_erogata").outerHTML="<button id=\"spinner_visita_erogata\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ id + ",2)\">Vedi visita</button>";
			
			            	
			            }
		            
		            
		            },
		            
		         error: function (result){
		        	
		        	console.log(result);
		        	
		        	
		        }
		        });
		    
		  
		};
		
		
		
		

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
			
			
			$('#tabella_ricette_base_completata').DataTable({

				ordering: false,
				paging: false,
				scrollY: 200,
				scrollX: true,
				bInfo: false,
				scrollCollapse: false,
				searching: false
				

			});
			
			
			$('#tabella_visite_base_completata').DataTable({

				ordering: false,
				paging: false,
				scrollY: 200,
				scrollX: true,
				bInfo: false,
				scrollCollapse: false,
				searching: false
				

			});
			
			

			$('#tabella_esami_base_completata').DataTable({

				ordering: false,
				paging: false,
				scrollY: 200,
				scrollX: true,
				bInfo: false,
				scrollCollapse: false,
				searching: false
				

			});
			
		});
		
		window.onresize = function (event) {
			$('.datatable').DataTable().columns.adjust();
		};

		$(document).on('shown.bs.modal','.modal', function () {

			$('.datatable').DataTable().columns.adjust();

		});
		
		
		
		
</script>


<div class="modal fade modalPrenotazione" id="modalRicettaDaErogare">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light" style="background-color: #205373">
        <h4 class="modal-title">Dettagli ricetta da erogare</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body" style="background-color:  #C1D4D9">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px; margin-bottom: 20px;">
          <h5>
            <p class="badge badge-info">Medico prescrittore</p>
          </h5>
          <h5 id="nome_medico_non_erogata"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5 id="data_non_erogata"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>
          </h5>
         <h5 id="visita_riferimento_non_erogata"></h5>
         <button id="bottone_riferimento_non_erogata" class="btn btn-info">Vedi visita</button>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Prescrizione</p>
          </h5>
          <p id="farmaco_non_erogata" class="card-body text-left" style="border-style: solid; border-radius: 20px;"></p>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">PDF ricetta</p>
          </h5>
          <form id="formScaricaPrescrizione" name="formScaricaPrescrizione" method="GET" action="scaricaPrescrizione">
          <input type="hidden" name="id_prescrizione">
          <a href="#" type="submit" class="btn btn-success">Scarica PDF</a>
          </form>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Codice QR</p>
          </h5>
          <button class="btn btn-success" data-toggle="collapse" data-target="#collpase_qr_non_erogata"><i class="fa fa-qrcode"></i> Mostra QR</button>
          <div id="collpase_qr_non_erogata" class="collapse text-center" style="margin-top: 20px;"> <div id="qr_non_erogata" class="text-center container" style="width: 300px; height: 300px;"></div> </div>
        </div>
         </div>
        <!-- Modal footer -->
        <div class="modal-footer text-light" style="background-color: #205373">
          <h6 id="codice_footer_non_erogata" class="badge text-dark badgeNumeroVisitaEsame" style="margin-top:10px;"> </h6>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
        </div>
      </div>
    </div>
  </div>

<div class="modal fade " id="modalVisitaBase">
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
          <h5 id="completata_tipo_visita_base"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5 id="completata_nome_medico_base"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data e ora</p>
          </h5>
          <h5 id="completata_data_base"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Ricette</p>
          </h5>
          <div class="container">
            <table id="tabella_ricette_base_completata" class="table datatable table-hover table-striped table-bordered tabellaRicetteEsami" style="width:100%">
              <thead >
                <tr>
                  <th>Numero Ricetta</th>
                  <th>Farmaco</th>
                </tr>
              </thead>
              <tbody id="tbody_ricette_base_completata">
              </tbody>
            </table id="tabella_esami_base_completata">
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
          <div class="container">
            <table id="tabella_esami_base_completata" class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
              <thead style="width:100%">
                <tr>
                  <th>Numero Esame</th>
                  <th>Esame</th>
                </tr>
              </thead>
              <tbody id="tbody_esami_base_completata">
              </tbody>
            </table>
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visite</p>
          </h5>
          <div class="container">
            <table id="tabella_visite_base_completata" class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
              <thead >
                <tr>
                  <th>Numero Visita</th>
                  <th>Tipo</th>
                </tr>
              </thead>
              <tbody id="tbody_visite_base_completata">
              </tbody>
            </table>
          </div>
			 <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Scarica referto</p>
          </h5>
			<a href="#" class="btn btn-success"><i class="fa fa-download"></i> Scarica referto</a>
        </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="completata_numero_footer_base" class="badge badgeNumeroVisitaEsame"> </h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade " id="modalVisitaSpecialistica">
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


<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/medico_base/utils_ricette_paziente_medico_base.js"></script>
</body>
</html>