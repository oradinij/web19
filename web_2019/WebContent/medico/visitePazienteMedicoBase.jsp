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
  <form id="formPaziente${visita_corrente.paziente.id}" action="DettagliPaziente">  
       <input type="hidden" value="${visita_corrente.paziente.id}" name="id"> 
  <button class="btn btn-success" type="submit"><i class="fa fa-arrow-circle-left" style="vertical-align: middel"></i> Torna al paziente</button>
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
          <th>Data Prenotazione</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${visita_corrente.paziente.lista_visite_prenotate}" var="visita">
      <c:if test="${visita.nome_visita=='Base'}">
        <tr>
          <td style="vertical-align: middle">${visita.data}</td>
          <td style="vertical-align: middle"><a href="#" data-toggle="modal" onclick="modalDettagliPrenotazioneBase(${visita.id_prenotazione})" class="btn btn-outline-info"> <i class="fa fa-info-circle"></i> Dettagli</a></td>
          <td style="vertical-align: middle"><a href="#" data-toggle="modal" onclick="modal_compilazione_visita_base(${visita.id_prenotazione})" class="btn btn-outline-success"><i class="fa fa-clipboard-list-check"></i> Compila</a></td>
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
            <td style="vertical-align: middle"><ar onclick="modalDettagliPrenotazioneSpecialistica(${visita.id_prenotazione})" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</a></td>
          </tr>
         </c:forEach>
        </tbody>
      </table>
      <hr>
      <button href="#" data-toggle="modal" data-target="#modalNuovaVisitaSpecialistica" class="btn btn-success"><i class="fa fa-plus-circle" style=" font-size: 20px; vertical-align: middle; padding: 5px 5px"></i> Prescrivi nuova visita specialistica</button>
    </div>
  </div>
</div>
&nbsp;
<hr>
&nbsp;
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px; margin-bottom:20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    <h3>Le tue visite effettuate: </h3>
    &nbsp;
    <div class="container">
      <table id="tabellaVisiteEffettuate" class="table datatable table-striped table table-hover tabella_visite" style="width: 100%;">
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
            <c:if test="${visita.nome_visita=='Base'}">
            <td style="vertical-align: middle"><span class="badge badge-pill badge-secondary">${visita.nome_visita}</span></td>
            </c:if>
            <c:if test="${visita.nome_visita!='Base'}">
            <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
            </c:if>
            <td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
              <c:if test="${visita.nome_visita!='Base'}">
            <td style="vertical-align: middle"><button onclick="modal_svolta_specialistica(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
            <c:if test="${visita.nome_visita=='Base'}">
            <td style="vertical-align: middle"><button onclick="modal_svolta_base(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
            </c:if>
          </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
  </div>
</div>


