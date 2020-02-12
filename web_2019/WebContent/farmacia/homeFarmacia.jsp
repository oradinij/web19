<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark"><a class="navbar-brand" href="#">Nome Cognome</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active"> <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item"> </li>
      <li class="nav-item"> </li>
      <li class="nav-item d-inline-block align-bottom"><img alt="iconaUtente" class="img iconaUtente rounded-circle " src="images/utente1img.jpg"></li>
      <li class="nav-item"> <a class="btn btn-danger" href="#">Logout</a> </li>
    </ul>
  </div>
</nav>
&nbsp;
<div class="container bg-faded" style="background-color: #C1D4D9; padding:20px; border-radius: 20px; max-width: 50%;">
	<div class="text-center container" style="padding:20px; border-radius: 20px; max-width: 90%; background-color: white;">
  <div class="container">
    <div class="media">
      <div class="media-body text-center" style="background-color:  "> <img class="rounded-circle " src="images/utente1img.jpg" width="150" height="150" alt="user">
        <h3 class="mt-0">${user.nome_farmacia}</h3>
      </div>
    </div>
	  </div>
  </div>
</div>
&nbsp;
<hr>
<div class="container text-center" style="background-color: #C1D4D9; padding:20px; border-radius: 20px; max-width: 90%;">
 <div class="text-center container" style="padding:20px; border-radius: 20px; max-width: 90%; background-color: white;">
	<h3>Cerca un codice fiscale per erogare una ricetta:</h3>
	<br>
	 <div class="input-group mb-3">
  <input type="text" id="input_codice_fiscale" class="form-control" placeholder="Cerca codice fiscale...">
  <div class="input-group-append">
    <button class="btn btn-success" id="bottone_cerca" onclick="cercaPaziente()">Cerca</button>
  </div>
</div>
	 <div id="risultato_ricerca"></div>
	</div>
</div>
<hr>

			

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

function cercaPaziente(){
	
	var codice_ficale= 	document.getElementById('input_codice_fiscale').value


	if(codice_ficale==""){
		
		
		window.alert("Inserisci un codice fiscale!");
		
		
	} else {
	
	document.getElementById("bottone_cerca").outerHTML="<div id=\"bottone_cerca\" class=\"spinner-grow text-info\"></div>";

	 
	   $.ajax({
	        url: 'cercaPaziente?codice_fiscale=' + codice_ficale,
	        type: "GET",
	        success: function (result) { 
	        	result = JSON.parse(result);
	        	
	        	
	        	
	        	if(result!=""){
	        	
	            document.getElementById('risultato_ricerca').innerHTML="<ul class=\"list-group striped pull-down overflow-auto\" id=\contact-list\" style=\"height: 780px;\">"+
				"<form name=\"formPaziente\" id=\"formPaziente\" action=\"ricettePaziente\" method=\"GET\">"+
				"<input type=\"hidden\" name=\"id_paziente\" value=\""+ result.id + "\">"+
	           " <li class=\"list-group-item list-group-item-action\" onclick=\"loadingModal(); formPaziente.submit();\">"+
	                "<div class=\"row w-100\">" +
	                "<div class=\"col-12 col-sm-6 col-md-3 px-0\"> <img style=\"width:80px; height:80px;\" src=\"" +result.foto_path+ "\" alt=\""+result.nome +" " +result.cognome + "\" class=\"rounded-circle mx-auto d-block img-fluid\"> </div>"+
	                "<div class=\"col-12 col-sm-6 col-md-9 text-center text-sm-left\"></span>"+
	                "<label class=\"name lead\">" + result.nome + " " + result.cognome + "</label>" +
	                "<br>"+ result.data_nascita +"<br>" + result.codice_fiscale +"<br>"+ 
	                "</div></li></form></ul>";
	          
	            
	        	} else {
	        		
	        		
	        		 document.getElementById('risultato_ricerca').innerHTML="<h4 class=\"text-danger\">Paziente non trovato!</h4>";
	        		
	        		
	        		
	        	}
	            
	            
	            
	        	document.getElementById("bottone_cerca").outerHTML="<button class=\"btn btn-success\" id=\"bottone_cerca\" onclick=\"cercaPaziente()\">Cerca</button>";

	            
	            
	            },
	            
	         error: function (result){
	        	
	        	console.log(result);
	        	
	        	
	        }
	        });
	    
		}
	  
	};






</script>

<footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
</body>
</html>
