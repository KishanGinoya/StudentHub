import Code.MyConnection;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            Part filePart = request.getPart("file");
            String fileName = getFileName(filePart);
            int id=Integer.parseInt(request.getParameter("id"));
        
            // Create the directory to save the file if it doesn't exist
            String uploadPath = "D:/student/web/upload"; // Change to your desired upload directory
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
                    String content = request.getParameter("content");

                    if (content != null && !content.isEmpty()) {
                        PreparedStatement pr = con.prepareStatement("INSERT INTO posts (user_id, content, media_url, post_date) VALUES (?, ?, ?, NOW())");

                        pr.setInt(1, id); // Change user_id as needed
                        pr.setString(2, content);
                        pr.setString(3, fileName);

                        int rows = pr.executeUpdate();
                        if (rows > 0) {
                            response.getWriter().println("<html><body>");
                            response.getWriter().println("<h2>Post Successfully Created</h2>");
                        } else {
                            response.getWriter().println("Post not Created ");
                        }
                    } else {
                        response.getWriter().println("Content is empty");
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
