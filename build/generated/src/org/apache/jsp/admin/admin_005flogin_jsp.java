package org.apache.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import Code.MyConnection;

public final class admin_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("\t<meta charset=\"utf-8\">\n");
      out.write("\t<meta name=\"author\" content=\"Kodinger\">\n");
      out.write("\t<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\n");
      out.write("\t<title>Login Page</title>\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"css/my-login.css\">\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css\" integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n");
      out.write("</head>\n");
      out.write("<body class=\"my-login-page\">\n");
      out.write("\t<section class=\"h-100\">\n");
      out.write("\t\t<div class=\"container h-100\">\n");
      out.write("\t\t\t<div class=\"row justify-content-md-center h-100\">\n");
      out.write("\t\t\t\t<div class=\"card-wrapper\">\n");
      out.write("\t\t\t\t\t<div class=\"brand\">\n");
      out.write("\t\t\t\t\t\t<img src=\"img/logo.png\" alt=\"logo\" height=\"300px\">\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"card fat\">\n");
      out.write("\t\t\t\t\t\t<div class=\"card-body\">\n");
      out.write("\t\t\t\t\t\t\t<h4 class=\"card-title\">Login</h4>\n");
      out.write("\t\t\t\t\t\t\t<form method=\"POST\" class=\"my-login-validation\" novalidate=\"\">\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<label for=\"username\">Username</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"username\" type=\"text\" class=\"form-control\" name=\"username\" value=\"\" required autofocus>\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"invalid-feedback\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\tUsername is invalid\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<label for=\"password\">Password</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t<input id=\"password\" type=\"password\" class=\"form-control\" name=\"password\" required data-eye>\n");
      out.write("\t\t\t\t\t\t\t\t    <div class=\"invalid-feedback\">\n");
      out.write("\t\t\t\t\t\t\t\t    \tPassword is required\n");
      out.write("\t\t\t\t\t\t\t    \t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"custom-checkbox custom-control\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<input type=\"checkbox\" name=\"remember\" id=\"remember\" class=\"custom-control-input\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<label for=\"remember\" class=\"custom-control-label\">Remember Me</label>\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"form-group m-0\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<button type=\"submit\" class=\"btn btn-primary btn-block\">\n");
      out.write("\t\t\t\t\t\t\t\t\t\tLogin\n");
      out.write("\t\t\t\t\t\t\t\t\t</button>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("                            </form>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</section>\n");
      out.write("    ");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            con=MyConnection.getConnection();
            String sql = "";
            if(username != null && password != null &&!username.isEmpty() && !password.isEmpty()){
            stmt = con.prepareStatement("SELECT * FROM admin WHERE username = ? AND password = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            
            rs = stmt.executeQuery();

            if (rs.next()) {
                
                session.setAttribute("username", username);

                // Redirect to dashboard.jsp
                response.sendRedirect("dashboard.jsp");
            } else {
                out.println("<h2>Invalid username or password. Please try again.</h2>");
            }
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
      out.write("\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.3.1.slim.min.js\" integrity=\"sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js\" integrity=\"sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js\" integrity=\"sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"js/my-login.js\"></script>\n");
      out.write("    <script src=\"https://code.jquery.com/jquery-3.4.1.slim.min.js\" integrity=\"sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js\" integrity=\"sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo\" crossorigin=\"anonymous\"></script>\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js\" integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\" crossorigin=\"anonymous\"></script>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>");
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
