package Code;


import java.sql.*;
import javax.swing.JOptionPane;

public class MyConnection {
    
    public static Connection getConnection()
    {
        Connection con = null;
        
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/student_hub","root","");
        }
        catch (Exception e) 
        {
            String errorMessage = "<html><b style='font-size: 12px;'>" + e.getMessage() + "</b></html>";
            JOptionPane.showMessageDialog(null, errorMessage, "Error", JOptionPane.ERROR_MESSAGE);
        }
        
        
        return con;
    }
}
