<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html5>
<html lang="it">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Visite</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/paziente/carousel_paziente.css">
<link rel="stylesheet" href="../css/tempusdominus-bootstrap-4.min.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">


<script type="text/javascript" src="../js/popper.min.js"></script>
<script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.js"></script>
<script type="text/javascript" src="../js/datatables.min.js"></script>
<script type="text/javascript" src="../js/jquery.dataTables.js"></script>
<script type="text/javascript" src="../js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
<script type="text/javascript" src="../js/tempusdominus-bootstrap-4.min.js"></script>
<script type="text/javascript" src="../js/paziente/common_esami_visite_pazienti.js"></script>


</head>
<body>
	
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
				<li class="nav-item "><a class="nav-link" href="./dettagliPaziente.jsp">Home <span
						class="sr-only">
							 
						</span></a></li>
				<li class="nav-item "><a class="nav-link" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Dati Personali </a></li>
				<li class="nav-item"><a onclick="loadingModal()" class="nav-link" href="./dettagliPaziente.jsp" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Medico </a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link " href="./ricettePaziente.jsp"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette <span class="badge badge-pill badge-warning">${user.getRicetteNonErogate().size()}</span>
				</a></li>
				<li class="nav-item active"><a  onclick="loadingModal()" class="nav-link" href="./visitePaziente.jsp" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">${user.getLista_visite_da_prenotare().size()}</span>
				</a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link " href="./esamiPaziente.jsp"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">${user.lista_esami_prenotati.size() }</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="${user.foto_path}"></li>
				<li class="nav-item"><a class="btn btn-danger" href="../login/login.jsp"><i class="fa fa-sign-out"></i> Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
	<div class="container"
		style="width:100%; border-radius: 20px; background-color: #C1D4D9">
		<h2 class="text-center">Le tue visite</h2>
		<div class="container text-center">
			<div id="tabelle_visite" class="carousel slide">
				<ul class="carousel-indicators">
					<li id="page1" data-target="#tabelle_visite" data-slide-to="0"
						class="active"></li>
					<li id="page2" data-target="#tabelle_visite" data-slide-to="1"></li>
					<li id="page3" data-target="#tabelle_visite" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite prenotate</h4>
							<p class="text-light">Qui trovi le visite che hai già
								prenotato. Puoi annullare le prenotazioni dal medico di base. Per eliminare quelle dai medici specialistici, contatta il call center.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaVisitePrenotate"
								class="table datatable table-striped table-hover text-center"
								style="background-color: #FFFFFF; width:100%">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data Prenotazione</th>
										<th style="vertical-align: middle">Tipo</th>
										<th style="vertical-align: middle">Dottore</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:forEach items="${user.lista_visite_prenotate}" var="visita">
								<c:if test="${visita.id_visita==1}">
									<tr>
										<td style="vertical-align: middle">${visita.data_ora}</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-secondary">${visita.nome_visita} </span></td>
										<td style="vertical-align: middle">${visita.nome_medico}</td>
										<td style="vertical-align: middle"><button 
											id="bottone_dettagli${visita.id_prenotazione}" onclick="modalDettagliPrenotazioneBase(${visita.id_prenotazione})"
											class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
									</tr>
									</c:if>
									<c:if test="${visita.id_visita!=1}">
									<tr>
										<td style="vertical-align: middle">${visita.data_ora}</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-info">${visita.nome_visita} </span></td>
										<td style="vertical-align: middle">${visita.nome_medico}</td>
										<td style="vertical-align: middle"><button
											id="bottone_dettagli${visita.id_prenotazione}" onclick="modalDettagliPrenotazioneSpecialistica(${visita.id_prenotazione})"
											class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
									</tr>
									</c:if>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite da prenotare</h4>
							<p class="text-light">Qui trovi le visite prescritte ma che
								non hai ancora prenotato.</p>
							<hr class="bg-light">
							&nbsp;
							<table id="tabellaVisiteDaPrenotare"
								class="table datatable text-center table-striped table-hover"
								style="background-color: #FFFFFF; width:100%">
								<thead>
									<tr>
										<th style="vertical-align: middle">Data prescrizione</th>
										<th style="vertical-align: middle">Tipo</th>
										<th></th>
										<th></th>
									
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${user.lista_visite_da_prenotare}" var="visita">
									<tr>
										<td style="vertical-align: middle">${visita.data}</td>
										<td style="vertical-align: middle"><span
											class="badge badge-pill badge-info">${visita.nome_visita}</span></td>	
										<td style="vertical-align: middle"><button href="#"
											id="bottone_dettagli${visita.id_prenotazione}"  onclick="modalDettagliPrescrizioneSpecialistica(${visita.id_prenotazione})"
											class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
										<td style="vertical-align: middle"><button id="bottone_prenota${visita.id_prenotazione}" 
												class="btn btn-outline-success" onclick="modal_prenota(${visita.id_prenotazione},'${user.provincia}')"><i class="fa fa-calendar-edit"></i> Prenota</button></td>
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="carousel-item">
						<div class="container"
							style="max-width: 80%; padding-top: 20px; padding-bottom: 50px;">
							<h4 class="text-light">Visite effettuate</h4>
							<p class="text-light">Qui trovi le visite che hai effettuato.</p>
							<hr class="bg-light">
							&nbsp;
							  <table id="tabellaVisiteEffettuate" class="table datatable table-striped table-hover table-light tabella_visite text-center" style="width: 100%; width:100%">
						        <thead>
						          <tr>
						            <th>Data</th>
						            <th>Tipo</th>
						            <th>Stato</th>
						            <th>Dottore</th>
						            <th></th>
						          </tr>
						        </thead>
						        <tbody>
						        <c:forEach items="${user.lista_visite_svolte}" var="visita">
						        <tr>
						         <c:if test="${visita.id_visita!=1 && visita.stato==2}">
						         			 <td style="vertical-align: middle">${visita.data}</td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-warning">Non pagata</span></td>
						                     <td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
						                     <td style="vertical-align: middle"><button  id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_specialistica(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
						            </c:if>
						            <c:if test="${visita.id_visita!=1 && visita.stato==3}">
						          			 <td style="vertical-align: middle">${visita.data}</td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-info">${visita.nome_visita}</span></td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-success">Pagata</span></td>
						                     <td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
						                     <td style="vertical-align: middle"><button  id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_specialistica(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
						            </c:if>
						         	<c:if test="${visita.id_visita==1  && visita.stato==2}">
						         			 <td style="vertical-align: middle">${visita.data}</td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-secondary">${visita.nome_visita}</span></td>
						                     <td style="vertical-align: middle"><span class="badge badge-pill badge-success">Pagata</span></td>
						                     <td style="vertical-align: middle">${visita.nome_medico} ${visita.cognome_medico}</td>
						                     <td style="vertical-align: middle"><button id="bottone_dettagli${visita.id_prenotazione}" onclick="modal_svolta_base(${visita.id_prenotazione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
						            </c:if>
						          </tr>
						          </c:forEach>
						        </tbody>
						      </table>
						</div>
					</div>
					<a class="carousel-control-prev" href="#tabelle_visite"
						data-slide="prev" style="width: 80px;"> <span
						class="carousel-control-prev-icon"></span>
					</a> <a class="carousel-control-next" href="#tabelle_visite"
						data-slide="next" style="width: 80px;"> <span
						class="carousel-control-next-icon"></span>
					</a>
				</div>
			</div>
		</div>
		
	</div>
	
	<hr>

	<div class="text-center" style="margin-bottom: 40px;">
	<a class="btn btn-info" href="homePaziente.jsp"><i class="fa fa-home"></i> Torna alla home</a>
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
	
	
	
	
	function getData(){
		
		 var data=  $("input[name=data]").val();

		 return data;
	}


function loadingModal() {
	  
	$('#loading_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	})


	  
	  }
	  
	  
function concludi_prenotazione(data, id_medico, id_prenotazione){
	
	var ora=null;
	
	 var radios = document.getElementsByName('slot'); 
     
	   for(i = 0; i < radios.length; i++) { 
       if(radios[i].checked) 
      	 ora=radios[i].value; 
       	
   } 
	

	
	if (ora==null){
		window.alert("Seleziona un'ora!");
		} else {

	
			document.getElementById("bottoneConcludi").outerHTML="<div class=\"spinner-grow text-info\"></div>";

			var time = data +" " + ora;
			
			 $.ajax({
				   
				    url: 'prenotaVisita?time=' + time + '&id_medico=' + id_medico + '&id_prenotazione=' + id_prenotazione,
				      type: "GET",
				      success: function (result) { 
				        
				    	  console.log("OK!");
						  document.getElementById("modalBodyPrenotazione").innerHTML="<h5><span class=\"badge badge-pill badge-success\">Prenotazione effettuata correttamente!</span></h5>";
						  setTimeout(function(){$('#modalPrenota').modal('hide');loadingModal();location.reload();
						  }, 3000);
      						
				          
				          },
				          
				       error: function (err){
				        
				        console.log(err);
				        }
				        
				      
				      });
				          
			
			
			
			
			
			
		};
	
};


function cambia_data(id_prenotazione, provincia, struttura, medico) {


	var id_medico=medico;
			
			   console.log(id_medico);



	document.getElementById('sceltaMedico').innerHTML="<h5>"+ document.getElementById('nome_medico').innerHTML + "</h5> <button onclick=\"cambia_medico(" + id_prenotazione+",'"+ provincia +"','"+struttura +"');\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
	          "</i> Cambia medico</button>";
	  

	document.getElementById("sceltaData").innerHTML="<div class=\"spinner-grow text-info\"></div>";

	          document.getElementById('sceltaData').innerHTML="<div class=\"form-group text-center container\" style=\"border-radius: 20px; ; max-width: 60%\">"+
	            "<form id=\"formConcludiVisita\" class=\"text-center\" style=\"display: inline-block\">" +
	            "<div class=\"input-group date\" id=\"datePickerVisita\" data-target-input=\"nearest\" style=\"max-width: 200px;\">"+
	            "<input required name=\"data\" type=\"text\" class=\"form-control datetimepicker-input text-center\" readonly data-target=\"#datetimepickerVisita\" id=\"dataVisita\">" +
	            "<div class=\"input-group-append\" data-target=\"#datetimepickerVisita\" data-toggle=\"datetimepicker\">" +
	            "<div class=\"input-group-text\"><i class=\"fa fa-calendar\"></i></div>" +
	            "</div></div></form></div>"+
	            "<button onclick=\"seleziona_ora(getData(),'" + id_medico +  "','" + id_prenotazione + "','" + provincia +  "','" + struttura + "')\" class=\"btn btn-success\"><i class=\"fa fa-calendar-alt\"></i> Scegli data</button>";
	          
	          
	            $(function () {


	        		$('#datePickerVisita').datetimepicker({
	        			useCurrent: true,
	        			format: 'YYYY-MM-DD',
	        			locale: 'it',
	        			daysOfWeekDisabled: [0, 6],
	        			ignoreReadonly: true,
	        			inline: true,
	        			sideBySide: true
	        		});
	        	});
	 			      

				
	 			

				document.getElementById('sceltaOra').innerHTML="<h5>Seleziona prima una data.</h5>";	
	        
	       	          
	          
	      
	  
		
	};

function seleziona_ora(data, id_medico, id_prenotazione, provincia, struttura) {



console.log(data);

if (data==null || data==""){
window.alert("Seleziona una data!");
} else {


document.getElementById('sceltaData').innerHTML="<h5>"+ data + "</h5> <button onclick=\"cambia_data('" + id_prenotazione+"','"+ provincia +"','"+struttura +"','"+id_medico +"');\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
          "</i> Cambia data</button>";
  

document.getElementById("sceltaOra").innerHTML="<div class=\"spinner-grow text-info\"></div>";


  $.ajax({
   
    url: 'SlotDisponibiliVisite?data=' + data+ '&id_medico=' + id_medico,
      type: "GET",
      success: function (result) { 
        console.log(result);

          document.getElementById('sceltaOra').innerHTML=

          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaOrari\">"+
          
          "<div required id=\"fascia_oraria\" class=\"custom-radio\">" + "</div></ul>"+


          "<br><button id=\"bottoneConcludi\" onclick=\"concludi_prenotazione('"+ data +"','"+ id_medico + "','"+ id_prenotazione + "')\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
          "</i> Prenota visita</button>";
          
          
         for (var i=0; i<result.length;i++){
          var obj = result[i];

         $('#fascia_oraria').append(

          "<li class=\"list-group-item list-group-item-action\" href=\"#\"> &nbsp; <input type=\"radio\" "+
              "class=\"custom-control-input\" id=\"ora"+ obj +"\" name=\"slot\" value=\""+obj +"\">" +
              "<label class=\"custom-control-label\" for=\"ora"+ obj +"\"></label>" +
                "<span id=\"orario"+ obj + "\" class=\"badge badge-info\">"+ obj.split(":")[0]+":"+obj.split(":")[1] +"</span> &nbsp;</li>" 
          );
        };
      


  
        
                  
          
          },
          
       error: function (err){
        
        console.log(err);
        }
        
      
      });
          

	};  //fine del gigaelse
};



function cambia_medico(id_prenotazione, provincia, struttura) {


	var nome_struttura=struttura;
			

			   console.log(nome_struttura);

	

	document.getElementById('sceltaStruttura').innerHTML="<h5>"+ nome_struttura+ "</h5> <button onclick=\"modal_prenota(" + id_prenotazione+",'"+ provincia + "');\" class=\"btn btn-success\"><i class=\"fa fa-building\">"+
	          "</i> Cambia struttura</button>";
	  

	document.getElementById("sceltaMedico").innerHTML="<div class=\"spinner-grow text-info\"></div>";

	  $.ajax({
		 
		  url: 'scegliStrutturaVisita?nome_struttura=' + nome_struttura+ '&id_prenotazione=' + id_prenotazione,
	      type: "GET",
	      success: function (result) { 
	      	console.log(result);

	          document.getElementById('sceltaMedico').innerHTML="<input class=\"form-control\" "+
	          "id=\"cercaMedico\" type=\"text\" placeholder=\"Cerca un medico...\"> &nbsp;" +

	          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
	          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaMedici\">"+
	          
	          "<div required id=\"id_medico\" class=\"custom-radio\">" + "</div></ul>"+


	          "<br><button onclick=\"seleziona_medico('"+ id_prenotazione +"','" + provincia + "','"+ nome_struttura + "')\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
	          "</i> Scegli medico</button>";
	          
	          
	         for (var i=0; i<result.length;i++){
	         	var obj = result[i];

	 				 $('#id_medico').append(

	 				 	"<li class=\"list-group-item list-group-item-action\" href=\"#\"> &nbsp; <input type=\"radio\" "+
	         			"class=\"custom-control-input\" id=\"medico"+ obj.id_medico +"\" name=\"medico\" value=\""+ obj.id_medico +"\">" +
	         			"<label class=\"custom-control-label\" for=\"medico"+ obj.id_medico +"\"></label>" +
	          			"<span id=\"nominativo_medico"+ obj.id_medico + "\" class=\"badge badge-info\">"+ obj.nome + " " + obj.cognome +"</span> &nbsp;</li>" 
	 				 	);
	 				};
	 			

	 			     
	 		      	$("#cercaMedico").on("keyup", function () {
	 		      		var value = $(this).val().toLowerCase();
	 		      		$("#listaMedici li").filter(function () {
	 		      			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	 		      		});
	 		      	});
	 			

				document.getElementById('sceltaData').innerHTML="<h5>Seleziona prima un medico.</h5>";	
				document.getElementById('sceltaOra').innerHTML="<h5>Seleziona prima un medico.</h5>";	
	        
	       	          
	          
	          },
	          
	       error: function (err){
	      	
	      	console.log(err);
	      	}
	      	
	      
	      });
	  
		
	};




function seleziona_medico(id_prenotazione, provincia, struttura) {


var id_medico=null;
		 var radios = document.getElementsByName('medico'); 
      
		   for(i = 0; i < radios.length; i++) { 
             if(radios[i].checked) 
            	 id_medico=radios[i].value; 
             	
         } 

		   console.log(id_medico);

if (id_medico==null){
window.alert("Seleziona un medico!");
} else {




document.getElementById('sceltaMedico').innerHTML="<h5 id=\"nome_medico\">"+ document.getElementById('nominativo_medico'+ id_medico).innerHTML + "</h5> <button onclick=\"cambia_medico(" + id_prenotazione+",'"+ provincia +"','"+struttura +"');\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
          "</i> Cambia medico</button>";
  

document.getElementById("sceltaData").innerHTML="<div class=\"spinner-grow text-info\"></div>";

          document.getElementById('sceltaData').innerHTML="<div class=\"form-group text-center container\" style=\"border-radius: 20px; ; max-width: 60%\">"+
            "<form id=\"formConcludiVisita\" class=\"text-center\" style=\"display: inline-block\">" +
            "<div class=\"input-group date\" id=\"datePickerVisita\" data-target-input=\"nearest\" style=\"max-width: 200px;\">"+
            "<input required name=\"data\" type=\"text\" class=\"form-control datetimepicker-input text-center\" readonly data-target=\"#datetimepickerVisita\" id=\"dataVisita\">" +
            "<div class=\"input-group-append\" data-target=\"#datetimepickerVisita\" data-toggle=\"datetimepicker\">" +
            "<div class=\"input-group-text\"><i class=\"fa fa-calendar\"></i></div>" +
            "</div></div></form></div>"+
            "<button onclick=\"seleziona_ora(getData(),'" + id_medico +  "','" + id_prenotazione + "','" + provincia +  "','" + struttura + "')\" class=\"btn btn-success\"><i class=\"fa fa-calendar-alt\"></i> Scegli data</button>";
          
          
            $(function () {


        		$('#datePickerVisita').datetimepicker({
        			useCurrent: true,
        			format: 'YYYY-MM-DD',
        			locale: 'it',
        			daysOfWeekDisabled: [0, 6],
        			ignoreReadonly: true,
        			inline: true,
        			sideBySide: true
        		});
        	});
 			      

			
 			

			document.getElementById('sceltaOra').innerHTML="<h5>Seleziona prima una data.</h5>";	
        
       	          
          
      
  
	};  //fine del gigaelse
};


function seleziona_struttura(id_prenotazione, provincia) {


var nome_struttura="";
		 var radios = document.getElementsByName('struttura'); 
      
		   for(i = 0; i < radios.length; i++) { 
             if(radios[i].checked) 
            	 nome_struttura=radios[i].value; 
             	
         } 

		   console.log(nome_struttura);

if (nome_struttura==""){
window.alert("Seleziona una struttura!");
} else {


document.getElementById('sceltaStruttura').innerHTML="<h5>"+ nome_struttura+ "</h5> <button onclick=\"modal_prenota(" + id_prenotazione+",'"+ provincia + "');\" class=\"btn btn-success\"><i class=\"fa fa-building\">"+
          "</i> Cambia struttura</button>";
  

document.getElementById("sceltaMedico").innerHTML="<div class=\"spinner-grow text-info\"></div>";

  $.ajax({
	 
	  url: 'http://localhost:8080/web2019/paziente/scegliStrutturaVisita?nome_struttura=' + nome_struttura+ '&id_prenotazione=' + id_prenotazione,
      type: "GET",
      success: function (result) { 
      	console.log(result);

          document.getElementById('sceltaMedico').innerHTML="<input class=\"form-control\" "+
          "id=\"cercaMedico\" type=\"text\" placeholder=\"Cerca un medico...\"> &nbsp;" +

          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaMedici\">"+
          
          "<div required id=\"id_medico\" class=\"custom-radio\">" + "</div></ul>"+


          "<br><button onclick=\"seleziona_medico('"+ id_prenotazione +"','" + provincia + "','"+ nome_struttura + "')\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
          "</i> Scegli medico</button>";
          
          
	      	$("#cercaMedico").on("keyup", function () {
	      		var value = $(this).val().toLowerCase();
	      		$("#listaMedici li").filter(function () {
	      			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	      		});
	      	});
          
         for (var i=0; i<result.length;i++){
         	var obj = result[i];

 				 $('#id_medico').append(

 				 	"<li class=\"list-group-item list-group-item-action\" href=\"#\"> &nbsp; <input type=\"radio\" "+
         			"class=\"custom-control-input\" id=\"medico"+ obj.id_medico +"\" name=\"medico\" value=\""+ obj.id_medico +"\">" +
         			"<label class=\"custom-control-label\" for=\"medico"+ obj.id_medico +"\"></label>" +
          			"<span id=\"nominativo_medico"+ obj.id_medico + "\" class=\"badge badge-info\">"+ obj.nome + " " + obj.cognome +"</span> &nbsp;</li>" 
 				 	);
 				};
 			


 			

			document.getElementById('sceltaData').innerHTML="<h5>Seleziona prima un medico.</h5>";	
			document.getElementById('sceltaOra').innerHTML="<h5>Seleziona prima un medico.</h5>";	
        
       	          
          
          },
          
       error: function (err){
      	
      	console.log(err);
      	}
      	
      
      });
  
	};  //fine del gigaelse
};
	  
function modal_prenota(id_prenotazione, provincia) {

	var id_prenotazione = id_prenotazione;

	document.getElementById("bottone_prenota"+id_prenotazione).outerHTML="<div id=\"spinner_compila_esame\" class=\"spinner-grow text-info\"></div>";

	  $.ajax({
		 
		  url: 'modalPrenotaVisita?id_prenotazione=' +id_prenotazione + '&provincia='+ provincia,
	      type: "GET",
	      success: function (result) { 
	      	console.log(result);
	          document.getElementById('sceltaStruttura').innerHTML="<input class=\"form-control\""+
	          "id=\"cercaStruttura\" type=\"text\" placeholder=\"Cerca una struttura...\"> &nbsp;" +

	          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
	          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaStrutture\">"+
	          
	          "<div required id=\"nome_struttura\" class=\"custom-radio\">" + "</div></ul>"+


	          "<br><button onclick=\"seleziona_struttura('"+ id_prenotazione+"','"+ provincia + "');\" class=\"btn btn-success\"><i class=\"fa fa-building\">"+
	          "</i> Scegli struttura</button>";
	          
	          
		      	$("#cercaStruttura").on("keyup", function () {
		      		var value = $(this).val().toLowerCase();
		      		$("#listaStrutture li").filter(function () {
		      			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		      		});
		      	});
		      	
	          if(result.length==0){
	        	  document.getElementById('sceltaStruttura').innerHTML="<h5 class=\"text-danger\">Nessuna struttura abilitata trovata!</h5>"
	        	  
	          }
	          
	         for (var i=0; i<result.length;i++){
	         	var obj = result[i];

	 				 $('#nome_struttura').append(

	 				 	"<li class=\"list-group-item list-group-item-action\" href=\"#\"> &nbsp; <input type=\"radio\" "+
	         			"class=\"custom-control-input\" id=\""+ obj +"\" name=\"struttura\" value=\""+ obj + "\">" +
	         			"<label class=\"custom-control-label\" for=\""+ obj +"\"></label>" +
	          			"<span class=\"badge badge-info\">"+ obj +"</span> &nbsp;</li>" 
	 				 	);
	 				};
	 			


	 			document.getElementById('sceltaMedico').innerHTML="<h5>Seleziona prima una struttura.</h5>";	
				document.getElementById('sceltaData').innerHTML="<h5>Seleziona prima una struttura.</h5>";	
				document.getElementById('sceltaOra').innerHTML="<h5>Seleziona prima una struttura.</h5>";	



	          
	          $('#modalPrenota').modal('show');
	          
	       	document.getElementById("spinner_compila_esame").outerHTML="<button href=\"#\" id=\"bottone_prenota"+id_prenotazione +"\" onclick=\"modal_prenota('"+ id_prenotazione + "','" + provincia 
	       	+"')\" class=\"btn btn-outline-success\"><i class=\"fa fa-calendar-edit\"></i> Prenota</button>";

	          
	          
	          },
	          
	       error: function (err){
	      	
	      	console.log(err);
	      	}
	      	
	      
	      });
	  

	};
	  
	///////////////////////////////////////////////////////////////////////////////////
	
	
	function modalDettagliPrenotazioneBase(id){
		
		document.getElementById("bottone_dettagli"+id).outerHTML="<div id=\"bottone_dettagli"+id+"\" class=\"spinner-grow text-info\"></div>";

		 
		   $.ajax({
		        url: 'http://localhost:8080/web2019/medico/modal/dettagli_visita?id_prenotazione='+id,
		        type: "GET",
		        success: function (result) { 
		        	console.log(result);
		            document.getElementById('prenotazione_data_base').innerHTML=result.visita.data_ora;
		            document.getElementById('prenotazione_numero_footer_base').innerHTML="Codice prenotazione: " + id;
		            document.getElementById('bottone_annullamento_prenotazione_base').outerHTML= "<a id=\"bottone_annullamento_prenotazione_base\" href=\"#\" class=\"btn btn-danger\" onclick=\"modalCancellazionePrenotazione(" + id + ")\"><i class=\"fa fa-trash\"></i> Annulla prenotazione</a>";
		            document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalDettagliPrenotazioneBase("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

		            $('#modalPrenotazioneBase').modal('show');
		            },
		            
		         error: function (result){
		        	
		        	console.log(result);
		        	
		        	
		        	}   
		        });
		    

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
			            document.getElementById('prenotazione_luogo_spec').innerHTML=result.visita.luogo;
							
			        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalDettagliPrenotazioneSpecialistica("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";

			            
			            $('#modalPrenotazioneSpecialistica').modal('show');
			            },
			            
			         error: function (err){
			        	
			        	console.log(err);
			        	
			        	
			        	}
			        });
			   

			    
			  
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
				        	document.getElementById("bottone_dettagli"+id).outerHTML="<button href=\"#\" id=\"bottone_dettagli"+id +"\" onclick=\"modalDettagliPrescrizioneSpecialistica("+ id +")\" class=\"btn btn-outline-info\"><i class=\"fa fa-info-circle\"></i> Dettagli</button>";
			
				            $('#modalPrescrizioneSpecialistica').modal('show');
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
		
	
			
			function modalCancellazionePrenotazione(id){
			
				
				
				$('#modalCancellazionePrenotazione').modal('show');
				
				document.getElementById('id_to_delete').innerHTML=id;
				document.getElementById('input_to_delete').value = id;
				
			}
			
			
	
	
	
	
	
	</script>
	
	<div class="modal fade modalPrenotazione" id="modalPrenota">
<div class="modal-dialog">
  <div class="modal-content"> 
    
    <!-- Modal Header -->
    <div class="modal-header text-light">
      <h4 class="modal-title">Prenota visita</h4>
      <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
    </div>
    
    <!-- Modal body -->
    <div class="modal-body text-center" id="modalBodyPrenotazione">
      <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
        <h5>
          <p class="badge badge-info">Seleziona struttura</p>
        </h5>
        <div id="sceltaStruttura">
        </div>
        <hr class="bg-light">
        <h5>
          <p class="badge badge-info">Seleziona medico</p>
        </h5>
        <div id="sceltaMedico">
        </div>
        <hr class="bg-light">
        <h5>
          <p class="badge badge-info">Seleziona data</p>
        </h5>
        <div id="sceltaData">
        </div>
        <hr class="bg-light">
        <h5>
          <p class="badge badge-info">Seleziona ora</p>
        </h5>
        <div id="sceltaOra">
        </div>
      </div>
      </div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<footer class="text-center text-light">©2019 Oradini &
		Bertamini</footer>
		
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
          
          <a id="bottone_annullamento_prenotazione_base" href="#" class="btn btn-danger" onclick=""><i class="fa fa-trash"></i> Annulla prenotazione</a>
     
        </div>
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
            <p class="badge badge-info">Medico</p>
          </h5>
          <h5 id="prenotazione_medico_spec"></h5>
          <hr class="bg-light">
           <h5>
            <p class="badge badge-info">Luogo</p>
          </h5>
          <h5 id="prenotazione_luogo_spec"></h5>
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
            <table id="tabella_ricette_base_completata" class="table datatable tabellaVisita table-hover table-striped table-bordered tabellaRicetteEsami" style="width:100%">
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
            <table id="tabella_esami_base_completata" class="table datatable tabellaVisita table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
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
            <table id="tabella_visite_base_completata" class="table datatable tabellaVisita table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
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
            <table id="tabella_ricette_specialistica_completata" class="table tabellaVisita  datatable table-hover table-striped table-bordered tabellaRicetteEsami" style="width:100%">
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
            <table id="tabella_esami_specialistica_completata" class="table datatable tabellaVisita table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
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
            <table id="tabella_visite_specialistica_completata" class="table datatable tabellaVisita table-hover table-bordered table-striped tabellaRicetteEsami" style="width:100%">
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
      <form action="./annullaPrenotazioneVisita">
      <input name="id_prenotazione" id="input_to_delete" type="hidden">
      <button type="submit" onclick="$('#modalCancellazionePrenotazione').modal('hide'); $('#modalPrenotazioneBase').modal('hide'); loadingModal()" class="btn btn-warning">Cancella prenotazione</button>
       </form>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="../js/paziente/visite_paziente.js"></script>

</body>
</html>
