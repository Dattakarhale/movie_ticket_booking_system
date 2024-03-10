<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="bigprojectpackage.User" %>
<%@ page import="bigprojectpackage.createconnection" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <link rel="stylesheet" href="stylecss.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" src="js/bootstrap.bundle.min.js"></script>
    <style type="text/css">
        .loginbody {
            background-color: white;
        }

        .form-body {
            background-image: url("PVR-Screen.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .container-login {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
        }

        #error {
            color: red;
        }
    </style>
</head>
<body>

<%
    boolean error = false;
    try {
        String login = request.getParameter("submit");
        if (login != null && login.equals("login")) {
            String uemail = request.getParameter("email");
            String upass = request.getParameter("password");

            Session s = createconnection.getConnection();
            try {
                Query q = s.createQuery("from User where uemail=:email and upassword=:pass");
                q.setParameter("email", uemail);
                q.setParameter("pass", upass);
                User u = (User) q.uniqueResult();
                session.setAttribute("useremail", u.getUemail());
                session.setAttribute("username", u.getUname());
                session.setAttribute("logged_in", true);
                response.sendRedirect("home.jsp");
            } catch (Exception e) {
                error = true;
            }
        }

    } catch (Exception e) {
    }
%>

<div class="d-flex align-items-center justify-content-center mw-100 loginbody" style="height: 100vh">
    <div class="container text-center">
        <div class="row justify-content-center align-items-center">
            <div class="col align-self-center form-body col-sm-3 border border-3 border-dark-subtle rounded-3" style="padding: 12px">
                <div class="container-login">
                    <form action="" method="get">
                        <p class="ff-bold" style="font-size: xx-large; color: red; margin-bottom: 20px;">PVR login</p>
                        <% if (error == true) { %>
                            <p id="error">Invalid Credentials</p>
                        <% } %>
                        <div class="mb-3">
                            <input type="email" name="email" id="email" class="form-control" placeholder="Email Address">
                        </div>
                        <div class="mb-3">
                            <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                        </div>
                        <div class="d-grid gap-2 col-10 mx-auto">
                            <button type="submit" name="submit" value="login" class="btn btn-primary btn-sm">Login</button>
                            <a href="home.jsp" class="btn btn-secondary btn-sm" role="button">Back</a>
                        </div>
                    </form>
                    <p style="margin-top: 10px; margin-bottom: 0px">Don't have an account yet? <a href="createAccount.jsp">Sign up</a></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
