package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class reg_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=UTF-8");
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Registration Form</h1>\n");
      out.write("        <form action=\"register\" method=\"post\" enctype=\"multipart/form-data\">\n");
      out.write("             <label >Username:</label>\n");
      out.write("        <input type=\"text\" id=\"username\" name=\"username\" required><br><br>\n");
      out.write("        \n");
      out.write("        <label>Email:</label>\n");
      out.write("        <input type=\"email\" id=\"email\" name=\"email\" required><br><br>\n");
      out.write("        \n");
      out.write("        <label>Gender:</label><br>\n");
      out.write("        <input type=\"radio\"  name=\"gender\" value=\"male\" required>\n");
      out.write("        <label>Male</label><br>\n");
      out.write("        <input type=\"radio\"  name=\"gender\" value=\"female\" required>\n");
      out.write("        <label>Female</label><br>\n");
      out.write("        <input type=\"radio\"  name=\"gender\" value=\"other\" required>\n");
      out.write("        <label>Other</label><br><br>\n");
      out.write("        \n");
      out.write("        <label >Mobile Number:</label>\n");
      out.write("        <input type=\"tel\"  name=\"mobile_no\" required><br><br>\n");
      out.write("        \n");
      out.write("        <label>Password:</label>\n");
      out.write("        <input type=\"password\"  name=\"password\" required><br><br>\n");
      out.write("        \n");
      out.write("       <label>Upload Profile Picture:</label>\n");
      out.write("        <input type=\"file\"  name=\"file\" required><br><br>\n");
      out.write("        \n");
      out.write("        <label for=\"bio\">Bio:</label><br>\n");
      out.write("        <textarea id=\"bio\" name=\"bio\" rows=\"4\" cols=\"50\"></textarea><br><br>\n");
      out.write("        \n");
      out.write("        <label for=\"enrolment_no\">Enrollment Number:</label>\n");
      out.write("        <input type=\"text\" id=\"enrolment_no\" name=\"enrolment_no\"><br><br>\n");
      out.write("        \n");
      out.write("        <label>Department:</label>\n");
      out.write("        <select name=\"department\" required>\n");
      out.write("            <option value=\"\">Select Department</option>\n");
      out.write("            <option value=\"Computer Science\">Computer Science</option>\n");
      out.write("            <option value=\"Electrical Engineering\">Electrical Engineering</option>\n");
      out.write("            <option value=\"Mechanical Engineering\">Mechanical Engineering</option>\n");
      out.write("            <!-- Add more options as needed -->\n");
      out.write("        </select><br><br>\n");
      out.write("\n");
      out.write("        <label>Semester:</label>\n");
      out.write("        <select name=\"semester\" required>\n");
      out.write("            <option value=\"\">Select Semester</option>\n");
      out.write("            <option value=\"1st\">1st</option>\n");
      out.write("            <option value=\"2nd\">2nd</option>\n");
      out.write("            <option value=\"3rd\">3rd</option>\n");
      out.write("            <!-- Add more options as needed -->\n");
      out.write("        </select><br><br>\n");
      out.write("\n");
      out.write("        \n");
      out.write("            <input type=\"submit\" value=\"Register\">\n");
      out.write("        </form>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
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
