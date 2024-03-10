<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="adminmainnav.jsp" %>
     <%@page import="org.hibernate.Query" %>
     <%@page import="bigprojectpackage.createconnection"%>
     <%@page import="bigprojectpackage.Movie" %>
     <%@page import="org.hibernate.Session" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss2.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body{
	height: 100vh;
	background-image: url("admin5.jpg");
	background-color: #d0cfe5;
	overflow: scroll;
}
.book-ticket-container{
	display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.book-form-container{
    background-color: white;
    width: 50%;
    margin-top: 5px;
    padding: 10px;
}
.form-members{
display: flex;
margin-bottom: 10px;
}
.form-label-custom{
    display: flex;
    width: 30%;
    align-items: center;
}
.form-data{
    display: flex;
    width: 70%;
    flex-wrap: wrap;
    justify-content: space-evenly;
}
.show{
    display: grid;
    grid-template-columns: 1fr 2fr 2fr;
    justify-items: center;
    align-items: center;
    margin: 10px 0px;
}
.showtime{
	display: flex;    
    width: 100%;
    justify-content: center;
    }
.showgrid{
    margin: 20px 0px;
    }
input[type="time"]{
	width: 80%;
	outline: none;
	border: 1px solid blue;
}
input[type="text"]{
	border: none; 
	outline: none; 
	width: 100%; 
	padding: 2px; 
	font-size: 17px;
}
textarea {
	resize:none;
	width: 100%;
	outline: none;
	border: 1px solid blue;
	border-radius: 8px; 
}
select {
	border: 1px solid blue;
	width: 80%; 
	outline:none;
}
</style>
</head>
<body>
<%
int update = Integer.parseInt(request.getParameter("update"));
Session s = createconnection.getConnection();
Query q = s.createQuery("from Movie where movie_id=:id");
q.setParameter("id", update);
Movie m = (Movie)q.uniqueResult();
%>
<div class="book-ticket-container">
	<div class="book-form-container">
		<form action="servlet3" method="get">			
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Movie Title</strong>
				</div>
				<div class="form-data" style="border-bottom: 1px solid blue">
					<input type="text" name="movie_name" id="movie_name" value="<%=m.getMovie_title() %>" placeholder="Enter Movie Name">
				</div>
			</div>
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Movie Description</strong>
				</div>
				<div class="form-data" >
					<textarea rows="" cols="" name="movie_description" value="<%=m.getMovie_description() %>"><%=m.getMovie_description() %></textarea>
				</div>
			</div>
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Movie Duration</strong>
				</div>
				<div class="form-data">
					<input type="time"  name="movie_duration" step="2" value="<%=m.getMovie_duration() %>">
				</div>
			</div>
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Movie Rating</strong>
				</div>
				<div class="form-data">
					<select name="movie_rating">
						<option disabled>Select From 1 - 5 rating</option>
						<option value="1" <%if(m.getRating()==1){%>selected<%} %>>1</option>
						<option value="2" <%if(m.getRating()==2){%>selected<%} %>>2</option>
						<option value="3" <%if(m.getRating()==3){%>selected<%} %>>3</option>
						<option value="4" <%if(m.getRating()==4){%>selected<%} %>>4</option>
						<option value="5" <%if(m.getRating()==5){%>selected<%} %>>5</option>
					</select>
				</div>
			</div>
			<div class="form-members" style="margin-top: 20px">
				<div class="form-label-custom">
					<strong>Price</strong>
				</div>
				<div class="form-data" style="border-bottom: 1px solid blue">
					<input type="text" name="movie_price" value="<%=m.getPrice() %>" placeholder="Enter Price of Single Seat">
				</div>
			</div>
			<div class="showgrid">
				<div class="show">
					<div></div>
					<div><strong>Show Time</strong></div>
					<div><strong>Seats</strong></div>
				</div>
				<div class="show">
					<div class="form-label-custom" style="text-align: right; width: 100%">
						<strong>Show 1</strong>
					</div>
					<div class="showtime">
						<input type="time" name="show1time" value="<%=m.getShow1() %>">
					</div>
					<div class="form-data" style="border-bottom: 1px solid blue">
						<input type="text" name="show1seat" value="<%=m.getShow1seat()%>" placeholder="Show 1 Seat">
					</div>
				</div>
				<div class="show">
					<div class="form-label-custom" style="text-align: right; width: 100%">
						<strong>Show 2</strong>
					</div>
					<div class="showtime">
						<input type="time" name="show2time" value="<%=m.getShow2()%>">
					</div>
					<div class="form-data" style="border-bottom: 1px solid blue">
						<input type="text" name="show2seat" placeholder="Show 2 Seat" value="<%=m.getShow2seat()%>">
					</div>
				</div>
				<div class="show">
					<div class="form-label-custom" style="text-align: right; width: 100%">
						<strong>Show 3</strong>
					</div>
					<div class="showtime">
						<input type="time" name="show3time" value="<%=m.getShow3() %>">
					</div>
					<div class="form-data" style="border-bottom: 1px solid blue">
						<input type="text" name="show3seat" placeholder="Show 3 Seat" value="<%=m.getShow3seat() %>">
					</div>
				</div>
			</div>
			
			
			
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
	  		  <button class="btn btn-success" type="submit" name="update" value="<%=m.getMovie_id()%>" style="padding: 6px 38px;">Update Movie</button>					  
			  <a class="btn btn-danger" href="adminhome.jsp" role="button" style="padding: 6px 38px;">Cancel</a>
			</div>
		</form>
	</div>
</div>
</body>
</html>