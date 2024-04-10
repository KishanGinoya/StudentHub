<%-- Document : profile Created on : 2 Mar, 2024, 2:14:17 PM Author : Tushar --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.io.*" %>
<%@page import="Code.MyConnection" %>

<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="author" content="Kodinger" />
        <meta name="viewport" content="width=device-width,initial-scale=1" />
        <title>Student Hub</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
              crossorigin="anonymous" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/feed.css" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
              integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
              crossorigin="anonymous" />
        <style type="text/css">
            body {
                margin-top: 20px;
                color: #1a202c;
                text-align: left;
                background-color: #e2e8f0;
            }

            .main-body {
                padding: 15px;
            }

            .center {
                margin-left: 300px
            }
            .card {
                box-shadow: 0 1px 3px 0 rgba(0, 0, 0, .1), 0 1px 2px 0 rgba(0, 0, 0, .06);
            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0, 0, 0, .125);
                border-radius: .25rem;
            }

            .card-body {
                flex: 1 1 auto;
                min-height: 1px;
                padding: 1rem;
            }

            .gutters-sm {
                margin-right: -8px;
                margin-left: -8px;
            }

            .gutters-sm>.col,
            .gutters-sm>[class*=col-] {
                padding-right: 8px;
                padding-left: 8px;
            }

            .mb-3,
            .my-3 {
                margin-bottom: 1rem !important;
            }

            .bg-gray-300 {
                background-color: #e2e8f0;
            }

            .h-100 {
                height: 100% !important;
            }

            .shadow-none {
                box-shadow: none !important;
            }
        </style>
    </head>

    <body>
        <% // Define variables to store user data 
            String username = null;
            String email = null;
            String gender = null;
            String mobileNo = null;
            String bio = null;
            String enrolmentNo = null;
            String department = null;
            String semester = null;
            String profilePicturePath = null;
            Connection con = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            try {
                // Establish database 
                con = MyConnection.getConnection();
                stmt = con.prepareStatement("SELECT * FROM users WHERE username=?");
                stmt.setString(1,
                        session.getAttribute("username").toString());
                rs = stmt.executeQuery();
                if (rs.next()) {
                    username = rs.getString("username");
                    email = rs.getString("email");
                    gender = rs.getString("gender");
                    mobileNo = rs.getString("mobile_no");
                    bio = rs.getString("bio");
                    enrolmentNo = rs.getString("enrolment_no");
                    department = rs.getString("department");
                    semester = rs.getString("semester");
                    profilePicturePath = rs.getString("profile_picture");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally { // Close database resources 
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stmt != null) {
                        stmt.close();
                      }
                      if (con != null) {
                          con.close();
                      }
                  } catch (SQLException e) {
                      e.printStackTrace();
                  }
              }%>
        <nav>
            <div class="container">
                <div class="logo">
                    <a href="index.jsp"><img src="img/name.png" alt="logo" /></a>
                </div>
                <div class="search-bar">
                    <i class="uil uil-search"></i>
                    <input type="text" placeholder="Search" />
                </div>
                <div class="create">
                    <label class="btn btn-primary" for="create-post">+ Create</label>
                    <div class="profile-pic">
                        <img
                            src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp"
                            alt="pic 1" />
                    </div>
                </div>
            </div>
        </nav>
        <main class="main">
            <div class="container">
                <div class="left">
                    <a class="profile">
                        <div class="profile-pic">
                            <img
                                src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp" />
                        </div>
                        <div class="handle">
                            <h4>Student</h4>
                            <p class="text-muted">@Student</p>
                        </div>
                    </a>
                    <div class="sidebar">
                        <a class="menu-item">
                            <span><i class="uil uil-home"></i></span>
                            <h3>Home</h3>
                        </a>
                        <a class="menu-item active">
                            <span><i class="uil uil-bookmark"></i></span>
                            <h3>Profile</h3>
                        </a>
                        <a class="menu-item">
                            <span><i class="uil uil-analytics"></i></span>
                            <h3>About</h3>
                        </a>
                        <a class="menu-item">
                            <span><i class="uil uil-palette"></i></span>
                            <h3>Feedback</h3>
                        </a>
                        <label class="btn btn-primary" for="create-post">Create Post</label>
                    </div>
                </div>
                <div class="middle">
                    <div class="feeds">
                        <div class="feed">
                            <div class="user">
                                <div class="info">
                                    <h1>Profile</h1>
                                    <div class="container">
                                        <div class="main-body">
                                            <nav aria-label="breadcrumb" class="main-breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                                    <li class="breadcrumb-item"><a href="javascript:void(0)">User</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                                                </ol>
                                            </nav>

                                            <div class="row gutters-sm">
                                                <div class="col-md-4 mb-3">
                                                    <div class="center">
                                                        <div class="card">
                                                            <div class="card-body">
                                                                <div class="d-flex flex-column align-items-center text-center">
                                                                    <img src="<%= profilePicturePath%>" alt="Admin" class="rounded-circle" width="150">
                                                                    <div class="mt-3">
                                                                        <h4><%= username%></h4>
                                                                        <p class="text-secondary mb-1"><%= bio%></p>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="col-md-12">
                                                    <div class="card mb-3">
                                                        <div class="card-body">
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Full Name</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    </label>
                                                                    <%= username%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Email</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <a href="/cdn-cgi/l/email-protection" class="__cf_email__"
                                                                       data-cfemail="06606f76466c736d6b736e28676a">
                                                                        <%= email%>
                                                                    </a>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Phone</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= mobileNo%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Gender</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= gender%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">BIO</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= bio%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Enrollment no.</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= enrolmentNo%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Department</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= department%>
                                                                </div>
                                                            </div>
                                                            <hr>
                                                            <div class="row">
                                                                <div class="col-sm-3">
                                                                    <h6 class="mb-0">Semester</h6>
                                                                </div>
                                                                <div class="col-sm-9 text-secondary">
                                                                    <%= semester%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row gutters-sm">
                                                            <div class="col-sm-6 mb-3">

                                                            </div>
                                                            <div class="col-sm-6 mb-3">
                                                                <div class="card h-100">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script data-cfasync="false"
                                        src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
                                        <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                                        <script
                                        src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
                                        <script type="text/javascript">

                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </main>

                </div>
                </body>

                </html>