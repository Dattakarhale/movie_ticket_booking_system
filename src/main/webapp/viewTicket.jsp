<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="mainnav.jsp" %>
    <%@page import="org.hibernate.Session" %>
    <%@page import="java.util.*"%>
    <%@page import="bigprojectpackage.Ticket" %> 
     <%@page import="bigprojectpackage.createconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss.css">
<body background ="PVER-Screen2.jpg"></body>

<style type="text/css">
body{
	height: 100vh;
	background-image: "PVR-Screen2.jpg";
	background-color: #d0cfe5;
	overflow: scroll;
}
.ticket-container{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.table-container{
    height: 80vh;
    background-color: white;
    width: 90%;
    margin-top: 40px;
    overflow: scroll;
}
</style>
</head>
<body>

<div class="ticket-container">
	<div class="table-container">
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">Ticket ID</th>
		      <th scope="col">Movie</th>
		      <th scope="col">Date</th>
		      <th scope="col">Time</th>
		      <th scope="col">Seats</th>
		      <th scope="col">Amount</th>
		    </tr>
		  </thead>
<%
Session s = createconnection.getConnection();
String useremail = (String)session.getAttribute("useremail");
		  List l = s.createQuery("from Ticket where temail = '"+useremail+"'").list();
			for(int i = l.size()-1; i >= 0 ; i--){				
				Ticket t = (Ticket) l.get(i);
%>
				
		  <tbody class="table-group-divider">
		    <tr>
		      <th scope="row"><%=t.getTicket_id() %></th>
		      <td><%=t.getTmovie_title() %></td>
		      <td><%=t.getDate() %></td>
		      <td><%=t.getShowtime() %></td>
		      <td><%=t.getTseats() %></td>
		      <td>Rs. <%=t.getAmount() %></td>
		    </tr>		    
		  </tbody>			
				
<%
				
			}
%>
		</table>
	</div>
</div>
</body>
</html>