<%-- 
    Document   : header
    Created on : 2 Mar, 2024, 2:54:25 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
<header>
            <h2 style="padding: 10px;">
                <label for="nav-toggle">
                    <span class="las la-bars"> </span>
                </label>

                <b>Dashboard</b>
            </h2>

            

            <div class="user-wrapper">
                <img src="img/user.png" width="50px" height="50px" alt="">
                <div class="user-info">
                    <b>
                        <h4>Welcome</h4>
                        
                        <small><%= session.getAttribute("username")  %></small>
                    </b>
                </div>
                <div class="dropdown">
                    <div class="dropdown-trigger">
                        <span class="las la-angle-down"></span>
                    </div>
                    <div class="dropdown-menu">
                        <!-- <a class="dropdown-item" href="#">Profile</a> -->
                        <!--<a class="dropdown-item" href="change-password.php">Settings</a>-->
                        <a class="dropdown-item" href="logout.jsp">Logout</a>
                    </div>
                </div>
            </div>

</header>
    </body>
</html>
