<%@page import="bigprojectpackage.createconnection"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

	<%@page import="java.text.SimpleDateFormat"%>
    <%@page import="java.util.*"%>
    <%@page import="bigprojectpackage.Movie" %>
    <%@page import="bigprojectpackage.Ticket" %>
    <%@page import="org.hibernate.Session" %>
     <%@page import="org.hibernate.Query" %>
     <%@page import="org.hibernate.SessionFactory" %>
     <%@page import="org.hibernate.Transaction" %>
     <%@page import="org.hibernate.cfg.Configuration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="stylecss.css">
<body background ="PVER-Screen2.jpg"></body>
<title>Insert title here</title>
<style type="text/css">
body{
	height: 100vh;
	background-image: "PVR-Screen2.jpg";
	
	overflow: scroll;
}
.book-ticket-container{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.book-form-container{
    background-color: OldLace;
    width: 80%;
    margin-top: 50px;
    padding: 10px;
}
.form-members{
display: flex;
margin-bottom: 10px;
}
.form-label-custom{
    display: flex;
    width: 20%;
    align-items: center;
}
.form-data{
    display: flex;
    width: 80%;
    flex-wrap: wrap;
    justify-content: space-evenly;
   

}






</style>
<link href="css/bootstrap.min.css" rel="Stylesheet">
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</head>
<body style="background-color: #d0cfe5;">
<%

int movieid = Integer.parseInt(request.getParameter("movie"));
Session s = createconnection.getConnection();
Transaction tx = s.beginTransaction();
Query q = s.createQuery("from Movie where movie_id=:id");
q.setParameter("id", movieid);
Movie m = (Movie)q.uniqueResult();
 

Calendar calender = Calendar.getInstance();
Date today = calender.getTime();
calender.add(Calendar.DAY_OF_YEAR, 1);
Date tommorrow = calender.getTime();
SimpleDateFormat formatter = new SimpleDateFormat("dd MMMMM");
String strtoday = formatter.format(today);
String strtommorrow = formatter.format(tommorrow);
formatter = new SimpleDateFormat("dd-M-yyyy");
String datatoday = formatter.format(today);
String datatommorrow = formatter.format(tommorrow);

boolean logged_in = false;
%>
    
<nav class="navbar sticky-top navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <span class="navbar-brand mb-0 h1">PVR</span>
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
			response.sendRedirect("login.jsp");
		%>			
			<a class="nav-link" href="login.jsp">Login</a>
		<%
		} %>
      </div>
    </div>
     <span class="navbar-brand mb-0 h1">
        Welcome User
      </span>
  </div>
</nav>
<div class="book-ticket-container">


	<div class="book-form-container">
		<form action="servlet2" method="get">
		<img src="download.jpg" alt="<%=m.getMovie_title()%> Image" style="max-height: 150px; max-width: 100%;" />
			<div style="display: flex; flex-wrap: wrap;">			
				<div style="width: 50%">
					<div>
						<strong>Movie Title</strong>
					</div>
					<div>
						<p><%=m.getMovie_title() %></p>
						
					</div>
				</div>
				<div style="width: 50%">
					<div>
						<strong>Price</strong>
					</div>
					<div>
						<p>Rs. <span id="price"><%=m.getPrice() %></span></p>
					</div>
				</div>
				<div style="width: 50%">
					<div>
						<strong>Movie Duration</strong>
					</div>
					<div>
						<p><%=m.getMovie_duration() %></p>
					</div>
				</div>
				<div style="width: 50%">
					<div>
						<strong>Email Address</strong>
					</div>
					<div>
						<p><%=session.getAttribute("useremail") %></p>
					</div>
				</div>
			</div>
			<div class="form-members">
				<div class="form-label-custom">
					<strong>Select Day </strong>
				</div>
			<div class="form-data">
    <input type="radio" class="btn-check" name="date" id="today" value="<%=datatoday %>" autocomplete="off">
    <label class="btn btn-outline-primary custom-button" for="today">
        Today<br><%=strtoday %>
    </label>

    <input type="radio" class="btn-check" name="date" id="tomorrow" value="<%=datatommorrow %>" autocomplete="off">
    <label class="btn btn-outline-primary custom-button" for="tomorrow">
        Tomorrow<br><%=strtommorrow %>
    </label>
</div>


			</div>
			<div class="form-members">
				<div class="form-label-custom">
					<strong>Select Show Time</strong>
				</div>
				<div class="form-data">
					<input type="radio" class="btn-check" name="time" id="<%=m.getShow1()%>" value="<%=m.getShow1()%>" autocomplete="off">
					<label class="btn btn-outline-success" for="<%=m.getShow1()%>"><span id="show1"><b><%=m.getShow1()%></b></span></label>
					
					<input type="radio" class="btn-check" name="time" id="<%=m.getShow2()%>" value="<%=m.getShow2()%>" autocomplete="off">
					<label class="btn btn-outline-success" for="<%=m.getShow2()%>"><span id="show2"><b><%=m.getShow2()%></b></span></label>
					
					<input type="radio" class="btn-check" name="time" id="<%=m.getShow3()%>" value="<%=m.getShow3()%>" autocomplete="off">
					<label class="btn btn-outline-success" for="<%=m.getShow3()%>"><span id="show3"><b><%=m.getShow3()%></b></span></label>
					
					
				</div>
			</div>   
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Select Seats</strong>
				</div>
				<div class="form-data" style="border-bottom: 1px solid blue">
					<input type="number" oninput="totalamount()" name="seats" id="seats" placeholder="Enter number of seats" style="border: none; outline: none; width: 100%; padding: 2px; font-size: 17px">
				</div>
			</div>
			
			<div class="form-members" style="justify-content: flex-end;">				
				<div style="margin-right: 40px;">
					<div>
						<strong>Total Amount</strong>
					</div>
					<div>
						<p>Rs. <span id="total"></span></p>
					</div>
				</div>				
			</div>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<input type="hidden" name="movie_id" value="<%=m.getMovie_id()%>">
				<input type="hidden" name="movie_title" value="<%=m.getMovie_title()%>">
				<input type="hidden" name="amount" id="amount" value="0">
				<input type="hidden" name="useremail" id="useremail" value="<%=session.getAttribute("useremail")%>">
	  		  <button class="btn btn-success" type="submit" style="padding: 6px 38px;">Book</button>					  
			  <a class="btn btn-danger" href="home.jsp" role="button" style="padding: 6px 38px;">Cancel</a>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript" defer>
function totalamount() {
let seats = document.getElementById("seats").value;
let price = document.getElementById("price").innerHTML;
let total = price * seats;
document.getElementById("total").innerHTML = total;
document.getElementById("amount").value = total;
/* document.getElementById("seats").value = total;	 */
}

</script>
</body>
</html>