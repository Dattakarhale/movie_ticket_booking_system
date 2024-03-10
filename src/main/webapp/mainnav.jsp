<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
    <%@page import="java.io.*" %>
    <%@page import="java.io.IOException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<link href="css/bootstrap.min.css" rel="Stylesheet">


</head>
<body>

<%
boolean logged_in = false;
%>
<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary" data-bs-theme="LavenderBlush">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1 ">PVR</span>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link" href="home.jsp">Home</a>
        <%
		try{			
			logged_in = (boolean)session.getAttribute("logged_in");	
		}catch(Exception e){}
			
		if(logged_in == true){
			%>			
			<a class="nav-link" href="viewTicket.jsp">View Ticket</a>
			<a class="nav-link" href="logout.jsp">Logout</a>				
			<%
		}else{
		%>			
			<a class="nav-link" href="login.jsp">Login</a>
		<%
		} %>
      </div>
    </div>
     <span class="navbar-brand mb-0 h1">
     <%
     	if(logged_in == true){
     		%>
     		Welcome, <%=session.getAttribute("username") %>
     		<%
     	}else{
     	%>
     		Please , login
     	<%	
     	}
     %>
        
      </span>
  </div>
</nav>
</body>
</html>
