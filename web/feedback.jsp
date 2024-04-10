<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Code.MyConnection" %>
<html>
  <head>
    <meta charset="utf-8" />
    <meta name="author" content="Kodinger" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Student Hub</title>
    <link
      rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" type="text/css" href="css/feed.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css"
      integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <nav>
      <div class="container">
        <div class="logo">
          <a href="index.html"><img src="img/name.png" alt="logo" /></a>
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
              alt="pic 1"
            />
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
                src="https://res.cloudinary.com/freecodez/image/upload/v1698067298/images/fy8azbqxhgdrbbijhipe.webp"
              />
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
            <a class="menu-item">
              <span><i class="uil uil-bookmark"></i></span>
              <h3>Profile</h3>
            </a>
            <a class="menu-item">
              <span><i class="uil uil-analytics"></i></span>
              <h3>About</h3>
            </a>
            <a class="menu-item active">
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
                  <h1>Feedback</h1>
                </div>
              </div>
            </div>
            <div class="subscribe">
                <h2 class="subscribe__title">We value your feedback!</h2>
                <p class="subscribe__copy">Your opinions are crucial to enhancing our services and making them more tailored to your needs.</p>
                <form method="post">
                <div class="form">
                    <textarea  placeholder="Enter your response" name="txtarea"></textarea><br>
 
                    <input type="submit" name="send" value="Send"></input>
                </div>
                </form>
            </div>
        </div>
      </div>
    </main>
       <% 
   if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("send") != null) {
    try {
            Connection con = MyConnection.getConnection(); 
            String feedbackText = request.getParameter("txtarea");
            
            if (feedbackText != null && !feedbackText.isEmpty()) {
                // Prepare the SQL statement to insert feedback
                String query = "INSERT INTO feedback (feedback_text) VALUES (?)";
                PreparedStatement pstmt = con.prepareStatement(query);
                
                // Set the parameter value
                pstmt.setString(1, feedbackText);
                
                // Execute the SQL statement
                int rowsInserted = pstmt.executeUpdate();
                
                // Check if the insertion was successful
                if (rowsInserted > 0) {
                    out.println("<p>Feedback submitted successfully!</p>");
                } else {
                    out.println("<p>Failed to submit feedback.</p>");
                }
                
                // Close the PreparedStatement
                pstmt.close();
            } else {
                out.println("<p>Feedback text is empty.</p>");
            }
            
            // Close the connection
            con.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }}
        %>
  </body>
</html>
