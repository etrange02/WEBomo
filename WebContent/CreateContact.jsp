<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Create Contact</title>
<script type="text/javascript">
	function reset() {
		document.getElementById("firstname").setAttribute("value", "");
		document.getElementById("lastname").setAttribute("value", "");
		document.getElementById("email").setAttribute("value", "");
		document.getElementById("street").setAttribute("value", "");
		document.getElementById("city").setAttribute("value", "");
		document.getElementById("zip").setAttribute("value", "");
		document.getElementById("country").setAttribute("value", "");
		document.getElementById("homephone").setAttribute("value", "");
		document.getElementById("officephone").setAttribute("value", "");
		document.getElementById("cellphone").setAttribute("value", "");
	}
	function activeNumSiret() {
		document.getElementById("idNumSiret").disabled = !document.getElementById("idNumSiret").disabled;
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
				<h2>New Contact</h2>
				<br />
				<form data-abide action="CreateContactServlet" method="post">
					<div class="input-wrapper">
						<label for="idfirstname">Firstname</label> <input type="text"
							name="firstname" id="idfirstname" required/>
							<small class="error">Firstname is required.</small>
					</div>
					<div class="input-wrapper">
						<label for="idlastname">Lastname</label> <input type="text"
							name="lastname" id="idlastname" required/>
							<small class="error">Lastname is required.</small>
					</div>
					<div class="input-wrapper">
						<label for="idemail">Email</label> <input type="email" name="email"
							id="idemail" />
							<small class="error">Email invalid.</small>
					</div>
					<div class="input-wrapper">
						<label for="idstreet">Street</label> <input type="text"
							name="street" id="idstreet" />
					</div>
					<div class="input-wrapper">
						<label for="idcity">City</label> <input type="text" name="city"
							id="idcity" />
					</div>
					<div class="input-wrapper">
						<label for="idzip">Zip</label> <input type="text" name="zip"
							id="idzip" />
					</div>
					<div class="input-wrapper">
						<label for="idcountry">Country</label> <input type="text"
							name="country" id="idcountry" />
					</div>
					<dl class="accordion" data-accordion>
						<dd>
							<a href="#panel1">Phone</a>
							<div id="panel1" class="content">
								<div class="input-wrapper">
									<label for="idhomephone">Home Phone Number</label> <input
										type="text" name="homephone" id="idhomephone" />
								</div>
								<div class="input-wrapper">
									<label for="idofficephone">Office Phone Number</label> <input
										type="text" name="officephone" id="idofficephone" />
								</div>
								<div class="input-wrapper">
									<label for="idcellphone">Cellphone Number</label> <input
										type="text" name="cellphone" id="idcellphone" />
								</div>
							</div>
						</dd>
					</dl>
					<dl class="accordion" data-accordion>
						<dd>
							<a href="#panel2">Groups</a>
							<div id="panel2" class="content">
								<div class="input-wrapper">
									<label>Group</label> <input type="checkbox" name="ami"
										id="idAmi" /> <label for="idAmi">Ami</label><br /> <input
										type="checkbox" name="collegue" id="idCollegue" /> <label
										for="idCollegue">Collègue</label><br /> <input
										type="checkbox" name="famille" id="idFamille" /> <label
										for="idFamille">Famille</label><br />
								</div>
							</div>
						</dd>
					</dl>
					<div class="input-wrapper">
						<input type="checkbox" name="entreprise" id="idEntreprise"
							onclick="activeNumSiret()" /><label for="idEntreprise">Entreprise</label>
						<input type="text" name="numSiret" id="idNumSiret"
							disabled="disabled" title="Numéro de siret" />
					</div>
					<input type="submit" value="Valider" class="button small success" />
					<input type="button" value="Reset" onclick="reset();"
						class="button small alert" />
				</form>
			</div>
		</div>
	</div>

	<div id="ConnectionModal" class="reveal-modal small" data-reveal></div>

	<script src="js/vendor/jquery.js"></script>
	<script src="js/foundation/foundation.js"></script>
	<script src="js/foundation/foundation.topbar.js"></script>
	<script src="js/foundation/foundation.reveal.js"></script>
	<script src="js/foundation/foundation.accordion.js"></script>
	<script src="js/foundation/foundation.abide.js"></script>

	<script> $(document).foundation(); </script>
</body>
</html>