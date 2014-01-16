<%@page import="java.awt.Window"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();
if( cookies != null ){
   for (int i = 0; i < cookies.length; i++){
 	  out.println("parcours cookie n "+i+" !");
      if(cookies[i].getName().equals("mocomdo_username")){
     	 cookie=cookies[i];
     	 cookie.setMaxAge(0); response.addCookie(cookie);
     	 break;
      }
   }
 }
 %>
 <jsp:forward page="index.jsp"/>
</body>
</html>