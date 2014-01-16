<%@ page import="entity.ContactGroup"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Search Contact</title>
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
	<h2>Rechercher un contact</h2>
	<br />
	<form action="SearchContactServlet" method="post">
		<input type="text" name="criteria" id="criteria" />
		<input type="submit" value="Rechercher" class="button small"/>
	</form>
	<%--<c:if test="${ listeContact != null }">
	   <c:choose>
	       <c:when test="${ listeContact.size() > 0 }">
	           <table>
	               <tr>
	                   <th>Prénom Nom</th>
	                   <th colspan="2">Action</th>
	               </tr>
		           <c:foreach var="contact" items="${listeContact}" >
			       <tr>
				       <td><c:out value="${ contact.getFirstname() }" />
				       <c:out value=" " />
				       <c:out value="${ contact.getLastname() }" />
				       </td>
				       <td>
				       <form action="ModifyContactServlet" method="get">
				        <input type="hidden" name="id" value="${ contact.getId() }" />
				        <input type="submit" value="Modifier" />
				       </form>
				       </td>
				       <td>
				       <form action="RemoveContactServlet" method="get">
				        <input type="hidden" name="id" value="${ contact.getId() }" />
				        <input type="submit" value="Supprimer" />
				       </form>
				       </td>
			       </tr>
			    </c:foreach>
		    </table>
	       </c:when>
	       <c:otherwise>
	           <p>Aucun contact ne correspond à cette recherche.</p>
	       </c:otherwise>
	   </c:choose>
	</c:if> --%>
	
 	<%
 	   List<Contact> listeContact = (List<Contact>) request.getAttribute("listeContact");
	
 	   if (listeContact != null) {
 		   Iterator<Contact> iter = listeContact.iterator();
 		   Contact c = null;
 		   if (iter.hasNext()) {
 			   out.println("<table>");
 			   while (iter.hasNext()) {
 				   c = iter.next();
 				   out.print("<tr><td><label>");
 				   out.print(c.getFirstname());
 				   out.print(" ");
 				   out.print(c.getLastname());	   
                   out.print("</label></td>");   
                   out.print("<td>");
                   out.print("<form action=\"ModifyContactServlet\" method=\"get\"><input type=\"hidden\" value=\"");
                   out.print(c.getId());
                   out.print("\" name=\"id\" /><input type=\"submit\" value=\"Modifier\" class=\"button tiny\"/></form>");
                   out.print("</td>");
                   out.print("<td>");
                   out.print("<form action=\"RemoveContactServlet\" method=\"get\"><input type=\"hidden\" value=\"");
                   out.print(c.getId());
                   out.print("\" name=\"id\" /><input type=\"submit\" value=\"Supprimer\" class=\"button tiny alert\"/></form>");     
                   out.println("</td></tr>");
 			   }
 	           out.println("</table>");
 		   } else {
 			   out.println("<p>Aucun contact ne correspond à cette recherche.</p>");
 		   }
 	   }
 	%>
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