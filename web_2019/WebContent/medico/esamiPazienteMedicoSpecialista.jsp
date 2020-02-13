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
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">${user.nome} ${user.cognome}</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item "> <a class="nav-link" onclick="loadingModal()" href="./homeMedicoSpecialista.jsp">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link " onclick="loadingModal()" href="./pazientiMedicoSpecialista"  role="button"  aria-haspopup="true" aria-expanded="false"> Pazienti</a> </li>
      <li class="nav-item"><a class="nav-link" onclick="loadingModal()" href="CalendarioVisiteSpecialista" role="button" aria-haspopup="true" aria-expanded="false"> Visite</a> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="${user.immagine}"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container text-center" style="background-color: #C1D4D9; border-radius: 20px; padding:20px; max-width: 70%"><img class="rounded-circle " src="${visita_corrente.paziente.foto_path }" width="150" height="150" alt="user" style="margin-bottom: 10px;">
  <h2>Esami di: <span class="badge badge-info">${visita_corrente.paziente.nome} ${visita_corrente.paziente.cognome}</span></h2>
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPazienteSpecalista">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button  onclick="loadingModal()" class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-left" style="vertical-align: middel"></i> Torna al paziente</button>
  </form>
</div>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>I tuoi esami prenotati</h3>
    &nbsp;
    <table id="tabellaEsamiMiei" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%;">
      <thead>
        <tr>
          <th>Data e ora Prenotazione</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
      <c:if test="${esame.stato==1 && esame.id_medico==visita_corrente.id_medico}">
        <tr>
          <td style="vertical-align: middle">${esame.data_ora}</td>
          <td style="vertical-align: middle"><button href="#" id="bottone_dettagli${esame.id_prenotazione}" data-toggle="modal" onclick="modalPrenotazioneEsameMio(${esame.id_prenotazione})" class="btn btn-outline-info"> <i class="fa fa-info-circle"></i> Dettagli</button></td>
          <td style="vertical-align: middle"><button href="#"  onclick="modal_compilazione_esame(${esame.id_prenotazione})" class="btn btn-outline-success"><i class="fa fa-clipboard-list-check"></i> Compila</button></td>
        </tr>
       </c:if>
    </c:forEach>
      </tbody>
    </table>
  </div>
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
            <th>Data prescrizione/prenotazione</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${visita_corrente.paziente.listaEsami}" var="esame">
        <c:if test="${esame.stato==0}">
          <tr>
            <td>${esame.nomeEsame}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.area}</span></td>
            <td style="vertical-align: middle">${esame.data}</td>
            <td style="vertical-align: middle"><button id="bottone_dettagli${esame.id_prenotazione}" onclick="modal_esame_prescritto(${esame.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:if>
          <c:if test="${esame.stato==1}">
          <tr>
            <td>${esame.nomeEsame}</td>
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${esame.area}</span></td>
            <td style="vertical-align: middle">${esame.data}</td>
            <td style="vertical-align: middle"><button id="bottone_dettagli${esame.id_prenotazione}" onclick="modal_esame_prenotato(${esame.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
          </tr>
          </c:if>
          </c:forEach>
        </tbody>
      </table>
      <hr>
      <h5>Per prescrivere un nuovo esame compila una visita: </h5>
      <br>
 <form id="form_visite" action="VisitePazienteSpecialista">  
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
        <c:if test="${esame.stato==2 || esame.stato==3}">
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


<div class="modal fade modalToClose" id="modalPrenotazioneEsameMio">
 <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli prenotazione esame</h4>
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


<div class="modal  fade" id="modalPrescrizioneEsame">
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


<div class="modal  fade" id="modalPrenotazioneEsame">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4>Dettagli prenotazione esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Esame</p>
          </h5>
          <h5 id="nome_esame_prenotato"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Specializzazione</p>
          </h5>
          <h5 id="area_prenotato"></h5>
          <hr>
          <h5>
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5 id="medico_prenotato"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Data e ora prenotazione</p>
          </h5>
          <h5 id="data_prenotato"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Visita di riferimento</p>   
          </h5>
           <h5 id="visita_riferimento_prenotato"></h5>
          <button id="bottone_riferimento_prenotato"  class="btn btn-info"></button> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="codice_footer_prenotato" class="badge badgeNumeroVisitaEsame" style="margin-top:10px;"></h6>
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
      <form action="annullaPrenotazioneEsame">
      <input name="id_prenotazione" id="input_to_delete" type="hidden">
      <button type="submit" onclick="$('#modalCancellazionePrenotazione').modal('hide'); $('#modalPrenotazioneEsameMio').modal('hide'); loading_modal()" class="btn btn-warning">Cancella prenotazione</button>
       </form>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>

<script>


function modalCancellazionePrenotazione(id){

	
	
	$('#modalCancellazionePrenotazione').modal('show');
	
	document.getElementById('id_to_delete').innerHTML=id;
	document.getElementById('input_to_delete').value = id;
	
}



