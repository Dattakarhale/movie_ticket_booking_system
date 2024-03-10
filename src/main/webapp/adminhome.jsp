<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="adminmainnav.jsp" %> 
    <%@page import="org.hibernate.Session" %>
    <%@page import="java.util.*"%>
    <%@page import="bigprojectpackage.Movie" %> 
     <%@page import="bigprojectpackage.createconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss2.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
	background-image: url("admin5.jpg");
	background-color: rgba(208, 207, 229, 0.6); /* Transparent background color */
	background-blur: blur(50px); /* Apply a background blur effect */
	height: 100vh;
	overflow: scroll;
	margin: 0; /* Remove default margin */
	padding: 0; /* Remove default padding */
	font-family: Arial, sans-serif; /* Define a common font family */
}

.home-container{
	display: flex;
	width: 100%;
	justify-content: space-evenly;
	flex-wrap: wrap;
	padding: 50px;
	
}

.home-card-container{
	background-color: AliceBlue;
	height: 38vh;
	width: 40%;
	border: 1px solid gainsboro;
	box-shadow: 1px 1px 9px 2px #a5a5cf;
	border-radius: 9px;
	margin-bottom: 30px;
}

.miovie-card{
	height: 100%;
	padding: 10px;
}

.miovie-card p{
	margin: 0px;
	border-bottom: 1px solid gainsboro;
}

.movie-description{
	height: 80%;
}

.book-section{
	display: table;
	height: 20%;
	justify-content: flex-end;
	flex-wrap: wrap;
	align-content: center;
	
}
/* Custom Aqua Button Style */
.btn-aqua {
    background-color: cyan;
    color: #DC143C;
}

/* Button Press Animation */
.press-animation 
{
    transition: transform 0.1s;
}

.press-animation:active {
    transform: scale(0.95);
}


</style>
</head>
<body>

<div class="home-container">
<%
Session s = createconnection.getConnection();
List l = s.createQuery("from Movie").list();
for(int i = l.size()-1; i >= 0 ; i--){				
	Movie m = (Movie) l.get(i);
%>
<div class="home-card-container">
	<div class="miovie-card">
		<div class="movie-description">
		<%-- <img src="download.jpg" alt="<%=m.getMovie_title()%> Image" style="max-height: 150px; max-width: 100%;" /> --%>
			<p><strong>Title :  </strong>&nbsp;&nbsp;<%=m.getMovie_title() %></p>
			<p><strong>Description :</strong>&nbsp;&nbsp;  <span style="font-size: 14px;"><%=m.getMovie_description() %></span></p>
			<p><strong>Duration :</strong>&nbsp;&nbsp;  <%=m.getMovie_duration() %></p>
			<p><strong>Rating :</strong>&nbsp;&nbsp;  <%=m.getRating() %>/5</p>
			<p><strong>Price :</strong>&nbsp;&nbsp; Rs. <%=m.getPrice() %></p>
		</div>
		<div class="book-section">
    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
        <form action="adminupdate.jsp">
            <button type="submit" class="btn btn-aqua me-md-2 press-animation" name="update" value="<%=m.getMovie_id()%>">Update</button>
        </form>
        <form action="admindelete.jsp">
            <button type="submit" class="btn btn-aqua press-animation" name="delete" value="<%=m.getMovie_id()%>">Delete</button>
        </form>
    </div>
</div>


	
	</div>		
</div>
<%				
}
%>
</div>
</body>
</html>
