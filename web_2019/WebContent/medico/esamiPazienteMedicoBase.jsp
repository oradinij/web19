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
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link " href="#" role="button" aria-haspopup="true" aria-expanded="false"> Pazienti </a> </li>
      <li class="nav-item"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Visite <span class="badge badge-pill badge-warning">2</span></a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="../images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger  " href="#">Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container text-center" style="background-color: #C1D4D9; border-radius: 20px; padding:20px; max-width: 70%"><img class="rounded-circle " src="../images/utente1img.jpg" width="150" height="150" alt="user" style="margin-bottom: 10px;">
  <h2>Esami di: <span class="badge badge-info">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</span></h2>
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button  onclick="loadingModal()" class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-left" style="vertical-align: middel"></i> Torna al paziente</button>
  </form>
</div>
&nbsp;
<hr>
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Esami prescritti: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaEsamiPrescritti" class="table text-center datatable table-striped table-hover table-light tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Esame</th>
            <th>Area</th>
            <th>Data prescrizione</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
        <c:if test="${esame.stato!=2}">
          <tr>
            <td>${esame.nomeEsame}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.area}</span></td>
            <td style="vertical-align: middle">${esame.data}</td>
            <td style="vertical-align: middle"><button id="bottone_dettagli${esame.id_prenotazione}" onclick="modal_esame_prescritto(${esame.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:if>
          </c:forEach>
        </tbody>
      </table>
      <hr>
      <h5>Per prescrivere un nuovo esame compila una visita: </h5>
      <br>
 <form id="form_visite" action="VisitePaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button onclick="loadingModal()" class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-right" style="vertical-align: middel"></i> Vai alle visite del paziente</button>
  </form>
      </div>
  </div>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Esami effettuati: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaEsamiEffettuati" class="table text-center datatable table-striped table table-hover tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Esame</th>
            <th>Area</th>
            <th>Data</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
        <c:if test="${esame.stato==2}">
          <tr>
            <td class="text-center" style="vertical-align: middle">${esame.nomeEsame}</td>
            <td class="text-center" style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.area}</span></td>
            <td class="text-center" style="vertical-align: middle">${esame.data}</td>
            <td class="text-center" style="vertical-align: middle"><button id="bottone_dettagli${esame.id_prenotazione}" onclick="modal_esame_svolto(${esame.id_prenotazione})"  class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:if>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
&nbsp;


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
  





<div class="modal  fade" id="modalPrenotazioneEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4>Dettagli prescrizone esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Esame</p>
          </h5>
          <h5 id="nome_esame_prescritto"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Specializzazione</p>
          </h5>
          <h5 id="area_prescritto"></h5>
          <hr>
          <h5>
            <p class="badge badge-info">Medico prescrivente</p>
          </h5>
          <h5 id="medico_prescritto"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5 id="data_prescritto"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>   
          </h5>
           <h5 id="visita_riferimento_prescritto"></h5>
          <button id="bottone_riferimento_prescritto"  class="btn btn-info"></button> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="codice_footer_prescritto" class="badge badgeNumeroVisitaEsame" style="margin-top:10px;"></h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>


<script>


function modal_esame_prescritto(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";
	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/modal/dettagli_esame?id_prenotazione='+id,
	        type: "GET",
	        success: function (result) { 
	        	console.log(result);
	            document.getElementById('data_prescritto').innerHTML=result.data;
	            document.getElementById('medico_prescritto').innerHTML=result.nome_medico + " " + result.cognome_medico;    
	            document.getElementById('visita_riferimento_prescritto').innerHTML=result.id_riferimento;
	            document.getElementById('nome_esame_prescritto').innerHTML=result.nome_esame;
	            document.getElementById('codice_footer_prescritto').innerHTML="Codice esame: " + id; 
	            document.getElementById('area_prescritto').innerHTML=result.area;
	            
	            if(result.tipo_riferimento==1){
		            document.getElementById('bottone_riferimento_prescritto').outerHTML="<button id=\"bottone_riferimento_prescritto\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ result.id_riferimento + ",1)\">Vedi visita</button>";
		            } else{
		            	
					document.getElementById('bottone_riferimento_prescritto').outerHTML="<button id=\"bottone_riferimento_prescritto\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ result.id_riferimento + ",1)\">Vedi visita</button>";
		            	
		            }
	               
	            
	            
	            
	            $('#modalPrenotazioneEsame').modal('show');
	            
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_esame_prescritto("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};



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
          
          if(result.tipo_riferimento==1){
	            document.getElementById('bottone_riferimento_svolto').outerHTML="<button id=\"bottone_riferimento_svolto\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ result.id_riferimento + ",2)\">Vedi visita</button>";
	            } else{
	            	
				document.getElementById('bottone_riferimento_svolto').outerHTML="<button id=\"bottone_riferimento_svolto\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ result.id_riferimento + ",2)\">Vedi visita</button>";
	            	
	            }
             
          
          $('#modalEsame').modal('show');
          
       	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_esame_prescritto("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

          
          
          },
          
       error: function (result){
      	
      	console.log(result);
      	
      	
      }
      });
  
	    
	  
	};


	
	
	  function modal_svolta_specialistica(id,stato){
		  
		  if(stato==1){
		  
			document.getElementById("bottone_riferimento_prescritto").outerHTML="<div id=\"spinner_visita_prescritto\" class=\"spinner-grow text-info\"></div>";
		  } else {
			  
			  
				document.getElementById("bottone_riferimento_svolto").outerHTML="<div id=\"spinner_visita_svolto\" class=\"spinner-grow text-info\"></div>";

			  
			  
		  }
	 
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
	            
 				document.getElementById("spinner_visita_prescritto").outerHTML="<button id=\"bottone_riferimento_prescritto\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ id + ",1)\">Vedi visita</button>";

	            } else {
	            	
	 				document.getElementById("spinner_visita_svolto").outerHTML="<button id=\"spinner_visita_svolto\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ id + ",2)\">Vedi visita</button>";
	
	            	
	            }
	            
	            
 				
	            
	            },
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};

	function modal_svolta_base(id, stato){
		
		 if(stato==1){
			  
				document.getElementById("bottone_riferimento_prescritto").outerHTML="<div id=\"spinner_visita_prescritto\" class=\"spinner-grow text-info\"></div>";
			  } else {
				  
				  
					document.getElementById("bottone_riferimento_svolto").outerHTML="<div id=\"spinner_visita_svolto\" class=\"spinner-grow text-info\"></div>";

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
		            
 	 				document.getElementById("spinner_visita_prescritto").outerHTML="<button id=\"bottone_riferimento_prescritto\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ id + ",1)\">Vedi visita</button>";

		            } else {
		            	
		            	
	 	 				document.getElementById("spinner_visita_svolto").outerHTML="<button id=\"bottone_riferimento_svolto\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ id + ",2)\">Vedi visita</button>";
	
		            	
		            	
		            	
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
          <button id="bottone_riferimento_svolto"  class="btn btn-info "></button> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6  id="codice_footer_svolto" class="badge badgeNumeroVisitaEsame"></h6>
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
<script src="../js/medico_base/utils_esami_paziente_medico_base.js"></script>
</body>
</html>