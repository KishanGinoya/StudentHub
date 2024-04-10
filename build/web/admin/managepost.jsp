
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Code.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Manage Posts</title>
        <link href="images/bus.png" rel="icon">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>


        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

        <style>
            @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap');

            :root {
                --main-color: #012558;
                --color-dark: #1D2231;
                --text-grey: #8390A2;
            }

            * {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                list-style-type: none;
                text-decoration: none;
                font-family: 'Poppins', sans-serif;
            }

            .sidebar {
                width: 300px;
                position: fixed;
                left: 0;
                top: 0;
                height: 100%;
                background: var(--main-color);
                z-index: 100;
                transition: width 300ms;
            }

            .sidebar-brand {
                height: 90px;
                padding: 1rem 0rem 1rem 2rem;
                color: #fff;

            }

            .sidebar-brand span {
                display: inline-block;
                padding-right: 1rem;
            }

            .sidebar-menu {
                margin-top: 1rem;
            }

            .sidebar-menu li {
                width: 100%;
                margin-bottom: 1.7rem;
                padding-left: 2rem;
            }

            .sidebar-menu ul {
                padding: 0;
                margin: 0;
                box-sizing: border-box;
                list-style-type: none;
                /* Remove bullet points from the list */
            }

            .sidebar-menu a {
                padding-left: 1rem;
                display: block;
                width: 83%;
                color: #fff;
                font-size: 1.1rem;
                text-decoration: none;
            }

            .sidebar-menu a.active {
                background: #fff;
                padding-top: 1rem;
                padding-bottom: 1rem;
                color: var(--main-color);
                border-radius: 30px;
                text-decoration: none;
                font-weight: bold;
            }

            .sidebar-menu a span:first-child {
                font-size: 1.5rem;
                padding-right: 1rem;
            }

            #nav-toggle:checked~.sidebar {
                width: 80px;
            }

            #nav-toggle:checked~.sidebar .sidebar-brand {
                padding-left: 1rem;
                text-align: center;
                justify-content: center;
                /* Center horizontally */
            }

            #nav-toggle:checked~.sidebar .sidebar-brand h2 span,
            #nav-toggle:checked~.sidebar li {
                padding-left: 1rem;
                text-align: center;
            }

            #nav-toggle:checked~.sidebar li a {
                padding-left: 0rem;
            }

            #nav-toggle:checked~.sidebar .sidebar-brand h2 span:last-child,
            #nav-toggle:checked~.sidebar li a span:last-child {
                display: none;
            }

            #nav-toggle:checked~.main-content {
                margin-left: 80px;
            }

            #nav-toggle:checked~.main-content header {
                width: calc(100% - 70px);
                left: 80px;
            }

            .main-content {
                /* Add a margin at the top */
                margin-left: 300px;
                /* Initial margin value */
                transition: margin-left 300ms;
                /* Apply transition to margin-left with a duration of 300ms */
                padding-top: 10px;
                /* Add some padding at the top */
                /* Calculate height based on viewport height minus header height and padding */
                background-color: #f1f5f9;

            }


            header {
                display: flex;
                height: 100px;
                justify-content: space-between;
                padding: 1rem;
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
                background: #fff;
                position: fixed;
                left: 300px;
                width: calc(100% - 300px);
                top: 20;
                z-index: 100;
                transition: width 300ms;
            }

            #nav-toggle {
                display: none;
            }

            header h2 {
                color: #222;
            }

            header label span {
                font-size: 1.7rem;
                padding-right: 1rem;
            }

            /* search bar css*/

            .search-wrapper {
                border: 1px solid #ccc;
                border-radius: 30px;
                height: 50px;
                display: flex;
                align-items: center;
                overflow-x: hidden;
                margin-top: 5px;
                /* Add margin to the top */
                padding: 0 15px;
                /* Add padding to the left and right */

            }

            .search-wrapper span {
                display: flex;
                align-items: center;
                justify-content: center;
                padding: 0rem 1rem;
                font-size: 1.5rem;
                background: #2697FF;
                width: 50px;
                /* Adjust the width as needed */
                height: 100%;
                text-align: center;
                color: #fff;
                /* Add text color */
                cursor: pointer;
                /* Add cursor style */
            }

            .search-wrapper input {
                height: 100%;
                width: 80%;
                /* Adjust the width as needed */
                padding: 0.5rem;
                border: none;
                outline: none;
                font-size: 1rem;
                /* Add font size */
            }

            /* Styling for dropdown */
            .user-wrapper {
                display: flex;
                align-items: center;
                border: 1px solid #ccc;
                /* Add a border */
                padding: 10px;
                /* Add some padding for spacing */
                color: blue;
                background: lime;
            }

            .user-info {
                margin-right: 10px;
            }

            .user-info h4,
            .user-info small {
                margin: 0;
            }

            .dropdown {
                position: relative;
                display: inline-block;
            }

            .dropdown-trigger {
                cursor: pointer;
            }

            .dropdown-menu {
                position: absolute;
                top: 100%;
                left: 50%;
                transform: translateX(-50%);
                /* Center horizontally */
                display: none;
                background-color: #081D45;
                box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }

            .dropdown-item {
                padding: 10px 20px;
                display: block;
                color: #fff;
                text-decoration: none;
            }

            .user-wrapper {
                display: flex;
                align-items: center;
                margin-right: 110px;
            }

            .user-wrapper img {
                border-radius: 50%;
                margin-right: 1rem;
            }

            .user-wrapper h4 {
                margin-right: 50px;
            }

            .user-wrapper small {
                display: inline-block;
                color: #FF2400;


            }

            main {
                padding-top: 130px;
                background-color: #f1f5f9;
                min-height: calc(100vh - 100px);

            }


            .cards {
                display: grid;
                grid-template-columns: repeat(4, 1fr);
                grid-template-rows: 1fr;
                grid-gap: 2rem;
                margin-top: 1rem;

            }

            .card-single {
                margin-left: 5px;
                display: flex;
                justify-content: space-between;
                background: #fff;
                padding: 2rem;
                border-radius: 2px;
                box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
                height: 150px;
                /* Adjust the height as needed */
                width: 275px;
            }

            /* card font-size span increase*/
            .card-single span {
                font-size: 1.2rem;
                /* Adjust the font size as needed */
                font-weight: bold;
            }

            /* icon color */

            .card-single .las {
                color: #ffffff;
                /* White color */
                font-size: 3rem;
            }

            /* crad background-color */
            .card-single:nth-child(1) {
                background: #BF2c34;

            }

            .card-single:nth-child(2) {
                background: #1C05B3;
            }

            .card-single:nth-child(3) {
                background: #006400;
            }

            .card-single div:first-child span {
                color: #fff;
                /* Change text color to white */
            }

            .card-single:last-child {
                background: red;
            }

            /*
    .card-single div:last-child span{
        font-size: 3rem;
        color: var(--main-color);
    }*/
            /*
    .card-single div:first-child span{
        color: var(--text-grey);
    }*/



            .card-single:last-child,
            .card-single:last-child div:last-child span,
            .card-single:last-child div:first-child span {
                color: #fff;
            }

            .recent-grid {
                margin-top: 3.5rem;
                display: grid;
                grid-template-columns: 67% auto;
                grid-gap: 2rem;
            }

            .card {
                background: #fff;
                border-radius: 5px;
            }

            .card-header,
            .card-body {
                padding: 1rem;
            }

            .card-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-bottom: 1px solid #f0f0f0;
            }

            .card-header button {
                background: var(--main-color);
                border-radius: 10px;
                color: #fff;
                font-size: .8rem;
                padding: .5rem 1rem;
                border: 1px solid var(--main-color);
            }

            @media only screen and (max-width: 1200px) {
                .cards {
                    display: grid;
                    grid-template-columns: repeat(4, 1fr);
                    grid-gap: 2rem;
                }

                .card-single {
                    width: 200;
                    /* Adjust width and gap */
                    height: auto;
                    /* Reset the height */
                    min-height: 150px;
                    /* Set a minimum height */
                }

                .sidebar {
                    width: 80px;

                }

                .sidebar .sidebar-brand,
                .sidebar li {
                    padding-left: 1rem;
                    text-align: center;
                }

                .sidebar li a {
                    padding-left: 0rem;
                }

                .sidebar .sidebar-brand h2 span:last-child,
                .sidebar li a span:last-child {
                    display: none;
                }

                .main-content {
                    margin-left: 80px;

                }

                .main-content header {
                    width: calc(100% - 70px);
                    left: 80px;
                }

                /*
            .sidebar:hover {
                width: 300px;
                z-index: 200;
            }
    
            .sidebar:hover .sidebar-brand,
            .sidebar:hover li {
                padding-left: 2rem;
                text-align: left;
            }
    
            .sidebar:hover li a{
                padding-left: 1rem;
            }
    
            .sidebar:hover .sidebar-brand h2 span:last-child,
            .sidebar:hover li a span:last-child {
                display: inline;
            }
    
                */

                #nav-toggle:checked~.sidebar {
                    left: 0 !important;
                    z-index: 100;
                    width: 345px;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand,
                #nav-toggle:checked~.sidebar li {
                    padding-left: 2rem;
                    text-align: left;
                }

                #nav-toggle:checked~.sidebar li a {
                    padding-left: 1rem;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand h2 span:last-child,
                #nav-toggle:checked~.sidebar li a span:last-child {
                    display: inline;
                }

                #nav-toggle:checked~.main-content {
                    margin-left: 345px !important;
                }

                #nav-toggle:checked~.main-content header {
                    width: calc(100% - 345px) !important;
                    left: 345px;
                }

            }

            @media only screen and (max-width: 960px) {


                .cards {
                    grid-template-columns: repeat(3, 1fr);
                    /* Display three columns of cards */

                }

                .card-single {
                    width: 300px;
                    /* Adjust width and gap */
                    height: auto;
                    /* Reset the height */
                }

                .recent-grid {
                    grid-template-columns: 60% 40%;
                }

                #nav-toggle:checked~.sidebar {
                    left: 0 !important;
                    z-index: 100;
                    width: 345px;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand,
                #nav-toggle:checked~.sidebar li {
                    padding-left: 2rem;
                    text-align: left;
                }

                #nav-toggle:checked~.sidebar li a {
                    padding-left: 1rem;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand h2 span:last-child,
                #nav-toggle:checked~.sidebar li a span:last-child {
                    display: inline;
                }


                #nav-toggle:checked~.main-content {
                    margin-left: 345px !important;
                }

                #nav-toggle:checked~.main-content header {
                    width: calc(100% - 345px) !important;
                    left: 345px;
                }

                .search-wrapper {
                    display: none;
                    /* Hide the search bar */
                }

            }

            @media only screen and (max-width: 768px) {
                .cards {
                    grid-template-columns: repeat(2, 1fr);
                    /* Display three columns of cards */

                }

                .card-single {
                    width: 300px;
                    /* Adjust width and gap */
                    height: auto;
                    /* Reset the height */
                }

                .recent-grid {
                    grid-template-columns: 60% 40%;
                }

                #nav-toggle:checked~.sidebar {
                    left: 0 !important;
                    z-index: 100;
                    width: 345px;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand,
                #nav-toggle:checked~.sidebar li {
                    padding-left: 2rem;
                    text-align: left;
                }

                #nav-toggle:checked~.sidebar li a {
                    padding-left: 1rem;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand h2 span:last-child,
                #nav-toggle:checked~.sidebar li a span:last-child {
                    display: inline;
                }

                #nav-toggle:checked~.main-content {
                    margin-left: 345px !important;
                }

                #nav-toggle:checked~.main-content header {
                    width: calc(100% - 345px) !important;
                    left: 345px;
                }

                .search-wrapper {
                    display: none;
                    /* Hide the search bar */
                }


            }

            @media only screen and (max-width: 568px) {
                .cards {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    /* Center horizontally */
                    justify-content: center;
                    /* Center vertically */
                }

                .card-single {
                    width: 300px;
                    /* Adjust width and gap */
                    height: auto;
                    /* Reset the height */
                }

                .recent-grid {
                    grid-template-columns: 60% 40%;
                }

                #nav-toggle:checked~.sidebar {
                    left: 0 !important;
                    z-index: 100;
                    width: 345px;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand,
                #nav-toggle:checked~.sidebar li {
                    padding-left: 2rem;
                    text-align: left;
                }

                #nav-toggle:checked~.sidebar li a {
                    padding-left: 1rem;
                }

                #nav-toggle:checked~.sidebar .sidebar-brand h2 span:last-child,
                #nav-toggle:checked~.sidebar li a span:last-child {
                    display: inline;
                }

                #nav-toggle:checked~.main-content {
                    margin-left: 345px !important;
                }

                #nav-toggle:checked~.main-content header {
                    width: calc(100% - 345px) !important;
                    left: 345px;
                }

                .search-wrapper {
                    display: none;
                    /* Hide the search bar */
                }



            }



            .custom-link {
                display: flex;
                align-items: center;
                background-color: aqua;
                padding: 10px 20px;
                border-radius: 5px;
                text-align: center;
                margin-bottom: 20px;
                height: 10%;
                font-size: 20px;
            }

            .custom-link a {
                display: inline-block;
                vertical-align: middle;
                margin-right: 10px;
                color: blue;
            }

            .custom-link i {
                font-size: 20px;
                /* Adjust the font size as needed */
                vertical-align: middle;
            }


            /* Add this CSS for the table and buttons */
            #table {
                width: 99%;
                border-collapse: collapse;
                margin-top: 20px;
                margin-left: 10px;
            }

            #table th,
            #table td {
                padding: 10px;
                text-align: left;
                border: 1px solid #ccc;
                background: #F8F2ED;
            }

            #table th {
                background-color: #DE3163;
                font-weight: bold;
                text-align: center;
                color: #fff;
                text-transform: uppercase;
            }

            .btn-block {
                width: 100%;
                color: #fff;
                font-weight: bold;
            }

            .custom-link {
                font-weight: bold;
            }

            /* table-responsive */
            .table-container {
                overflow-x: auto;
            }

            .heading {
                text-align: center;
                color: #0437F2;
                margin-top: 20px;
            }
        </style>

    </head>
    <body>
        <input type="checkbox" id="nav-toggle">
        <div class="sidebar">
            <div class="sidebar-brand">
                <h2>
                    <img style="height: 50px; width: 200px; margin-top: 15px;" src="img/name.png" alt="Student_Hub">
                </h2>
            </div>


            <div class="sidebar-menu">
                <ul>
                    <li>
                        <a href="dashboard.jsp"><span class="las la-igloo"></span>
                            <span>Dashboard</span></a>
                    </li>
                    <li>
                        <a href="manageuser.jsp"><span class="las la-users"></span>
                            <span>Manage Users</span></a>
                    </li>
                    <li>
                        <a href="managepost.jsp" class="active" ><span class="las la-route"></span>
                            <span>Manage Post</span></a>
                    </li>
                    <li>
                        <a href="managefeedback.jsp" ><span class="las la-comments"></span>
                            <span>ManageFeedback</span></a>
                    </li>

                </ul>
            </div>
        </div>


        <div class="main-content">
            <jsp:include page="header.jsp" />

            <main>
                <div class="custom-link">
                    <a href="dashboard.jsp">Home</a>
                    <i class="fa fa-angle-right"></i> &nbsp;<span style="color: red;"><b>Manage Post</b></span>
                </div>
                <%
                    Connection con = MyConnection.getConnection();

                    PreparedStatement pr = con.prepareStatement("select * from posts");

                    ResultSet rs = pr.executeQuery();

                %>

                <div class="agile-tables">
                    <div class="table-container">
                        <table id="table">
                            <thead>
                                <tr>
                                    <th colspan="8" style="background-color: #fff; vertical-align: middle; text-transform: capitalize; padding: 20px;">
                                        <h2 class="heading d-flex align-items-center justify-content-between">
                                            <b><span class="heading-text">Manage Posts</span></b>
                                            
                                        </h2>
                                    </th>
                                </tr>
                                <tr>
                                    <th>Post ID</th>
                                    <th>Content</th>
                                    <th>Post_Date</th>
                                    <th>Likes</th>
                                    <th>Post</th>
                                    <!-- <th>Add User</th> -->
                                    
                                    <th>Delete User</th>
                                </tr>
                            </thead>
                            <%                   
                                while (rs.next()) {
                            %>
                            <tbody>
                                <tr>
                                    <td><%= rs.getInt("post_id")%></td>
                                    <td><%= rs.getString("content")%></td>
                                    <td><%= rs.getString("post_date")%></td>
                                    <td><%= rs.getString("likes_count")%></td>
                                    <td style="text-align: center;"><img src="../upload/<%= rs.getString("media_url")  %>" alt="Post Image" style="max-width: 50px; max-height: 50px;"></td>
                                    
                                    
                                    <td><a href="deletepost.jsp?id=<%= rs.getInt("post_id")%>"><button type="button" class="btn btn-warning btn-block">Delete</button></a></td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>
                        </table>
                        <br><br>

                    </div>
                </div>
            </main>

            <jsp:include page="footer.jsp" />
        </div>

    </body>
</html>
