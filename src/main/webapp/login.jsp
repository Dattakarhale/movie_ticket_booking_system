<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.Session" %>
     <%@page import="org.hibernate.Query" %>
     <%@page import="bigprojectpackage.User" %>
     <%@page import="bigprojectpackage.createconnection" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="stylecss.css">
<body background ="userlogin.jpg"></body>
<style type="text/css">
 .loginbody{
	background-color:"white";
}
.form-body{
	background-image: "userlogin.jpg";
	
}

</style>
<link href="css/bootstrap.min.css" rel="Stylesheet">
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%

	boolean error=false;
try{
String login = request.getParameter("submit");
if(login.equals("login")){
	String uemail = request.getParameter("email");
	String upass = request.getParameter("password");
	
	Session s = createconnection.getConnection();
	try{
		Query q = s.createQuery("from User where uemail=:email and upassword=:pass");
		q.setParameter("email", uemail);
		q.setParameter("pass", upass);
		User u = (User)q.uniqueResult();
		session.setAttribute("useremail", u.getUemail());
		session.setAttribute("username", u.getUname());
		session.setAttribute("logged_in", true);
		response.sendRedirect("home.jsp");
		
	}catch(Exception e){
		error = true;
	}
	
	
}
	
}catch(Exception e){}
%>
<div class="d-flex align-items-center justify-content-center mw-100 loginbody" style="height: 100vh">
  <div class="container text-center">
    <div class="row justify-content-center align-items-center">
      <div class="col align-self-center form-body col-sm-6 border border-3 border-dark rounded-3" style="padding: 20px; background-color: rgba(255, 255, 255, 0.7); backdrop-filter: blur(10px);">
        <form action="" method="get">
        		
		<p class="ff-bold" style="font-size: xxx-large;   color:lavender;  margin-bottom: 50px;">PVR login</p>
		<%if(error==true){
			%>
			<p id="error" style="color: red;">Invalid Credentials</p>
			<%
		} %>
		
		<div class="input-group input-group-sm mb-3">
  <input type="email" name="email" id="email" class="form-control custom-input" placeholder="Email Address" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
<div class="input-group input-group-sm mb-3">
  <input type="password" name="password" id="password" class="form-control custom-input" placeholder="Password" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
</div>
<div class="d-grid gap-2 col-10 mx-auto">
  <button type="submit" name="submit" value="login" class="btn btn-custom">Login</button>
  <a href="home.jsp" class="btn btn-secondary" role="button">Back</a>
</div>
		</form>
		<p style="margin-top: 10px ;margin-bottom: 0px">Don't have Account yet ? <a href="createAccount.jsp">Sign up</a></p>
		    
    </div>    
  </div>
</div>
</div>

</body>
</html>

