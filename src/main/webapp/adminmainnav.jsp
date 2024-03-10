<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss2.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="Stylesheet">
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<style type="text/css">
body {
    background-image: url("admin5.jpg");
    height: 100vh;
    background-color: #d0cfe5;
    overflow: scroll;
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

.navbar {
    background-color: rgba(0, 123, 255, 0.5); /* Transparent background color for the navbar */
}

.navbar a {
    color: white !important; /* Text color for menu items */
}

.navbar a:hover {
    background-color: #0056b3; /* Background color on hover */
}

.navbar-brand {
    color: white; /* Text color for brand/logo */
}

/* Modify the dropdown menu style */
.navbar .dropdown-menu {
    background-color: rgba(0, 123, 255, 0.5); /* Transparent background color for the dropdown menu */
    border: ridge; /* Remove border */
}

.navbar .dropdown-item {
    color: white !important; /* Text color for dropdown items */
}

.navbar .dropdown-item:hover {
    background-color: #0056b3; /* Background color on hover */
}

</style>
</head>
<body>
<%
boolean admin_looged_in = false;
try{			
    admin_looged_in = (boolean)session.getAttribute("admin_logged_in");	
}catch(Exception e){} 
if(admin_looged_in == false){
    response.sendRedirect("adminlogin.jsp");
}
%>

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
  <div class="container-fluid">
    <a class="navbar-brand" href="adminhome.jsp">PVR</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="adminhome.jsp">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            More
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="adminaddmovie.jsp">Add Movie</a>
            <a class="dropdown-item" href="adminviewticket.jsp">View Ticket</a>
            <a class="dropdown-item" href="adminlogout.jsp">Log Out</a>
            <!-- Add more dropdown items as needed -->
          </div>
        </li>
      </ul>
    </div>
    <span class="navbar-brand">
        Welcome Admin
    </span>
  </div>
</nav>
</body>
</html>
