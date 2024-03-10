<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="mainnav.jsp"%>  
  <%@page import="org.hibernate.Session" %>
    <%@page import="java.util.*"%>
    <%@page import="bigprojectpackage.Movie" %> 
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
    background-color: rgba(208, 207, 229, 0.6); /* Background color with transparency */
    overflow: scroll;
}
.home-container{
    /* background-color: #d0cfe5; */
    display: flex;
    width: 100%;    
    justify-content: space-evenly;
    flex-wrap: wrap;
    padding: 50px;
}

.home-card-container{
    background-color: OldLace;
    height: 60vh;
    width: 90%;
    border: dotted;
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
    display: flex;
    height: 20%;
    justify-content: flex-end;
    flex-wrap: wrap;
    align-content: center;
   /*  border: dotted;
 */}
.book-button{
    background-color: pink;
    border: 1px solid black;
    font-weight: bold;
    border-radius: 6px;    
    padding: 3px 20px;
}
.book-button:hover {
    color: gray;
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
            <img src="download.jpg" alt="<%=m.getMovie_title()%> Image" style="max-height: 150px; max-width: 100%;" />
            <%-- <img src="mission.jpg" alt="<%=m.getMovie_title()%> Image" style="max-height: 150px; max-width: 100%;" /> --%>
            <div class="movie-description">
                <p><strong>Title :  </strong>&nbsp;&nbsp;  <%=m.getMovie_title() %></p>
                <p><strong>Description :</strong>&nbsp;&nbsp;  <span style="font-size: 14px;"><%=m.getMovie_description() %></span></p>
                <p><strong>Duration :</strong>&nbsp;&nbsp;  <%=m.getMovie_duration() %></p>
                <p><strong>Rating :</strong>&nbsp;&nbsp;  <%=m.getRating() %>/5</p>
                <p><strong>Price :</strong>&nbsp;&nbsp; Rs. <%=m.getPrice() %></p>
            </div>
            <div class="book-section">
                <form action="bookticket.jsp" method="get">
                    <button type="submit" class="book-button" style="background-color: cyan;" name="movie" value="<%=m.getMovie_id()%>">Book Now</button>
                </form>        
            </div>          
        </div>      
    </div>
    
    
    
    

<%               
            }
%>

</div>

</body>
</html>
