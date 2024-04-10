<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="Code.MyConnection"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="author" content="Kodinger">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Student Hub</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/feed.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <nav>
            <div class="container">
                <div class="logo"><a href="index.jsp"><img src="img/name.png" alt="logo"></a></div>
                <div class="search-bar">
                    <i class="uil uil-search"></i>
                    <input type="text" placeholder="Search" />
                </div>
                <%
                    Connection con = MyConnection.getConnection();
                    String username = session.getAttribute("username").toString();

                    PreparedStatement pr = con.prepareStatement("select * from users where username=?");
                    pr.setString(1, username);

                    ResultSet rs = pr.executeQuery();
                    int id;
                    String filename = "";
                    String user = "";
                    String dept = "";
                    if (rs.next()) {
                        id=rs.getInt("user_id");
                        filename = rs.getString("profile_picture");
                        user = rs.getString("username");
                        dept = rs.getString("department");
                %>
                <div class="create">
                    <a href="createpost.jsp?id=<%= id %>"><label class="btn btn-primary" for="create-post">+ Create</label></a>
                    <div class="profile-pic">
                        <img src="upload/<%= filename%>" alt="pic 1" />
                    </div>
                    <% }%>
                </div>
            </div>
        </nav>

        <main class="main">
            <div class="container">
                <div class="left">
                    <a class="profile">
                        <div class="profile-pic">
                            <img src="upload/<%= filename%>" />
                        </div>
                        <div class="handle">
                            <h4><%=user%></h4>
                            <p class="text-muted">@<%= dept%></p>
                        </div>
                    </a>
                    <div class="sidebar">
                        <a class="menu-item active">
                            <span><i class="uil uil-home"></i></span>
                            <h3>Home</h3>
                        </a>
                        <a class="menu-item">
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
                        <%
                            String content = "";
                            String media = "";
                            String postDate = "";
                            String likesCount = "";
                            PreparedStatement pr2=con.prepareStatement("select * from posts");
                            ResultSet rs1=pr2.executeQuery();
                            
                            while(rs1.next()){
                                String usernm = "";
                                int user_id = rs1.getInt("user_id");
                                PreparedStatement pr3=con.prepareStatement("select * from users where user_id = ?");
                                pr3.setInt(1, user_id);
                                ResultSet rs2=pr3.executeQuery();
                                
                                if(rs2.next()) {
                                    usernm = rs2.getString("username");
                        %>
                        <div class="feed">
                            <div class="head"></div>
                            <div class="user">
                                <div class="profile-pic">
                                    <img src="upload/<%= rs2.getString("profile_picture") %>" alt="" />
                                </div>
                                <div class="info">
                                    <h3><%= rs2.getString("username") %></h3>
                                    <small><%=rs1.getTimestamp("post_date") %></small>
                                </div>
                                <span class="edit"><i class="uil uil-ellipsis-h"></i></span>
                            </div>

                            <div class="photo">
                                <img src="upload/<%= rs1.getString("media_url") %>" alt="" />
                            </div>

                            <div class="action-button">
                                <div class="interaction-button">
                                    <span><i class='bx bx-like'></i></span>
                                    <span><i class='bx bxs-like'></i></span>
                                    <span><i class='bx bx-comment-dots' ></i></span>
                                </div>
                                <div class="bookmark">
                                    <span><i class="uil uil-bookmark"></i></span>
                                </div>
                            </div>

                            <div class="liked-by">
                                <%= rs1.getInt("likes_count") %> Likes
                            </div>

                            <div class="caption">
                                <p>
                                    <b><%= usernm %></b><%= rs1.getString("content") %>
                                </p>
                            </div>
                        </div>
                        <% } %>
                        <% } %>
                    </div>
                </div>
            </div>
        </main>
    </body
