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
				
				<li class="nav-item active"><a class="nav-link " onclick="loadingModal()" href="../operatore/ricetteOperatore.jsp"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette 
				</a></li>
				<li class="nav-item"><a onclick="loadingModal()" class="nav-link" href="../operatore/visiteOperatore" role="button"
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
<hr>
<div class="text-center container" style="background-color: #C1D4D9;  border-radius: 20px; padding: 20px; margin-bottom: 20px;">
  <div class="bg-light" style=" border-radius:20px; padding: 10px;">
    
    &nbsp;
    <div class="container">
      <table id="tabellaRicette" class="table datatable text-center table-striped table-hover table-light tabella_visite" style="width: 100%;">
        <thead>
          <tr>
            <th>Id</th>
            <th>Medico prescrittore</th>
            <th>Costo</th>
            <th>Data erogazione</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${user.listaRicetteErogate}" var="prescrizione">
           <tr>
            <td style="vertical-align: middle">${prescrizione.id_prescrizione}</td>
           	<td style="vertical-align: middle">${prescrizione.nome_medico}</td>
           	<td style="vertical-align: middle">3 €</td>
           	<td style="vertical-align: middle">${prescrizione.data}</td>
           	<td style="vertical-align: middle"><button  id="bottone_dettagli${prescrizione.id_prescrizione}" onclick="modal_ricetta_erogata(${prescrizione.id_prescrizione})" href="#" class="btn btn-outline-info"><i class="fa fa-info-circle"></i> Dettagli</button></td>
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
            <p class="badge badge-info">PDF ricetta</p>
          </h5>
          <a href="#" class="btn btn-success">Scarica PDF</a>
          <hr class="bg-light">
          <h5>
            <p class="badge badge-info">Codice QR</p>
          </h5>
          <button class="btn btn-success" data-toggle="collapse" data-target="#collpase_qr_erogata">Mostra QR</button>
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


		

		$(document).ready(function () {
			

		
		window.onresize = function (event) {
			$('.datatable').DataTable().columns.adjust();
		};

		$(document).on('shown.bs.modal','.modal', function () {

			$('.datatable').DataTable().columns.adjust();

		});
		
		});
		
		
</script>




<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
<script >

window.onresize = function (event) {
	$('.datatable').DataTable().columns.adjust().draw();
};


$(document).ready(function () {

	$('#tabellaRicette').DataTable({


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


</script>
</body>
</html>