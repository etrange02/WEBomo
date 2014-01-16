<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Remove Contact</title>
<script type="text/javascript">
	function reset() {
		document.getElementById("idContact").setAttribute("value", "");
	}
</script>
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
		if(cookie == null){
		
	%>
	<jsp:forward page="index.jsp"/>
	<% } %>
	<div class="truc small-10 columns small-centered">
		<nav class="top-bar contain-to-grid fixed" data-topbar>
			<ul class="title-area">
				<li class="name"><h1><a href="index.jsp">Mocomdo</a></h1></li>		
			</ul>
			<section class="top-bar-section">
				<!-- Right Nav Section -->
				<ul class="right">
					<li class="has-dropdown"><a href="#">Account</a>
						<ul class="dropdown">
							<li><a href="deconnection.jsp" >Deconnexion</a></li>
						</ul></li>
				</ul>
				<ul class="left">
				</ul>
			</section>
		</nav>
		<div class="myBody small-12 columns"></div>
			<div class="small-12 columns">
			<div class="small-12 small-centered columns">
				<ul class="button-group round even-6">
					<li><a href="#" class="button small" disabled>-</a></li>

					<li><a href="CreateContact.jsp" class="button small">Create
							Contact</a></li>
					<li><a href="SearchContact.jsp" class="button small">Search
							Contact</a></li>
					<li><a href="#" class="button small" disabled>-</a></li>
					<li><form action="PopulateServlet" method="post">
							<input type="submit" value="Peupler" class="button small" />
						</form></li>
					<li><a href="#" class="button small" disabled>-</a></li>
				</ul>
			</div>
			<div class="panel callout radius">
	<h2>Supprimer un contact</h2>
	<br />
	<form action="RemoveContactServlet" method="post">
	   <input type="hidden" name="id" value="${ contact.getId() }" />
        <table>
            <tr>
                <td><label>${ contact.getFirstname() }</label></td>
                <td><label><a href="mailto:${ contact.getEmail() }">${ contact.getEmail() }</a></label></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="Valider la suppression" class="button small alert"/></td>
            </tr>
        </table>
	</form>
	</div>
		</div>
	</div>

	<script src="js/vendor/jquery.js"></script>
	<script src="js/foundation/foundation.js"></script>
	<script src="js/foundation/foundation.topbar.js"></script>
	<script src="js/foundation/foundation.reveal.js"></script>
	<script src="js/foundation/foundation.accordion.js"></script>
	<script src="js/foundation/foundation.abide.js"></script>

	<script> $(document).foundation(); </script>
</body>
</html>