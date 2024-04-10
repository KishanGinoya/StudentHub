<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Logout</title>
</head>
<body>
    <% 
    // Get the session
    //HttpSession session2 = request.getSession(false);
    
    // Check if the session is not null
    if(session != null){
        // Retrieve the username from the session
        String username = (String) session.getAttribute("username");
        
        // Display a message confirming logout
        out.println("<h2>Logged out successfully, " + username + "!</h2>");
        
        // Invalidate the session
        session.invalidate();
    } else {
        // If session is null, display an error message or handle as needed
        out.println("<h2>Error: Session is null!</h2>");
    }
    
    // Redirect to the login page
    response.sendRedirect("admin_login.jsp");
    %>
</body>
</html>
