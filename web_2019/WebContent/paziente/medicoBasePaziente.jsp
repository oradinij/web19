<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Medico di base</title>
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
				<li class="nav-item "><a onclick="loadingModal()" class="nav-link" href="./homePaziente.jsp">Home <span
						class="sr-only">
							 
						</span></a></li>
				<li class="nav-item "><a class="nav-link" onclick="loadingModal()" href="./dettagliPaziente.jsp"
					id="navbarDropdown" role="button" 
					aria-haspopup="true" aria-expanded="false"> Dati Personali </a></li>
				<li class="nav-item active"><a onclick="loadingModal()" class="nav-link" href="./medicoBasePaziente.jsp" role="button"
					 aria-haspopup="true" aria-expanded="false">
						Medico </a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link " href="./ricettePaziente.jsp"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette <span class="badge badge-pill badge-warning">${user.getRicetteNonErogate().size()}</span>
				</a></li>
				<li class="nav-item"><a  onclick="loadingModal()" class="nav-link" href="./visitePaziente.jsp" role="button"
					 aria-haspopup="true" aria-expanded="false">
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
<h2 class="text-center" >Il tuo medico di base</h2>
<div class="text-center"> &nbsp;
  <div class="col-md-8 container">
    <div class="text-center" style="background-color:#C1D4D9; border-radius: 20px; padding: 20px; margin-bottom: 40px;">
      <h4 class="card-title">${user.medico.nome} ${user.medico.cognome}</h4>
      <img class="card-img-top rounded-circle" src="${user.medico.immagine}" alt="doctor_image" style="height:200px; width:200px; margin-bottom: 20px;">
      <p class="card-text"><span class="badge text-white" style="background-color: #326173">Telefono studio</span> ${user.medico.telefono_studio}</p>
      <p class="card-text"><span class="badge text-light" style="background-color: #326173">Cellulare</span> ${user.medico.telefono_cellulare}</p>
      <p class="card-text"><span class="badge text-white" style="background-color: #326173">Email</span> ${user.medico.email}</p>
      <p class="card-text"><span class="badge text-white" style="background-color: #326173">Orari visite</span> LUN-VEN 08:00-18:30</p>
		<p class="card-text"><span class="badge text-white" style="background-color: #326173">Indirizzo</span> ${user.medico.struttura}</p>
      <hr>
      <div class="text-center"><a id="bottoneModalPrenotaVisitaBase"  onclick="seleziona_data(${user.medico.id_medico},${user.id})" class="btn text-light btn-success"><i class="fa fa-calendar-edit"></i> Prenota visita dal tuo medico di base</a></div>
      &nbsp;
      <div class="text-center"><a id="bottoneModalSceltaMedico" onclick="modal_scelta_medico('${user.provincia}',${user.id},${user.medico.id_medico})" class="btn btn-warning"><i class="fa fa-user-edit"></i> Cambia medico di base</a></div>
    &nbsp;
	<div class="text-center" style="margin-bottom: 40px;">
	<a class="btn btn-info" href="homePaziente.jsp"><i class="fa fa-home"></i> Torna alla home</a>
	</div>
    </div>
  </div>
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



<!-- Modals -->

<script>

function loadingModal() {
	  
	$('#loading_modal').modal({
	    backdrop: 'static',
	    keyboard: false
	})


	  
	  }
	  

function getData(){
	
	 var data=  $("input[name=data]").val();

	 return data;
}


function concludi_prenotazione_base(data, id_medico, id_paziente){
	
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
				   
				    url: 'prenotaVisitaBase?time=' + time + '&id_medico=' + id_medico + '&id_paziente=' + id_paziente,
				      type: "GET",
				      success: function (result) { 
				        
				    	  console.log("OK!");
						  document.getElementById("modalBodyPrenotazione").innerHTML="<h5><span class=\"badge badge-pill badge-success\">Prenotazione effettuata correttamente!</span></h5>";
						  document.getElementById('bottoneChiudiPrenota').outerHTML="";
						  setTimeout(function(){$('#modalPrenota').modal('hide');loadingModal(); location.reload(); 
						  }, 3000);
      						
				          
				          },
				          
				       error: function (err){
				        
				        console.log(err);
				        }
				        
				      
				      });
	
			
		};
	
};



