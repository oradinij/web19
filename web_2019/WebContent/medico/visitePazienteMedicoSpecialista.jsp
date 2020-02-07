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
  <h2 style="margin-bottom: 20px;">Visite di: <span class="badge badge-info">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</span></h2>
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPazienteSpecalista">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button class="btn btn-success" onclick="loading_modal()" type="submit"><i class="fa fa-arrow-circle-left"></i> Torna al paziente</button>
  </form>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Le tue visite prenotate</h3>
    &nbsp;
    <table id="tabellaVisitePrenotate" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%;">
      <thead>
        <tr>
          <th>Data e ora Prenotazione</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${visita_corrente.paziente.lista_visite_prenotate}" var="visita">
      <c:if test="${visita.id_visita != 1 && visita.stato==1 && visita.id_medico==visita_corrente.id_medico}">
        <tr>
          <td style="vertical-align: middle">${visita.data_ora}</td>
          <td style="vertical-align: middle"><button href="#" id="bottone_dettagli${visita.id_prenotazione}" data-toggle="modal" onclick="modalPrenotazioneSpecialisticaMia(${visita.id_prenotazione})" class="btn btn-outline-info"> <i class="fa fa-info-circle"></i> Dettagli</button></td>
          <td style="vertical-align: middle"><button href="#"  data-toggle="modal" onclick="modal_compilazione_visita_specialistica(${visita.id_prenotazione})" class="btn btn-outline-success"><i class="fa fa-clipboard-list-check"></i> Compila</button></td>
        </tr>
       </c:if>
    </c:forEach>
      </tbody>
    </table>
  </div>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Visite specialistiche prescritte: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaVisiteSpecialistichePrescritte" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%;">
        <thead>
          <tr>
            <th>Data prescrizione</th>
            <th>Tipo</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
         <c:forEach items="${visita_corrente.paziente.lista_visite_da_prenotare}" var="visita">
          <tr>
            <td style="vertical-align: middle">${visita.data}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
            <td style="vertical-align: middle"><button id="bottone_dettagli${visita.id_prenotazione}" onclick="modalDettagliPrescrizioneSpecialistica(${visita.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
         </c:forEach>
         <c:forEach items="${visita_corrente.paziente.lista_visite_prenotate}" var="visita">
          <tr>
            <td style="vertical-align: middle">${visita.data_ora}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
            <td style="vertical-align: middle"><button id="bottone_dettagli${visita.id_prenotazione}" onclick="modalDettagliPrenotazioneSpecialistica(${visita.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
      <hr>
		<h5>Per prescrivere una visita specialistica, compila una visita di base. </h5>
    </div>
  </div>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px; margin-bottom:20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Visite effettuate: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaVisiteEffettuate" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%;">
        <thead>
          <tr>
            <th>Data</th>
            <th>Tipo</th>
            <th>Dottore</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.lista_visite_svolte}" var="visita">
          <tr>
            <td style="vertical-align: middle">${visita.data}</td>
    
         <c:if test="${visita.id_visita!=1}">
                     <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
            </c:if>
              <c:if test="${visita.id_visita==1}">
                     <td style="vertical-align: middle"><span class="badge badge-pill badge-secondary">${visita.nome_visita}</span></td>
            </c:if>
            <td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
              <c:if test="${visita.id_visita!=1}">
            <td style="vertical-align: middle"><button  id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_specialistica(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
            <c:if test="${visita.id_visita==1}">
            
            <td style="vertical-align: middle"><button id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_base(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>
<br>


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

  function loading_modal (){
  
$('#loading_modal').modal({
    backdrop: 'static',
    keyboard: false
})


  
  }
  
</script>
  

<script>

var id_visita_da_cancellare;
var ricetta_da_eliminare;

function ajaxRemoveVisite(visita){
	
	$.ajax({
		
		url: 'annullaPrescrizioneVisita?id_visita='+ visita,
        type: "GET",
        success: function (result){

        	document.getElementById('tbody_tabella_visite').innerHTML="";	
        	
        	result.lista_visite.forEach(el =>{
        		
        		
        	$("#tbody_tabella_visite").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.nome_visita + "</td><td  align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveVisite('"+el.id_visita+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
				
        		           
        	});
        	
          
        	
        	if(result.lista_visite.length==0){

        	$('#tabellaVisite').DataTable().columns.adjust().draw();
        	}
        	
        }, 
        
        error: function(err){
        	
        	console.log(err);
        	
        	
        }
	
	});
	
	
	
	
	
}


function ajaxRemoveEsami(esame){
	
	$.ajax({
		
		url: 'http://localhost:8080/web2019/medico/annullaPrescrizioneEsame?id_esame='+ esame,
        type: "GET",
        success: function (result){

        	document.getElementById('tbody_tabella_esami').innerHTML="";	
        	
        	
        	result.lista_esami.forEach(el =>{
        		
        		
   
        		
        		
        		$("#tbody_tabella_esami").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.nome_esame + "</td><td align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveEsami('"+el.id_esame+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
				
        		           
        	});
        	
        	if(result.lista_esami.length==0){

        	$('#tabellaEsami').DataTable().columns.adjust().draw();
        	}
        	
        }, 
        
        error: function(err){
        	
        	console.log(err);
        	
        	
        }
	
	});
	
	
	
	
	
}



function ajaxRemoveRicetta(prescrizione){
	
	$.ajax({
		
		url: 'http://localhost:8080/web2019/medico/annullaPrescrizioneFarmaco?prescrizione='+ prescrizione,
        type: "GET",
        success: function (result){

        	document.getElementById('tbody_tabella_ricette').innerHTML="";	
        	
        	
        	result.lista_prescrizioni.forEach(el =>{
        		
        		
   
        		
        		
        	$("#tbody_tabella_ricette").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el+ "</td><td align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveRicetta('"+el+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
				
        		           
        	});
        	
        	if(result.lista_prescrizioni.length==0){
        	
        	$('#tabellaRicette').DataTable().columns.adjust().draw();
        	}
        	
        }, 
        
        error: function(err){
        	
        	console.log(err);
        	
        	
        }
	
	});
	

	
	
	
}

function aggiungiReferto() {
	
	var testo_referto;
	
	testo_referto=document.getElementById('testo_referto').value;
	
	console.log(testo_referto);
	
	if(testo_referto==""){
		
		window.alert("Compila il referto!");
		
	}
	
	else {
	
	$.ajax({
		
		url: 'http://localhost:8080/web2019/medico/AggiungiReferto?referto='+ testo_referto,
        type: "GET",
        success: function (result) { 
        	
        	document.getElementById('bottone_referto').innerHTML="<i class=\"fa fa-edit\"></i> Modifica referto";
	
        	
        console.log(result);
        	
        document.getElementById('referto_compilazione').innerHTML=result.referto;
        
        $('#modalNuovoReferto').modal('hide');
        
        },   
            
        error: function (err){
        	
        	console.log(err);
			
        }
        });
	
	}
		
	};


function aggiungiPrescrizione() {
	
	var testo_prescrizione;
	
	testo_prescrizione=document.getElementById('testo_prescrizione').value;
	
	console.log(testo_prescrizione);
	
	if(testo_prescrizione==""){
		
		window.alert("Compila la ricetta!");
		
	}
	
	else {
	
	$.ajax({
		
		url: 'http://localhost:8080/web2019/medico/AggiungiPrescrizione?prescrizione='+ testo_prescrizione,
        type: "GET",
        success: function (result) { 
        	
        console.log(result);
        	
        
        
        
        	$('#modalNuovaRicetta').modal('hide');
        	document.getElementById('tbody_tabella_ricette').innerHTML="";	
        	
        	result.lista_prescrizioni.forEach(el =>{
        		
        		
   
        		
        		
        	$("#tbody_tabella_ricette").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el + "</td><td  align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveRicetta('"+el+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
				
        		           
        	});
        	
            $('#modalCompilazione').modal('show');
            
            },
            
            
            
         error: function (err){
        	
        	console.log(err);
			
        }
        });
	
	}
		
	};
	

	function aggiungiEsame() {
		
		var tipo_esame = [];
		var url="http://localhost:8080/web2019/medico/AggiungiEsame"
		 var radios = document.getElementsByName('exam'); 
      
		 
         for(i = 0; i < radios.length; i++) { 
             if(radios[i].checked) 
            	 url=url + "?id_esame="+ radios[i].value; 
             	
         } 
		
  	   $.ajax({
	        url: url,
	        type: "GET",
	        success: function (result) { 

	        	console.log(result);
	        	
	        	$('#modalNuovoEsame').modal('hide');
	        	document.getElementById('tbody_tabella_esami').innerHTML="";	
	        	
	        	result.lista_esami.forEach(el =>{
	        		
	        		
	        	$("#tbody_tabella_esami").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.nome_esame + "</td><td  align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveEsami('"+el.id_esame+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
					
	        		           
	        	});
	        	
	            $('#modalCompilazione').modal('show');
	        	
	        	
	        	
	            },
	         error: function (err){
	        	
	        	console.log(err);
				
	        }
	        });
			

			
		};
		

		function aggiungiVisita() {
			
			
			var tipo_visita = [];
			var url="AggiungiVisita"
			 var radios = document.getElementsByName('visit'); 
	      
			 
	         for(i = 0; i < radios.length; i++) { 
	             if(radios[i].checked) 
	            	 url=url + "?visite_selezionate="+ radios[i].value; 
	         }
			
	  	   $.ajax({
		        url: url,
		        type: "GET",
		        success: function (result) { 

		        	console.log(result);
		        	
		        	$('#modalNuovaVisitaSpecialistica').modal('hide');
		        	document.getElementById('tbody_tabella_visite').innerHTML="";	
		        	
		        	result.lista_visite.forEach(el =>{
		        		
		        		
		        	$("#tbody_tabella_visite").append("<tr><td align=\"center\" style=\"vertical-align:middle\">" + el.nome_visita + "</td><td  align=\"center\" style=\"vertical-align:middle\"><button onclick= \"ajaxRemoveVisite('"+el.id_visita+"');\" class=\"btn btn-outline-danger\">Elimina</button></td>");
						
		        		           
		        	});
		        	
		        	
		        	  $('#loading_modal').modal('hide');
		        	
		            $('#modalCompilazione').modal('show');
		        	
		        	
		        	
		            },
		         error: function (err){
		        	
		        	console.log(err);
					
		        }
		        });
				

				
			};
			

function modal_compilazione_visita_specialistica(id){

	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/nuovaCompilazioneVisita?id_visita='+id,
	        type: "GET",
	        success: function (result) { 
	        	document.getElementById('compila_badge_numero_footer').innerHTML="Codice prenotazione: " + id;
	        	
	            $('#modalCompilazione').modal('show');
	            
	   
	             
		
	            
	            },
	         error: function (err){
	        	
	        	console.log(err);
				
	        }
	        });
	    
	   
	
	};
	
	
	
	
	
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

