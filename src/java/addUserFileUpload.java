import Code.MyConnection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/PostServlet")
@MultipartConfig
public class addUserFileUpload extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Part filePart = request.getPart("file");
            String fileName = getFileName(filePart);

            // Create the directory to save the file if it doesn't exist
            String uploadPath = "D:/student/upload"; // Change to your desired upload directory
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Write the file to the upload directory
            try (InputStream inputStream = filePart.getInputStream();
                    OutputStream outputStream = new FileOutputStream(new File(uploadDir, fileName))) {
                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                // Database operations
                try (Connection con = MyConnection.getConnection()) {
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String gender = request.getParameter("gender");
                    String mobileNo = request.getParameter("mobile_no");
                    String password = request.getParameter("password");
                    String bio = request.getParameter("bio");
                    String enrolmentNo = request.getParameter("enrolment_no");
                    String department = request.getParameter("department");
                    String semester = request.getParameter("semester");

                    if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
                        PreparedStatement pr = con.prepareStatement("INSERT INTO users(username, email, gender, mobile_no, password,profile_picture, bio, enrolment_no, department, semester) VALUES (?, ?, ?, ?, ?, ?,?, ?, ?, ?)");

                        pr.setString(1, username);
                        pr.setString(2, email);
                        pr.setString(3, gender);
                        pr.setString(4, mobileNo);
                        pr.setString(5, password);
                        pr.setString(6, fileName);
                        
                        pr.setString(7, bio);
                        pr.setString(8, enrolmentNo);
                        pr.setString(9, department);
                        pr.setString(10, semester);

                        int rows = pr.executeUpdate();
                        if (rows > 0) {
                            response.getWriter().println("<html><body>");
                            response.getWriter().println("<h2>alert('User added successfully!')</h2>");
                            response.sendRedirect("admin/manageuser");
                            response.getWriter().println("</body></html>");
                        } else {
                            response.getWriter().println("User addition failed.");
                        }
                    } else {
                        response.getWriter().println("Username and password are required fields.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.getWriter().println("Database error: " + e.getMessage());
                }
            } catch (IOException e) {
                e.printStackTrace();
                response.getWriter().println("Failed to upload file.");
            }
        } catch (IOException | ServletException e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
