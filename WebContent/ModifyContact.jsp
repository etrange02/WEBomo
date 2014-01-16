<%@ page import="entity.Contact"%>
<%@ page import="entity.Address"%>
<%@ page import="entity.ContactGroup"%>
<%@ page import="entity.PhoneNumber"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Modify Contact</title>
<script type="text/javascript">
	function reset() {
		document.getElementById("idContact").setAttribute("value", "");
		document.getElementById("firstname").setAttribute("value", "");
		document.getElementById("lastname").setAttribute("value", "");
		document.getElementById("email").setAttribute("value", "");
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
	<jsp:forward page="index.jsp" />
	<% } %>
	<div class="truc small-10 columns small-centered">
		<nav class="top-bar contain-to-grid fixed" data-topbar>
		<ul class="title-area">
			<li class="name"><h1>
					<a href="index.jsp">Mocomdo</a>
				</h1></li>
		</ul>
		<section class="top-bar-section"> <!-- Right Nav Section -->
		<ul class="right">
			<li class="has-dropdown"><a href="#">Account</a>
				<ul class="dropdown">
					<li><a href="deconnection.jsp">Deconnexion</a></li>
				</ul></li>
		</ul>
		<ul class="left">
		</ul>
		</section> </nav>
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
				<h2>Modifier un contact</h2>
				<br />
				<form data-abide action="ModifyContactServlet" method="post">
					<input type="hidden" name="id" value="${ contact.getId() }" />
						<div class="input-wrapper">
						<label for="idfirstname">Firstname</label> <input type="text"
							name="firstname" id="idfirstname" value="${ contact.getFirstname() }" required/>
							<small class="error">Firstname is required.</small>
					</div>
					<div class="input-wrapper">
						<label for="idlastname">Lastname</label> <input type="text"
							name="lastname" id="idlastname" value="${ contact.getLastname() }"  required/>
							<small class="error">Lastname is required.</small>
					</div>
                        <div class="input-wrapper">
                        <label for="idemail">Email</label> <input type="email" name="email"
                            id="idemail" value="${ contact.getEmail() }"/>
                            <small class="error">Email invalid.</small>
                    </div>
                        <div class="input-wrapper">
                        <label for="idstreet">Street</label> <input type="text" name="street"
                            id="idstreet" value="${ address.getStreet() }"/>
                    </div>
                        <div class="input-wrapper">
                        <label for="idcity">City</label> <input type="text" name="city"
                            id="idcity" value="${ address.getCity() }"/>
                    </div>
                        <div class="input-wrapper">
                        <label for="idzip">Zip</label> <input type="text" name="zip"
                            id="idzip" value="${ address.getZip() }"/>
                    </div>
                        <div class="input-wrapper">
                        <label for="idcountry">Country</label> <input type="text" name="country"
                            id="idcountry" value="${ address.getCountry() }"/>
                    </div>
                    <dl class="accordion" data-accordion>
                        <dd>
                            <a href="#panel1">Phone</a>
                            <div id="panel1" class="content">
                                <div class="input-wrapper">
                                    <label for="idhomephone">Home Phone Number</label> <input
                                        type="text" name="homephone" id="idhomephone" 
                                        value="<% if (request.getAttribute("homephone") != null)
                                               out.print((String) request.getAttribute("homephone") );
                                        %>" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="idofficephone">Office Phone Number</label> <input
                                        type="text" name="officephone" id="idofficephone" 
                                        value="<% if (request.getAttribute("officephone") != null) out.print( request.getAttribute("officephone") ); %>" />
                                </div>
                                <div class="input-wrapper">
                                    <label for="idcellphone">Cellphone Number</label> <input
                                        type="text" name="cellphone" id="idcellphone" 
                                        value="<% if (request.getAttribute("cellphone")!= null) out.print( request.getAttribute("cellphone") ); %>" />
                                </div>
                            </div>
                        </dd>
                    </dl>
                    <dl class="accordion" data-accordion>
                        <dd>
                            <a href="#panel2">Groups</a>
                            <div id="panel2" class="content">
                                <div class="input-wrapper">
                                    <label>Group</label>
                                        <input type="checkbox" name="ami" id="idAmi" 
                                        <% if (request.getAttribute("ami")!= null) out.print("checked=\"checked\""); %> />
                                        <label for="idAmi">Ami</label><br />
                                        <input type="checkbox" name="collegue" id="idCollegue" 
                                        <% if (request.getAttribute("collegue")!= null) out.print("checked=\"checked\""); %> />
                                        <label for="idCollegue">Collègue</label><br />
                                        <input type="checkbox" name="famille" id="idFamille" 
                                        <% if (request.getAttribute("famille")!= null) out.print("checked=\"checked\""); %> />
                                        <label for="idFamille">Famille</label><br />
                                </div>
                            </div>
                        </dd>
                    </dl>
					<input type="submit" value="Valider" class="button small success"/>
					<input type="button" value="Reset" onclick="reset();" class="button small alert"  />
						
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