function modalPrenotazioneEsameMio(id){
	
	document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/modal/dettagli_esame?id_prenotazione='+id,
	        type: "GET",
	        success: function (result) { 
	        	console.log(result);
	            document.getElementById('prenotazione_data_mia').innerHTML=result.data_ora;
	            document.getElementById('prenotazione_numero_footer_mia').innerHTML="Codice prenotazione: " + id;
	            document.getElementById('bottone_annullamento_prenotazione').outerHTML= "<a id=\"bottone_annullamento_prenotazione\" href=\"#\" class=\"btn btn-danger\" onclick=\"modalCancellazionePrenotazione(" + id + ")\"><i class=\"fa fa-trash\"></i> Annulla prenotazione</a>"
	            document.getElementById('bottone_compila_modal_prenotazione').outerHTML= "<a id=\"bottone_compila_modal_prenotazione\" href=\"#\" class=\"btn btn-success\" onclick=\"modal_compilazione_esame(" + id + ")\">Compila</a>"
	            $('#modalPrenotazioneEsameMio').modal('show');
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        	}   
	        });
	    
   	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalPrenotazioneEsameMio("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	};	
	



function concludiEsame(){
	
	 function loadingModal() {
		  
		 $('#loading_modal').modal({
		     backdrop: 'static',
		     keyboard: false
		 })


		   
		   }
	
	if(document.getElementById('referto_compilazione').innerHTML==""){
		
		window.alert("Compila il referto!");
		
	}
	
	else {
	
	 $('#modalPrenotazioneEsameMio').modal('hide');
	 $('#modalCompilazione').modal('hide'); 
	 loadingModal();
	 $('#formConcludiEsame').submit();
	
	 
	}
	
	
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
		
		url: 'http://localhost:8080/web2019/medico/AggiungiRefertoEsame?referto='+ testo_referto,
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



function modal_compilazione_esame(id){

	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/nuovaCompilazioneEsame?id_esame='+id,
	        type: "GET",
	        success: function (result) { 
	        	
	        	document.getElementById('referto_compilazione').innerHTML="";
	        	document.getElementById('compila_badge_numero_footer').innerHTML="Codice prenotazione: " + id;
	        	
	            $('#modalCompilazione').modal('show');
	            
	   
	             
		
	            
	            },
	         error: function (err){
	        	
	        	console.log(err);
				
	        }
	        });
	    
	   
	
	};
	

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
	               
	            
	            
	            
	            $('#modalPrescrizioneEsame').modal('show');
	            
	        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modal_esame_prescritto("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};


	function modal_esame_prenotato(id){
		
		document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";
		 
		   $.ajax({
		        url: 'http://localhost:8080/web2019/medico/modal/dettagli_esame?id_prenotazione='+id,
		        type: "GET",
		        success: function (result) { 
		        	console.log(result);
		            document.getElementById('data_prenotato').innerHTML=result.data_ora;
		            document.getElementById('medico_prenotato').innerHTML=result.nome_medico + " " + result.cognome_medico;    
		            document.getElementById('visita_riferimento_prenotato').innerHTML=result.id_riferimento;
		            document.getElementById('nome_esame_prenotato').innerHTML=result.nome_esame;
		            document.getElementById('codice_footer_prenotato').innerHTML="Codice esame: " + id; 
		            document.getElementById('area_prenotato').innerHTML=result.area;
		            
		            if(result.tipo_riferimento==1){
			            document.getElementById('bottone_riferimento_prenotato').outerHTML="<button id=\"bottone_riferimento_prenotato\" class=\"btn btn-info\" onclick=\"modal_svolta_base("+ result.id_riferimento + ",1)\">Vedi visita</button>";
			            } else{
			            	
						document.getElementById('bottone_riferimento_prenotato').outerHTML="<button id=\"bottone_riferimento_prenotato\" class=\"btn btn-info\" onclick=\"modal_svolta_specialistica("+ result.id_riferimento + ",1)\">Vedi visita</button>";
			            	
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
			
			

			$('#tabellaEsamiMiei').DataTable({

				ordering: false,
				paging: false,
				scrollY: 200,
				scrollX: true,
				bInfo: false,
				scrollCollapse: false,
				searching: false
				

			});
			

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



<div class="modal fade modalToClose" id="modalCompilazione" >
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Compila esame</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->

      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data esame</p>
          </h5>
          <div class="form-group text-center container" style="border-radius: 20px; ; max-width: 60%">
            <form id="formConcludiEsame" action="concludiEsame" method="post" class="text-center" style="display: inline-block">
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
          <a id="bottone_referto" href="#" data-toggle="modal"  data-target="#modalNuovoReferto" class="btn btn-success"><i class="fa fa-plus-circle"></i> Compila referto</a>
          <hr class="bg-light">
          
           </div>
      

      
      
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="compila_badge_numero_footer" class="badge badgeNumeroVisitaEsame"></h6>
        <button onclick="concludiEsame()" class="btn btn-success" >Compila esame</button>
        <button class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade text-center" id="modalNuovoReferto" >
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
            <p class="badge badge-info">Data</p>
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
<script src="../js/medico_base/prenota_visita_timepicker.js"></script> 
</body>
</html>