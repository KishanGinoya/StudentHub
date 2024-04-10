import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Code.MyConnection;

@WebServlet("/register")
@MultipartConfig
public class register extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            Part filePart = request.getPart("file");

            // Get the filename
            String fileName = getFileName(filePart);

            // Create the directory to save the file if it doesn't exist
            File uploadDir = new File("D:\\student\\upload");
            if (!uploadDir.exists()) {
                System.out.println("Directory does not exist. Creating directory...");
                uploadDir.mkdir();
            }

            // Write the file to the upload directory
            try (InputStream inputStream = filePart.getInputStream();
                 OutputStream outputStream = new FileOutputStream(new File(uploadDir, fileName))) {
                int read;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
//
//                // File uploaded successfully, print success message
//                out.println("File " + fileName + " uploaded successfully!");

                // Database operations
                try {
                    Connection con = MyConnection.getConnection();
                    String username = request.getParameter("username");
                    String email = request.getParameter("email");
                    String gender = request.getParameter("gender");
                    String mobileNo = request.getParameter("mobile_no");
                    String password = request.getParameter("password");
                    String bio = request.getParameter("bio");
                    String enrolmentNo = request.getParameter("enrolment_no");
                    String department = request.getParameter("department");
                    String semester = request.getParameter("semester");

                    if (!username.isEmpty() && !password.isEmpty()) {
                        PreparedStatement pr = con.prepareStatement("INSERT INTO users(username, email, gender, mobile_no, password, profile_picture, bio, enrolment_no, department, semester) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

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
                            out.println("<html><body>");
                            out.println("<h2>Registration Successful</h2>");
                            out.println("</body></html>");
                        } else {
                            out.println("Registration failed.");
                        }
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Database error: " + e.getMessage());
                }
            } catch (IOException e) {
                e.printStackTrace();
                out.println("Failed to upload file.");
            }
        }
    }

    // Method to extract filename from content-disposition header of the part
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
