<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Recupera password</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/datatables.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item"> <a class="nav-link" href="../index.jsp">Home <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link " href="./login.jsp" role="button" aria-haspopup="true" aria-expanded="false"> Login </a> </li>
    
    </ul>
  </div>
</nav>

<script type="text/javascript">
function alertEmail(){
	window.alert("Ti e' stata inviata una mail per il recupero della password!");
setTimeout(function(){$('#formRecupero').submit();},3000);
}
</script>
	 
	  <div class="text-center" style="background-color:#C1D4D9;padding-bottom: 20px; "><br><h1>Recupera password</h1>
	  <br>
	 <div class="container bg-light text-center" style="padding:20px;border-radius: 20px; max-width:300px;">
    <form action="../richiediCambioPassword" id="formRecupero" method="post">
	<h5>Scegli la tua tipologia di utente:</h5><br>
	<div class="text-left">
	<input type="radio" name="tipologia_utente" value="0" required="required"> Sono un paziente<br>
	<input type="radio" name="tipologia_utente" value="1" required="required"> Sono un medico<br>
	<input type="radio" name="tipologia_utente" value="2" required="required"> Sono una farmacia<br>
	<input type="radio" name="tipologia_utente" value="3" required="required"> Sono un operatore<br>
	</div>
	<br>
	<p><strong>Email:</strong> <input type="email" required="required" name = "email"></p>
	<br>
	<div>
		<button class="btn btn-success"  onclick="alertEmail()" ><i class="fa fa-recycle"></i> Recupera password</button>
		</div>
		<br>
		<div>
		<a class="btn btn-info" href="./login.jsp" ><i class="fa fa-sign-in"></i> Torna al login</a>
		</div>
</form>
	  </div> 
		  </div>
	<br>
	  <footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
</body>
</html>