function seleziona_ora(data, id_medico, id_paziente) {

	console.log(data);

	if (data==null || data==""){
	window.alert("Seleziona una data!");
	} else {


	document.getElementById('sceltaData').innerHTML="<h5>"+ data + "</h5> <button onclick=\"seleziona_data('" + id_medico+"','"+ id_paziente +"');\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
	          "</i> Cambia data</button>";
	  

	document.getElementById("sceltaOra").innerHTML="<div class=\"spinner-grow text-info\"></div>";


	  $.ajax({
	   
	    url: 'SlotDisponibiliVisite?data=' + data + '&id_medico=' + id_medico,
	      type: "GET",
	      success: function (result) { 
	        console.log(result);

	          document.getElementById('sceltaOra').innerHTML=

	          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
	          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaOrari\">"+
	          
	          "<div required id=\"fascia_oraria\" class=\"custom-radio\">" + "</div></ul>"+


	          "<br><button id=\"bottoneConcludi\" onclick=\"concludi_prenotazione_base('"+ data +"','"+ id_medico + "','"+ id_paziente + "')\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
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





function seleziona_data(id_medico, id_paziente) {

	  
	          document.getElementById('sceltaData').innerHTML="<div class=\"form-group text-center container\" style=\"border-radius: 20px; ; max-width: 60%\">"+
	            "<form id=\"formConcludiVisita\" class=\"text-center\" style=\"display: inline-block\">" +
	            "<div class=\"input-group date\" id=\"datePickerVisita\" data-target-input=\"nearest\" style=\"max-width: 200px;\">"+
	            "<input required name=\"data\" type=\"text\" class=\"form-control datetimepicker-input text-center\" readonly data-target=\"#datetimepickerVisita\" id=\"dataVisita\">" +
	            "<div class=\"input-group-append\" data-target=\"#datetimepickerVisita\" data-toggle=\"datetimepicker\">" +
	            "<div class=\"input-group-text\"><i class=\"fa fa-calendar\"></i></div>" +
	            "</div></div></form></div>"+
	            "<button onclick=\"seleziona_ora(getData(),'" + id_medico +  "','" + id_paziente + "')\" class=\"btn btn-success\"><i class=\"fa fa-calendar-alt\"></i> Scegli data</button>";
	          
	          
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
		
				
				$('#modalPrenota').modal('show');
				
	};

	////////////////////////////////////////////////////////////
	

function seleziona_medico_base(id_paziente){
	
	var id_medico=null;
	
	 var radios = document.getElementsByName('medico'); 
     
	   for(i = 0; i < radios.length; i++) { 
       if(radios[i].checked) 
      	 id_medico=radios[i].value; 
       	
   }; 
	

	
	if (id_medico==null){
		window.alert("Seleziona un nuovo medico di base!");
		} else if (id_medico!=null) {

	
			document.getElementById("bottoneConcludiSceltMedicoBase").outerHTML="<div class=\"spinner-grow text-info\"></div>";


			$.ajax({
				   
				    url: 'cambiaMedicoBase?id_medico=' + id_medico + '&id_paziente=' + id_paziente,
				    type: "GET",
				    success: function () { 
				       
						  document.getElementById("modalBodyCambiomedico").innerHTML="<h5><span class=\"badge badge-pill badge-success\">Medico sostituito correttamente!</span></h5>";
						  setTimeout(function(){
							  $('#modalCambioMedico').modal('hide'); loadingModal(); location.reload();
						  }, 3000);
      						
				          
				          },
				          
				       error: function (err){
				        
				        console.log(err);
				        }
				        
				      
				      });

		};
	
};


function modal_scelta_medico(provincia, id_paziente, id_medico) {
	
	


	document.getElementById("bottoneModalSceltaMedico").outerHTML="<div id=\"bottoneModalSceltaMedico\" class=\"spinner-grow text-info\"></div>";

	  $.ajax({
		 
		  url: 'scegliMedicoBase?provincia=' + provincia + '&id_medico='  + id_medico,
	      type: "GET",
	      success: function (result) { 
	      	console.log(result);
	      	
	      

	          document.getElementById('sceltaMedico').innerHTML="<input class=\"form-control\" "+
	          "id=\"cercaMedico\" type=\"text\" placeholder=\"Cerca un medico...\"> &nbsp;" +

	          "<ul class=\"list-group striped overflow-auto text-left\" style=\"height: 200px;" +
	          " width:100%;border-width: 2px; border-style: solid; border-radius: 10px;\" id=\"listaMedici\">"+
	          
	          "<div required id=\"id_medico\" class=\"custom-radio\">" + "</div></ul>"+


	          "<br><button id=\"bottoneConcludiSceltMedicoBase\" onclick=\"seleziona_medico_base("+id_paziente +")\" class=\"btn btn-success\"><i class=\"fa fa-user-md\">"+
	          "</i> Scegli medico</button>";
	          
	      	
	      	$("#cercaMedico").on("keyup", function () {
	      		var value = $(this).val().toLowerCase();
	      		$("#listaMedici li").filter(function () {
	      			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	      		});
	      	});
	      	  
	          
	          if(result.length==0){
	        	  document.getElementById('sceltaMedico').innerHTML="<h5 class=\"text-danger\">Nessun altro medico di base trovato nella tua provincia!</h5>"
	        	  
	          }
	          
	          
	         for (var i=0; i<result.length;i++){
	         	var obj = result[i];

	 				 $('#id_medico').append(

	 				 	"<li class=\"list-group-item list-group-item-action\" href=\"#\"> &nbsp; <input type=\"radio\" "+
	         			"class=\"custom-control-input\" id=\"medico"+ obj.id_medico +"\" name=\"medico\" value=\""+ obj.id_medico +"\">" +
	         			"<label class=\"custom-control-label\" for=\"medico"+ obj.id_medico +"\"></label>" +
	          			"<span id=\"nominativo_medico"+ obj.id_medico + "\" class=\"badge badge-info\">"+ obj.nome + " " + obj.cognome +"</span> &nbsp;</li>" 
	 				 	);
	 				};
	 			

					$('#modalCambioMedico').modal('show');
	 			
	 				document.getElementById("bottoneModalSceltaMedico").outerHTML="<a id=\"bottoneModalSceltaMedico\" onclick=\"modal_scelta_medico('"+provincia +"',"+ id_paziente +","+ id_medico+")\" class=\"btn btn-warning\"><i class=\"fa fa-user-edit\"></i> Cambia medico di base</a>";

	        
	       	          
	          
	          },
	          
	       error: function (err){
	      	
	      	console.log(err);
	      	}
	      	
	      
	      });

	};
		  		
	
	
	</script>
<div class="modal fade" id="modalCambioMedico">
  <div class="modal-dialog modal-lg">
    <div class="modal-content"> 
      
      <!-- Modal Header -->
      <div class="modal-header text-light" style="background-color: #205373">
        <h4 class="modal-title">Cambia il tuo medico di base</h4>
        <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
      </div>
      
      <!-- Modal body -->
      <form>
        <div id="modalBodyCambiomedico" class="modal-body bg-white text-center" >
            <div id="sceltaMedico">
          </div>
          <br>
        </div>
      </form>
		
				
		
      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Annulla</button>
      </div>
    </div>
  </div>
</div>


	<div class="modal fade modalPrenotazione" id="modalPrenota">
<div class="modal-dialog">
  <div class="modal-content"> 
    
    <!-- Modal Header -->
    <div class="modal-header text-light">
      <h4 class="modal-title">Prenota visita da medico di base</h4>
      <button type="button" class="close text-light" data-dismiss="modal">&times;</button>
    </div>
    
    <!-- Modal body -->
    <div class="modal-body text-center" id="modalBodyPrenotazione">
      <div class="container  bg-light text-center" style="padding: 10px;border-radius: 20px">
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
					<button type="button" id="bottoneChiudiPrenota" class="btn btn-danger" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>
	



<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script src="../js/paziente/prenota_visita_timepicker.js"></script>
</body>
</html>
