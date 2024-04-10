<%@page import="java.sql.PreparedStatement"%>
<%@page import="Code.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection con = MyConnection.getConnection();
            String id1 = request.getParameter("id");
            try {
                if (id1 != null && !id1.isEmpty()) {
                    int id = Integer.parseInt(id1);

                    // Delete related posts first
                    
                    PreparedStatement pr2 = con.prepareStatement("delete from posts where user_id=?");
                    pr2.setInt(1, id);
                    int postsDeleted = pr2.executeUpdate();

                    // Then delete the user
                    PreparedStatement pr = con.prepareStatement("delete from users where user_id=?");
                    pr.setInt(1, id);
                    int usersDeleted = pr.executeUpdate();

                    if (usersDeleted > 0 && postsDeleted > 0) {
                        out.println("<script>alert('User and related posts deleted successfully');</script>");
                        
                    } else {
                        out.println("<script>alert('Failed to delete user');</script>");
                    }
                } else {
                    out.println("<script>alert('Invalid user ID');</script>");
                }
            } catch (Exception e) {
                out.println("<script>alert('Error occurred: " + e.toString() + "');</script>");
                
            }
        response.sendRedirect("manageuser.jsp");

        %>
        
    </body>
</html>
