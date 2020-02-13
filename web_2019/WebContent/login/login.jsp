<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login</title>
<link rel="stylesheet" href="../css/custom.css">
<link rel="stylesheet" href="../css/fontawesome-pro-5.12.0-web/css/all.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/dataTables.bootstrap4.min.css">
<script src="../js/popper.min.js"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="../js/bootstrap.js"></script>
<script src="../js/datatables.min.js"></script>
<style>
body {
    position: relative;
}
</style>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	<ul class="navbar-nav mr-auto">

    <li class="nav-item"> <a class="nav-link" href="#section1">Login pazienti</a> </li>
    <li class="nav-item"> <a class="nav-link" href="#section2">Login medico </a> </li>
    <li class="nav-item"> <a class="nav-link" href="#section3">Login farmacia</a> </li>
  	<li class="nav-item"> <a class="nav-link" href="#section4">Login operatore</a> </li>
	<li class="nav-item"> <a class="nav-link" href="./passwordDimenticata.jsp">Recupera password</a> </li>
	<li class="nav-item"> <a class="nav-link" href="../index.jsp">Home</a> </li>
	   <%@ include file="../notifica.jspf" %>
  </ul>
	</div>
  </nav>
	  
<div id="section1" class="container-fluid" style="padding-top:70px;padding-bottom:70px; background-color:#205373; color:white">
    <h2>Login pazienti</h2>
    <div class="container text-center bg-light text-dark" style="border-radius: 20px;padding:20px; max-width: 350px;">
    <form action="./loginPaziente" method="post">
        <table>
        <tr>
            <td style="padding-right: 5px;padding-bottom: "><strong>User-name: </strong></td>
            <td><input required type="text" name="email"></td>
          </tr>
        <tr style="margin-top: 5px;">
            <td><strong>Password:</strong></td>
            <td><input required type="password" name="password"></td>
          </tr>
      </table>
        <br>
        Ricordami:
        <input type="checkbox" name = "remember_me">
        <br>
        <br>
        <input class="btn btn-success" type="submit" value="Login">
      </form>
   
  </div>
  </div>
<div id="section2" class="container-fluid " style="padding-top:70px;padding-bottom:70px;background-color:#C1D4D9; color:black">
    <h2>Login medici</h2>
   <div class="container text-center bg-light text-dark" style="border-radius: 20px;padding:20px; max-width: 350px;">
    <form action="./loginMedico"  method="post">
        <table>
        <tr>
            <td style="padding-right: 5px;padding-bottom: "><strong>User-name: </strong></td>
            <td><input required type="text" name="email"></td>
          </tr>
        <tr style="margin-top: 5px;">
            <td><strong>Password:</strong></td>
            <td><input required type="password" name="password"></td>
          </tr>
      </table>
        <br>
        Ricordami:
        <input type="checkbox" name = "remember_me">
        <br>
        <br>
        <input class="btn btn-success" type="submit" value="Login">
      </form>
       
  </div>
  </div>
<div id="section3" class="container-fluid " style="padding-top:70px;padding-bottom:70px; background-color:#205373; color:white">
    <h2>Login farmacia</h2>
   <div class="container text-center bg-light text-dark" style="border-radius: 20px;padding:20px; max-width: 350px;">
    <form action="loginFarmacia"  method="post">
        <table>
        <tr>
            <td style="padding-right: 5px;padding-bottom: "><strong>User-name: </strong></td>
            <td><input required type="text" name="email"></td>
          </tr>
        <tr style="margin-top: 5px;">
            <td><strong>Password:</strong></td>
            <td><input required type="password" name="password"></td>
          </tr>
      </table>
        <br>
        Ricordami:
        <input type="checkbox" name = "remember_me">
        <br>
        <br>
        <input class="btn btn-success" type="submit" value="Login">
      </form>
        <%@ include file="../notifica.jspf" %>
  </div>
  </div>
<div id="section4" class="container-fluid" style="padding-top:70px;padding-bottom:70px;background-color:#C1D4D9; color:black">
    <h2>Login Operatore</h2>
    <div class="container text-center bg-light text-dark" style="border-radius: 20px;padding:20px; max-width: 350px;">
    <form action="./loginOperatore" method="post"  method="post">
        <table>
        <tr>
            <td style="padding-right: 5px;padding-bottom: "><strong>User-name: </strong></td>
            <td><input required type="text" name="email"></td>
          </tr>
        <tr style="margin-top: 5px;">
            <td><strong>Password:</strong></td>
            <td><input required type="password" name="password"></td>
          </tr>
      </table>
        <br>
        Ricordami:
        <input type="checkbox" name = "remember_me">
        <br>
        <br>
        <input class="btn btn-success" type="submit" value="Login">
      </form>
          
  </div>
  </div>
<br>
	  <footer class="text-center text-light">©2019 Oradini & Bertamini</footer>
</body>
</html>