<script>
var id_visita_da_cancellare;


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
        	
        function ajaxRemoveVisita(prescrizione){
			
        	$.ajax({
        		
        		url: 'http://localhost:8080/web2019/medico/annullaPrescrizioneFarmaco?prescrizione='+ prescrizione,
                type: "GET" 
        	
        	});
        	
        	$(this).closest('tr').remove();
			
			
			
		}
        
        
        	$('#modalNuovaRicetta').modal('hide');
        	
        	result.lista_prescrizioni.forEach(el =>{
        		
        		
        		
        		
        		
        	$("#tbody_tabella_ricette").append("<tr><td>" + el + "</td><td><button onclick=\"ajaxRemoveVisita(el)\" class=\"btn btn-outline-danger\">Elimina</button><td>");
				
        		           
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
		
		 var radios = document.getElementsByName('exam'); 
      
		 
         for(i = 0; i < radios.length; i++) { 
             if(radios[i].checked) 
            	 tipo_esame.push(radios[i].value); 
             	
         } 
		
		console.log(tipo_esame);
		

			
		};
		
	

function modal_compilazione_visita_base(id){
	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/nuovaCompilazioneVisita?id_visita='+id,
	        type: "GET",
	        success: function (result) { 
	        	document.getElementById('compila_badge_numero_footer').innerHTML="Codice prenotazione: " + id;
	        	
	            $('#modalCompilazione').modal('show');
	            },
	         error: function (err){
	        	
	        	console.log(err);
				document.getElementById('compila_badge_numero_footer').innerHTML="Codice prenotazione: " + id;
	        	
	            $('#modalCompilazione').modal('show');
	        }
	        });
	    
	  
	};
	
	
	
	
	
  function modal_svolta_specialistica(id){
 
   $.ajax({
        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
        type: "GET",
        success: function (result) { 
        	console.log(result);
            document.getElementById('completata_data_spec').innerHTML=result.data;
            document.getElementById('completata_nome_medico_spec').innerHTML=result.nome_medico + " " + result.cognome_medico;
            document.getElementById('completata_referto_spec').innerHTML=result.referto;
            document.getElementById('completata_tipo_visita_spec').innerHTML=result.nome_visita;
            document.getElementById('completata_luogo_spec').innerHTML=result.luogo;
            document.getElementById('completata_numero_footer_specialistica').innerHTML="Codice visita: " + id; 
            
            $('#modalVisitaSpecialistica').modal('show');
            },
         error: function (result){
        	
        	console.log(result);
        	
        	
        }
        });
    
  
};
function modal_svolta_base(id){
	 
	   $.ajax({
	        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
	        type: "GET",
	        success: function (result) { 
	        	console.log(result);
	            document.getElementById('completata_data_base').innerHTML=result.data;
	            document.getElementById('completata_nome_medico_base').innerHTML=result.nome_medico + " " + result.cognome_medico;    
	            document.getElementById('completata_tipo_visita_base').innerHTML=result.nome_visita;
	            document.getElementById('completata_luogo_spec').innerHTML=result.luogo;
	            document.getElementById('completata_numero_footer_base').innerHTML="Codice visita: " + id; 
	            $('#modalVisitaBase').modal('show');
	            },
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
	  
	};
	
	function modalDettagliPrenotazioneBase(id){
		 
		   $.ajax({
		        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
		        type: "GET",
		        success: function (result) { 
		        	console.log(result);
		            document.getElementById('prenotazione_data_base').innerHTML=result.data;
		            document.getElementById('prenotazione_numero_footer_base').innerHTML="Codice prenotazione: " + id;
		            document.getElementById('bottone_annullamento_prenotazione').outerHTML= "<a id=\"bottone_annullamento_prenotazione\" href=\"#\" class=\"btn btn-danger\" onclick=\"modalCancellazionePrenotazione(" + id + ")\">Annulla prenotazione</a>"
		            $('#modalPrenotazioneBase').modal('show');
		            },
		            
		         error: function (result){
		        	
		        	console.log(result);
		        	
		        	
		        	}
		        });
		    
		  
		};	
		
		
		
		function modalDettagliPrenotazioneSpecialistica(id){
			 
			   $.ajax({
			        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
			        type: "GET",
			        success: function (result) { 
			        	console.log(result);
			            document.getElementById('prenotazione_data_spec').innerHTML=result.data;
			            document.getElementById('prenotazione_numero_footer_spec').innerHTML="Codice prenotazione: " + id;
			            document.getElementById('prenotazione_nome_visita_spec').innerHTML=result.nome_visita;
			            document.getElementById('prenotazione_medico_spec').innerHTML=result.nome_medico + " " + result.cognome_medico;
			            
			            $('#modalPrenotazioneSpecialistica').modal('show');
			            },
			            
			         error: function (result){
			        	
			        	console.log(result);
			        	
			        	
			        	}
			        });
			    
			  
			};	
		
		function modalCancellazionePrenotazione(id){
		
			id_visita_da_cancellare=id;
			console.log(id_visita_da_cancellare);
			$('#modalCancellazionePrenotazione').modal('show');
			
		}
</script>



<div class="modal fade modalToClose" id="modalPrenotazioneBase">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Dettagli prenotazione visita base</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data e ora prenotazione</p>
          </h5>
          <h5 id="prenotazione_data_base"></h5>
          
          <a id="bottone_annullamento_prenotazione" href="#" class="btn btn-danger" onclick="">Annulla prenotazione</a>
          
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Compila visita</p>
          </h5>
          <a href="#" data-toggle="modal" data-target="#modalCompilazione" class="btn btn-success">Compila visita</a> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 class="badge badgeNumeroVisitaEsame" style="margin-top:10px;" id="prenotazione_numero_footer_base">Codice prenotazione: ${visita.id_prenotazione} </h6>
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
            <p class="badge badge-info">Data prescrizione</p>
          </h5>
          <h5 id="prenotazione_data_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Tipo</p>
          </h5>
          <h5 id="prenotazione_nome_visita_spec"></h5>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Medico prescrittore</p>
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
<div class="modal fade modalToClose" id="modalCompilazione">
  <div class="modal-dialog">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light">
        <h4 class="modal-title">Compila visita base</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <div class="modal-body">
        <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
          <h5>
            <p class="badge badge-info">Data visita</p>
          </h5>
          <div class="form-group text-center container" style="border-radius: 20px; ; max-width: 60%">
            <form action="#" method="post" class="text-center" style="display: inline-block">
              <div class="input-group date" id="datePickerVisita" data-target-input="nearest" style="max-width: 200px;">
                <input required name="dataVisita" type="text" class="form-control datetimepicker-input text-center" readonly data-target="#datetimepickerVisita" id="dataVisita">
                <div class="input-group-append" data-target="#datetimepickerVisita" data-toggle="datetimepicker">
                  <div class="input-group-text"><i class="fa fa-calendar"></i></div>
                </div>
              </div>
            </form>
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Ricette</p>
          </h5>
          <table class="table datatable table-light table table-hover table-striped tabellaRicetteEsami" id="tabellaRicette" style="width: 100%;">
            <thead>
              <tr>
                <th>Farmaci</th>
                <th>Dettagli</th>
              </tr>
            </thead>
            <tbody id="tbody_tabella_ricette">
            </tbody>
          </table>
          <a href="#" data-toggle="modal" data-target="#modalNuovaRicetta" class="btn btn-success"><i class="fa fa-plus-circle"></i> Aggiungi ricetta</a>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
          <table class="table table-light table-hover table-striped tabellaRicetteEsami" id="tabellaEsami">
            <thead style="width:100%">
              <tr>
                <th>Esame</th>
                <th>Dettagli</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td> 123456789067677 </td>
                <td><a class="btn btn-outline-info">Dettagli</a></td>
              </tr>
             
            </tbody>
          </table>
          <a href="#" class="btn btn-success" data-toggle="modal" data-target="#modalNuovoEsame"><i class="fa fa-plus-circle"></i> Prescrivi esame</a> </div>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
        <h6 id="compila_badge_numero_footer" class="badge badgeNumeroVisitaEsame"></h6>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
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
            <table class="table datatable table-hover table-striped table-bordered tabellaRicetteEsami">
              <thead style="max">
                <tr>
                  <th>Numero Ricetta</th>
                  <th>Dettagli</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
              </tbody>
            </table>
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
          <div class="container">
            <table class="table datatable table-hover table-bordered table-striped tabellaRicetteEsami">
              <thead style="max">
                <tr>
                  <th>Numero Esame</th>
                  <th>Dettagli</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
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
            <table class="table datatable table-hover table-striped table-bordered  tabellaRicetteEsami">
              <thead style="width:100%">
                <tr>
                  <th>Numero Ricetta</th>
                  <th>Dettagli</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
              </tbody>
            </table>
          </div>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Esami</p>
          </h5>
          <div class="container">
            <table class="table  datatable table-hover table-striped table-bordered  tabellaRicetteEsami">
              <thead style="width:100%">
                <tr>
                  <th>Numero Esame</th>
                  <th>Dettagli</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
                <tr>
                  <td> 123456789067677 </td>
                  <td><a class="btn btn-outline-info">Dettagli</a></td>
                </tr>
              </tbody>
            </table>
          </div>
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
        <h5 class="bg-warning text-center" style="border-radius: 20px; padding: 10px;">Sei sicuro di voler cancellare la prenotazione <span id="id_to_delete"></span> per il paziente?</h5>
      </div>
      
      <!-- Modal footer -->
      <div class="modal-footer">
      <form action="./annullaPrenotazioneVisita">
      <input name="id_prenotazione" id="input_to_delete" type="hidden">
      <button type="submit" class="btn btn-warning">Cancella prenotazione</button>
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
            <div id="tipo_esame" class="form-check">
            
            <c:forEach items="${tipi_esame}" var="tipo_esame">
              <li class="list-group-item list-group-item-action" href="#"> &nbsp;
                <input type="checkbox" class="custom-control-input" id="exam${tipo_esame.nome_esame}" name="exam" value="${tipo_esame.nome_esame}">
                <label class="custom-control-label" for="exam${tipo_esame.nome_esame}"></label>
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
      <form>
        <!-- Modal body -->
        <div class="modal-body text-center">
          <input class="form-control" id="cercaArea" type="text" placeholder="Cerca una visita..">
          &nbsp;
          <ul class="list-group striped overflow-auto text-left" style="height: 200px; width:100%" id="listaAree">
            <div class="custom-radio">
     
        	<c:forEach items="${tipi_visita}" var="tipo_visita">
              <li class="list-group-item list-group-item-action" href="#"> &nbsp;
                <input type="radio" class="custom-control-input" id="area${tipo_visita.nome_visita}" name="area" value="${tipo_visita.nome_visita}">
                <label class="custom-control-label" for="area${tipo_visita.nome_visita}"></label>
                <span class="badge badge-info">${tipo_visita.nome_visita}</span> </li>
                </c:forEach>
            </div>
          </ul>
        </div>
        <div class="modal-footer"> <a href="#" class="btn btn-success"><i class="fa fa-check-circle"></i> Prescrivi visita</a>
          <button type="button" action="submit" class="btn btn-danger" data-dismiss="modal">Annulla</button>
        </div>
      </form>
    </div>
  </div>
</div>

<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/medico_base/utils_visite_paziente_medico_base.js"></script> 
<script src="../js/medico_base/prenota_visita_timepicker.js"></script> 
<script src="../js/medico_base/modals_visite_medico_base.js"></script>
</body>
</html>