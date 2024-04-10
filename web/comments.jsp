<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="code.dbConnection" %>

<html>

<head>
    <meta charset="utf-8">
    <meta name="author" content="Kodinger">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Student Hub</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="css/feed.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>

<body>
        
    <nav>
        <div class="container">
            <div class="logo"><a href="index.html"><img src="img/name.png" alt="logo"></a></div>
            <div class="search-bar">
                <i class="uil uil-search"></i>
                <input type="text" placeholder="Search" />
            </div>
            <div class="create">
                <a href=""><label class="btn btn-primary" for="create-post">+ Create</label></a>
                <div class="profile-pic">
                    <img src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp"
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
                    <div class="feed">
                        <div class="head"></div>
                        <div class="user">
                            <div class="profile-pic">
                                <img src="https://64.media.tumblr.com/7b28774544438d73ca8c1daad11402e0/88958e5f55a67155-fd/s250x400/a9ef3dad54f6c57a53fdeef1a793f0143a9aea27.jpg"
                                    alt="" />
                            </div>
                            <div class="info">
                                <h3>Lana Rose</h3>
                                <small>Dubai, 15 MINUTES AGO</small>
                            </div>
                            <span class="edit"><i class="uil uil-ellipsis-h"></i></span>
                        </div>

                        <div class="photo">
                            <img src="https://png.pngtree.com/background/20230512/original/pngtree-nature-background-sunset-wallpaer-with-beautiful-flower-farms-picture-image_2503007.jpg"
                                alt="" />
                        </div>

                        <div class="action-button">
                            <div class="interaction-button">
                                <span><i class="uil uil-thumbs-up"></i></span>
                                <span><i class="uil uil-comment"></i></span>
                                <span><i class="uil uil-share"></i></span>
                            </div>
                            <div class="bookmark">
                                <span><i class="uil uil-bookmark"></i></span>
                            </div>
                        </div>

                        <div class="liked-by">
                            -100 Likes
                        </div>

                        <div class="caption">
                            <p>
                                <b>Lana Rose</b>Lorem ipsum dolor storiesquiquam eius.
                                <span class="hash-tag">#lifestyle</span>
                            </p>
                        </div>
                        <i style="font-size: 25px;" class='bx bx-like'></i>
                        <i style="font-size: 25px;" class='bx bxs-like'></i>
                    </div>
                    <div class="container mt-2">
                        <div class="wider-content">
                            <div class="row d-flex justify-content-center">

                                <div class="col-md-12">

                                    <div class="card p-3 mt-2">

                                        

                                           
<%
        // Define variables to store user data
        String comment = null;
        String postIdStr = request.getParameter("post_id");
       int postId = Integer.parseInt(postIdStr);

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            con = dbConnection.getConnection();
            stmt = con.prepareStatement("SELECT * FROM comments WHERE post_id = ?");
            stmt.setInt(1, postId);
            rs = stmt.executeQuery();

            while(rs.next()) {
                // Retrieve comment details and display them
                String commentText = rs.getString("comment");
                Timestamp commentDate = rs.getTimestamp("comment_date");
    %>
    
                <div class="card p-3 mt-2">

                                        <div class="d-flex justify-content-between align-items-center">

                                            <div class="user d-flex flex-row align-items-center">
               
                    <span><small class="font-weight-bold"><p><b>Comment: </b> <%= commentText %></p></small></span>
                                            </div>
                <small><%= commentDate  %></small>
                                        </div>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close database resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
       
                                    </div>

                                    <div class="card p-3 mt-2">

                                    </div>

                                    <div class="wider-content">

                                    <div class="card p-3 mt-2">

                                        <div class="d-flex justify-content-between align-items-center">

                                            <div class="user d-flex flex-row align-items-center">
                                                <div class="comments">
                                                <form action="" method="post">
                                                    <textarea placeholder="add a comment">
                                                    </textarea>
                                                </form>
                                            </div>
                                            </div>


                                            <small>3 days ago</small>

                                        </div>


                                    </div>

                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>
        </div>
        </div>
    </main>
</body>

</html>