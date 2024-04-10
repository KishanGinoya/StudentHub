package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import Code.MyConnection;
import java.sql.Connection;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"utf-8\">\r\n");
      out.write("        <meta name=\"author\" content=\"Kodinger\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n");
      out.write("        <title>Student Hub</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\r\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"css/feed.css\">\r\n");
      out.write("        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("        <nav>\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"logo\"><a href=\"index.jsp\"><img src=\"img/name.png\" alt=\"logo\"></a></div>\r\n");
      out.write("                <div class=\"search-bar\">\r\n");
      out.write("                    <i class=\"uil uil-search\"></i>\r\n");
      out.write("                    <input type=\"text\" placeholder=\"Search\" />\r\n");
      out.write("                </div>\r\n");
      out.write("                ");

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
                
      out.write("\r\n");
      out.write("                <div class=\"create\">\r\n");
      out.write("                    <a href=\"createpost.jsp?id=");
      out.print( id );
      out.write("\"><label class=\"btn btn-primary\" for=\"create-post\">+ Create</label></a>\r\n");
      out.write("                    <div class=\"profile-pic\">\r\n");
      out.write("                        <img src=\"upload/");
      out.print( filename);
      out.write("\" alt=\"pic 1\" />\r\n");
      out.write("                    </div>\r\n");
      out.write("                    ");
 }
      out.write("\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <main class=\"main\">\r\n");
      out.write("            <div class=\"container\">\r\n");
      out.write("                <div class=\"left\">\r\n");
      out.write("                    <a class=\"profile\">\r\n");
      out.write("                        <div class=\"profile-pic\">\r\n");
      out.write("                            <img src=\"upload/");
      out.print( filename);
      out.write("\" />\r\n");
      out.write("                        </div>\r\n");
      out.write("                        <div class=\"handle\">\r\n");
      out.write("                            <h4>");
      out.print(user);
      out.write("</h4>\r\n");
      out.write("                            <p class=\"text-muted\">@");
      out.print( dept);
      out.write("</p>\r\n");
      out.write("                        </div>\r\n");
      out.write("                    </a>\r\n");
      out.write("                    <div class=\"sidebar\">\r\n");
      out.write("                        <a class=\"menu-item active\">\r\n");
      out.write("                            <span><i class=\"uil uil-home\"></i></span>\r\n");
      out.write("                            <h3>Home</h3>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"menu-item\">\r\n");
      out.write("                            <span><i class=\"uil uil-bookmark\"></i></span>\r\n");
      out.write("                            <h3>Profile</h3>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"menu-item\">\r\n");
      out.write("                            <span><i class=\"uil uil-analytics\"></i></span>\r\n");
      out.write("                            <h3>About</h3>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <a class=\"menu-item\">\r\n");
      out.write("                            <span><i class=\"uil uil-palette\"></i></span>\r\n");
      out.write("                            <h3>Feedback</h3>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <label class=\"btn btn-primary\" for=\"create-post\">Create Post</label>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("\r\n");
      out.write("                <div class=\"middle\">\r\n");
      out.write("                    <div class=\"feeds\">\r\n");
      out.write("                        ");

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
                        
      out.write("\r\n");
      out.write("                        <div class=\"feed\">\r\n");
      out.write("                            <div class=\"head\"></div>\r\n");
      out.write("                            <div class=\"user\">\r\n");
      out.write("                                <div class=\"profile-pic\">\r\n");
      out.write("                                    <img src=\"upload/");
      out.print( rs2.getString("profile_picture") );
      out.write("\" alt=\"\" />\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"info\">\r\n");
      out.write("                                    <h3>");
      out.print( rs2.getString("username") );
      out.write("</h3>\r\n");
      out.write("                                    <small>");
      out.print(rs1.getTimestamp("post_date") );
      out.write("</small>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <span class=\"edit\"><i class=\"uil uil-ellipsis-h\"></i></span>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"photo\">\r\n");
      out.write("                                <img src=\"upload/");
      out.print( rs1.getString("media_url") );
      out.write("\" alt=\"\" />\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"action-button\">\r\n");
      out.write("                                <div class=\"interaction-button\">\r\n");
      out.write("                                    <span><i class=\"uil uil-thumbs-up\"></i></span>\r\n");
      out.write("                                    <span><i class=\"uil uil-comment\"></i></span>\r\n");
      out.write("                                    <span><i class=\"uil uil-share\"></i></span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                                <div class=\"bookmark\">\r\n");
      out.write("                                    <span><i class=\"uil uil-bookmark\"></i></span>\r\n");
      out.write("                                </div>\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"liked-by\">\r\n");
      out.write("                                ");
      out.print( rs1.getInt("likes_count") );
      out.write(" Likes\r\n");
      out.write("                            </div>\r\n");
      out.write("\r\n");
      out.write("                            <div class=\"caption\">\r\n");
      out.write("                                <p>\r\n");
      out.write("                                    <b>");
      out.print( usernm );
      out.write("</b>");
      out.print( rs1.getString("content") );
      out.write("\r\n");
      out.write("                                </p>\r\n");
      out.write("                            </div>\r\n");
      out.write("                        </div>\r\n");
      out.write("                        ");
 } 
      out.write("\r\n");
      out.write("                        ");
 } 
      out.write("\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </main>\r\n");
      out.write("    </body\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
