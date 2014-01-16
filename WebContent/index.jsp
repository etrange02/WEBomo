<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Mocomdo</title>
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/foundation.css">
<link rel="stylesheet" href="css/design.css">
<script src="js/modernizr.js"></script>

</head>
<body>
<%
   Cookie cookie = null;
   Cookie[] cookies = null;
   cookies = request.getCookies();
   if( cookies != null ){
      for (int i = 0; i < cookies.length; i++){
    	  if(cookies[i].getName().equals("mocomdo_username")){
        	 cookie=cookies[i];
        	 break;
         }
      }
  }
   
%>
	<div class="truc small-10 columns small-centered">
		<nav class="top-bar contain-to-grid fixed" data-topbar>
			<ul class="title-area">
				<li class="name"><h1><a href="index.jsp">Mocomdo</a></h1></li>		
			</ul>
			<section class="top-bar-section">
				<!-- Right Nav Section -->
				<ul class="right">
					<%
						if (cookie == null) {
					%>
					<li class="active"><a href="connection.html"
						data-reveal-id="ConnectionModal" data-reveal-ajax="true">Connexion</a></li>
					<%
						} else {
					%>
					<li class="has-dropdown"><a href="#">Account</a>
						<ul class="dropdown">
							<li><a href="deconnection.jsp" >Deconnexion</a></li>
						</ul></li>
					<%
						}
					%>
				</ul>
			</section>
		</nav>
		<div class="myBody small-12 columns"></div>
		<div class="small-12 columns">
		<%
						if (cookie != null) {
					%>
			<div class="small-12 small-centered columns">
				<ul class="button-group round even-6">
					<li><a href="#" class="button small" disabled>-</a></li>

					<li><a href="CreateContact.jsp" class="button small">Create
							Contact</a></li>
					<li><a href="SearchContact.jsp" class="button small">Search
							Contact</a></li>
					<li><a href="#" class="button small" disabled>-</a></li>
					<li><form action="PopulateServlet" method="get">
							<input type="submit" value="Peupler" class="button small" />
						</form></li>
					<li><a href="#" class="button small" disabled>-</a></li>
				</ul>
			</div>
			<% } %>
			<div class="panel callout radius">
				<p>Ce site a été réalisé dans le cadre d'un projet pour l'UE Mdoc.<br/><br/><br/>
				Auteurs :<br/>
						  David Lecoconnier <br/>
						  Allan Mottier</p>
			</div>
		</div>
	</div>

	<div id="ConnectionModal" class="reveal-modal small" data-reveal tiny></div>

	<script src="js/vendor/jquery.js"></script>
	<script src="js/foundation/foundation.js"></script>
	<script src="js/foundation/foundation.topbar.js"></script>
	<script src="js/foundation/foundation.reveal.js"></script>

	<script> $(document).foundation(); </script>
</body>
</html>