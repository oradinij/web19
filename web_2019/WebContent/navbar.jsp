<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<%!
  public void navbar()
  {
   %>
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
				<li class="nav-item"><a class="nav-link" href="./dettagliPaziente.jsp">Home <span
						class="sr-only"><%! if(page == 0) %>
							 
						</span></a></li>
				<li class="nav-item active"><a class="nav-link" href="#"
					id="navbarDropdown" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> Dati Personali </a></li>
				<li class="nav-item"><a class="nav-link" href="#" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Medico </a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false">
						Ricette <span class="badge badge-pill badge-warning">4</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#" role="button"
					data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Visite <span class="badge badge-pill badge-warning">2</span>
				</a></li>
				<li class="nav-item"><a class="nav-link " href="#"
					role="button" aria-haspopup="true" aria-expanded="false"> Esami
						<span class="badge badge-pill badge-warning">5</span>
				</a></li>
				<li class="nav-item d-inline-block align-bottom"><img
					alt="iconaUtente" class="img iconaUtente rounded-circle "
					src="${user.foto_path}"></li>
				<li class="nav-item"><a class="btn btn-danger  " href="#">Logout</a>
				</li>
			</ul>
		</div>
	</nav>
	&nbsp;
   <%!
  }
%>