function modal_svolta_base(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

	 
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
	            
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_svolta_base("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	            
	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};
	
	function modalPrenotazioneSpecialisticaMia(id){
		
		document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

		 
		   $.ajax({
		        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
		        type: "GET",
		        success: function (result) { 
		        	console.log(result);
		            document.getElementById('prenotazione_data_mia').innerHTML=result.visita.data_ora;
		            document.getElementById('prenotazione_numero_footer_mia').innerHTML="Codice prenotazione: " + id;
		            document.getElementById('bottone_annullamento_prenotazione').outerHTML= "<a id=\"bottone_annullamento_prenotazione\" href=\"#\" class=\"btn btn-danger\" onclick=\"modalCancellazionePrenotazione(" + id + ")\">Annulla prenotazione</a>"
		            document.getElementById('bottone_compila_modal_prenotazione').outerHTML= "<a id=\"bottone_compila_modal_prenotazione\" href=\"#\" class=\"btn btn-success\" onclick=\"modal_compilazione_visita_specialistica(" + id + ")\">Compila</a>"
		            $('#modalPrenotazioneSpecialisticaMia').modal('show');
		            },
		            
		         error: function (result){
		        	
		        	console.log(result);
		        	
		        	
		        	}   
		        });
		    
       	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalPrenotazioneSpecialisticaMia("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

		};	
		
		
		
		function modalDettagliPrenotazioneSpecialistica(id){
			
			document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

			 
			   $.ajax({
			        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
			        type: "GET",
			        success: function (result) { 
			        	console.log(result);
			            document.getElementById('prenotazione_data_spec').innerHTML=result.visita.data_ora;
			            document.getElementById('prenotazione_numero_footer_spec').innerHTML="Codice prenotazione: " + id;
			            document.getElementById('prenotazione_nome_visita_spec').innerHTML=result.visita.nome_visita;
			            document.getElementById('prenotazione_medico_spec').innerHTML=result.visita.nome_medico + " " + result.visita.cognome_medico;
			            			
			            $('#modalPrenotazioneSpecialistica').modal('show');
			            },
			            
			         error: function (err){
			        	
			        	console.log(err);
			        	
			        	
			        	}
			        });
			   
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalDettagliPrenotazioneSpecialistica("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

			    
			  
			};	
		
			
			function modalDettagliPrescrizioneSpecialistica(id){
				
				document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

				 
				   $.ajax({
				        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
				        type: "GET",
				        success: function (result) { 
				        	console.log(result);
				            document.getElementById('prescrizione_data_spec').innerHTML=result.visita.data;
				            document.getElementById('prescrizione_numero_footer_spec').innerHTML="Codice prescrizione: " + id;
				            document.getElementById('prescrizione_nome_visita_spec').innerHTML=result.visita.nome_visita;
				            document.getElementById('prescrizione_medico_spec').innerHTML=result.visita.nome_medico + " " + result.visita.cognome_medico;
				            			
				            $('#modalPrescrizioneSpecialistica').modal('show');
				            },
				            
				         error: function (err){
				        	
				        	console.log(err);
				        	
				        	
				        	}
				        });
				   
		        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalDettagliPrescrizioneSpecialistica("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

				    
				  
				};	
				
				
				
			
		function modalCancellazionePrenotazione(id){
		
			
			
			$('#modalCancellazionePrenotazione').modal('show');
			
			document.getElementById('id_to_delete').innerHTML=id;
			document.getElementById('input_to_delete').value = id;
			
		}
		
		
		function concludiVisita(){
			
			
			if(document.getElementById('referto_compilazione').innerHTML==""){
				
				window.alert("Compila il referto!");
				
			}
			
			else {
			
			 $('#modalPrenotazioneSpecialisticaMia').modal('hide');
			 $('#modalCompilazione').modal('hide'); 
			 loading_modal();
			 $('#formConcludiVisita').submit();
			
			}
			
			
		}
		
		
</script>



<div class="modal fade modalToClose" id="modalPrenotazioneSpecialisticaMia">
 <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli prenotazione visita specialistica</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data e ora prenotazione</p>
          </h5>
          <h5 id="prenotazione_data_mia"></h5>
          
          <a id="bottone_annullamento_prenotazione" href="#" class="btn btn-danger" onclick="">Annulla prenotazione</a>
          
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Compila visita</p>
          </h5>
          <a id="bottone_compila_modal_prenotazione" href="#"  class="btn btn-success"></a> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 class="badge badgeNumeroVisitaEsame" style="margin-top:10px;" id="prenotazione_numero_footer_mia">Codice prenotazione: ${visita.id_prenotazione} </h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>
<div class="modal  fade" id="modalPrenotazioneSpecialistica">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli prenotazione visita</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data prenotazione</p>
          </h5>
          <h5 id="prenotazione_data_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Tipo</p>
          </h5>
          <h5 id="prenotazione_nome_visita_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5 id="prenotazione_medico_spec"></h5>
        </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="prenotazione_numero_footer_spec" class="badge badgeNumeroVisitaEsame" style="margin-top:10px;"></h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>

<div class="modal  fade" id="modalPrescrizioneSpecialistica">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli prescrizione visita</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5 id="prescrizione_data_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Tipo</p>
          </h5>
          <h5 id="prescrizione_nome_visita_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico prescrittore</p>
          </h5>
          <h5 id="prescrizione_medico_spec"></h5>
        </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="prescrizione_numero_footer_spec" class="badge badgeNumeroVisitaEsame" style="margin-top:10px;"></h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      </div>
    </div>
  </div>
</div>

<div class="modal fade modalToClose" id="modalCompilazione">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Compila visita specialistca</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->

      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data visita</p>
          </h5>
          <div class="form-group text-center container" style="border-radius: 20px; ; max-width: 60%">
            <form id="formConcludiVisita" action="./concludiVisita" method="post" class="text-center" style="display: inline-block">
              <div class="input-group date" id="datePickerVisita" data-target-input="nearest" style="max-width: 200px;">
                <input required name="data" type="text" class="form-control datetimepicker-input text-center" readonly data-target="#datetimepickerVisita" id="dataVisita">
                <div class="input-group-append" data-target="#datetimepickerVisita" data-toggle="datetimepicker">
                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
              </div>
            </form>
          </div>
          <hr class="bg-light">
           <h5>
            <p class="badge badge-info">Referto</p>
          </h5>
          <p id="referto_compilazione" class="card-body text-left" style="border-style: solid; border-radius: 20px;"></p>
          <br>
          <a id="bottone_referto" href="#" data-toggle="modal" data-target="#modalNuovoReferto" class="btn btn-success"><i class="fa fa-plus-circle"></i> Compila referto</a>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Ricette</p>
          </h5>
          <br>
          <div class="container" >
          <table class="table datatable table-light table-bordered table-hover table-striped tabellaRicetteEsami" id="tabellaRicette" style="width: 100%;">
            <thead>
              <tr>
                <th align="center">Farmaci</th>
                <th align="center">Rimuovi</th>
              </tr>
            </thead>
            <tbody id="tbody_tabella_ricette">
            </tbody>
          </table>
          </div>
          <br>
          <a href="#" data-toggle="modal" data-target="#modalNuovaRicetta" class="btn btn-success"><i class="fa fa-plus-circle"></i> Aggiungi ricetta</a>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
     
             <div class="container" >
          <table class="table datatable table-light table-hover table-bordered table-striped tabellaRicetteEsami" id="tabellaEsami" style="width:100%">
            <thead>
              <tr>
                <th align="center">Esame</th>
                <th align="center">Rimuovi</th>
              </tr>
            </thead>
            <tbody  id="tbody_tabella_esami">
            </tbody>
          </table>
          </div>
 	<br>
          <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalNuovoEsame"><i class="fa fa-plus-circle"></i> Prescrivi esame</a>
          
          
                <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visite specialistiche</p>
          </h5>
     
             <div class="container" >
          <table class="table datatable table-light table-hover table-bordered table-striped tabellaRicetteEsami" id="tabellaVisite" style="width:100%">
            <thead>
              <tr>
                <th align="center">Visita</th>
                <th align="center">Rimuovi</th>
              </tr>
            </thead>
            <tbody  id="tbody_tabella_visite">
            </tbody>
          </table>
          </div>
 	<br>
          <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalNuovaVisitaSpecialistica"><i class="fa fa-plus-circle"></i> Prescrivi visita</a>
          
          
           </div>
      

      
      
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="compila_badge_numero_footer" class="badge badgeNumeroVisitaEsame"></h6>
        <button onclick="concludiVisita()" class="btn btn-success" >Compila visita</button>
        <button class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade" id="modalVisitaBase">
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
<div class="modal fade" id="modalCancellazionePrenotazione">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Cancella prenotazione</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <h5 class="bg-warning text-center" id="delete_confirm_message" style="border-radius: 20px; padding: 10px;">Sei sicuro di voler cancellare la prenotazione <span id="id_to_delete"></span> per il paziente?</h5>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      <form action="annullaPrenotazioneVisitaSpecialistica">
      <input name="id_prenotazione" id="input_to_delete" type="hidden">
      <button type="submit" onclick="$('#modalCancellazionePrenotazione').modal('hide'); $('#modalPrenotazioneSpecialisticaMia').modal('hide'); loading_modal()" class="btn btn-warning">Cancella prenotazione</button>
       </form>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade text-center" id="modalNuovaRicetta">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Compila una nuova ricetta</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <h5><span class="badge badge-info">Prescrizioni</span></h5>
        <div class="form-group">
          <textarea id="testo_prescrizione" class="form-control" name="prescrizione" style="min-height: 400px;"></textarea>
        </div>
      </div>
      <div class="modal-footer"> <a href="#" onclick="aggiungiPrescrizione()" class="btn btn-success"><i class="fa fa-check-circle"></i> Inserisci ricetta</a>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade text-center" id="modalNuovoReferto">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Compila referto</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <h5><span class="badge badge-info">Referto</span></h5>
        <div class="form-group">
          <textarea id="testo_referto" class="form-control" name="referto" style="min-height: 400px;"></textarea>
        </div>
      </div>
      <div class="modal-footer"> <a href="#" onclick="aggiungiReferto()" class="btn btn-success"><i class="fa fa-check-circle"></i> Inserisci referto</a>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>
<div class="modal fade text-center" id="modalNuovoEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Prescrivi un nuovo esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      <form>
        <!-- Modal body -->
        <div class="modal-body text-center">
          <input class="form-control" id="cercaEsame" type="text" placeholder="Cerca un esame..">
          &nbsp;
          <ul class="list-group striped overflow-auto text-left" style="height: 200px; width:100%" id="listaEsami">
            <div required id="tipo_esame" class="custom-radio">
            
            <c:forEach items="${tipi_esame}" var="tipo_esame">
              <li class="list-group-item list-group-item-action" href="#"> &nbsp;
                <input type="radio" class="custom-control-input" id="exam${tipo_esame.id_esame}" name="exam" value="${tipo_esame.id_esame}">
                <label class="custom-control-label" for="exam${tipo_esame.id_esame}"></label>
                <span class="badge badge-info">${tipo_esame.area_esame}</span> &nbsp; ${tipo_esame.nome_esame}</li>
              </c:forEach>
              
            </div>
          </ul>
        </div>
        <div class="modal-footer"> <a href="#" class="btn btn-success" onclick="aggiungiEsame()"><i class="fa fa-check-circle"></i> Prescrivi esame</a>
          <button type="button" action="submit" class="btn btn-danger" data-dismiss="modal">Annulla</button>
        </div>
      </form>
    </div>
  </div>
</div>
<div class="modal fade text-center" id="modalNuovaVisitaSpecialistica">
  	<div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Prescrivi una visita specialistica</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
        <!-- Modal body -->
        <div class="modal-body text-center">
          <input class="form-control" id="cercaArea" type="text" placeholder="Cerca una visita..">
          &nbsp;
          <ul class="list-group striped overflow-auto text-left" style="height: 200px;" id="listaAree">
           <div class=" custom-radio">
     		
        	<c:forEach items="${tipi_visita}" var="tipo_visita">
        	<c:if test="${tipo_visita.id_visita!=1}">
              <li class="list-group-item list-group-item-action" href="#"> &nbsp;
                <input type="radio" class="custom-control-input" id="area${tipo_visita.nome_visita}" name="visit" value="${tipo_visita.id_visita}">
                <label class="custom-control-label" for="area${tipo_visita.nome_visita}"></label>
                <span class="badge badge-info">${tipo_visita.nome_visita}</span> </li>
                </c:if>
                </c:forEach> 
            </div>
          </ul>
        </div>
        <div class="modal-footer"> <button href="#"   class="btn btn-success" onclick="aggiungiVisita()"><i class="fa fa-check-circle"></i> Prescrivi visita</button>
          <button  class="btn btn-danger" data-dismiss="modal">Annulla</button>
        </div>
    </div>
  </div>
</div>

<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>

<script src="../js/medico_base/prenota_visita_timepicker.js"></script> 
<script src="../js/medico_base/modals_visite_medico_base.js"></script>
<script src="../js/medico_base/utils_visite_paziente_medico_base.js"></script>
</body>
</html>