<%@page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="org.hibernate.Session" %>
     <%@page import="org.hibernate.Query" %>
     <%@page import="bigprojectpackage.Admin" %>
     <%@page import="bigprojectpackage.createconnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<link rel="stylesheet" href="stylecss2.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
<style type="text/css">
    body {
        background-image: url("admin5.jpg");
        background-size: cover;
        background-color: #d0cfe5;
    }

    .login-container {
        display: flex;
        height: 100vh;
        justify-content: center;
        align-items: center;
        
    }

    .form-container {
        width: 100%;
        max-width: 400px;
        padding: 15px;
        background-color: rgba(255, 255, 255, 0.9);
         border: 2px solid #BB7777; 
        border-radius: 10px;
    }

    .form-container h1 {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 15px;
    }

    .form-container .error-message {
        color: red;
    }

    .form-container .form-input {
        border: 2px solid #007BFF;
        border-radius: 5px;
        padding: 10px;
        width: 100%;
        margin-bottom: 10px;
    }

    .form-container .form-button {
        background-color: #00BFFF;
        color: #fff;
        border: DOTTED;
        border-radius: 5px;
        padding: 10px 20px;
        cursor: pointer;
    }

    .form-container .form-button:hover {
        background-color: #9932CC;
    }
</style>
</head>
<body>
<%
boolean error = false;
try {
    String login = request.getParameter("submit");
    if (login.equals("login")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        Session s = createconnection.getConnection();
        
        try {
            Query q = s.createQuery("from Admin where ausername=:ausername and apassword=:apassword");
            q.setParameter("ausername", username);
            q.setParameter("apassword", password);
            Admin a = (Admin)q.uniqueResult();
            if (a.getAusername().equals(username) && (a.getApassword().equals(password)))
            		{
                session.setAttribute("admin_logged_in", true);
                response.sendRedirect("adminhome.jsp");
            }
        } catch (Exception e) {
            error = true;
        }
    }
} catch (Exception e) {
}
%>
<div class="login-container">
    <div class="form-container">
        <form action="" method="get">
            <h1>PVR Admin Login</h1>
            <div class="error-message">
                <% if (error == true) { %>
                    <p id="error">Invalid Credentials</p>
                <% } %>
            </div>
            <input type="text" name="username" id="username" class="form-input" placeholder="Username" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            <input type="password" name="password" id="password" class="form-input" placeholder="Password" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            <div class="d-grid gap-2 col-10 mx-auto">
                <button type="submit" name="submit" value="login" class="form-button" >Login</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
