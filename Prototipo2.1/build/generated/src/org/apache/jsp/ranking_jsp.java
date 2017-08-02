package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class ranking_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/navbartop.jsp");
  }

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
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <title>Ver aporte</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");
      out.write("<!DOCTYPE html>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<div id=\"img-top\">\n");
      out.write("    <img src=\"img/tortuga.png\" alt=\"tortuga\" width=200 id=\"tortuga\">\n");
      out.write("    <img src=\"img/3D-turtle.png\" alt=\"titulo\">\n");
      out.write("    ");

        if (request.getSession().getAttribute("User") != null) {
    
      out.write("\n");
      out.write("    <div id=\"sesionC\">\n");
      out.write("        <a href=\"VerPerfilServlet\">\n");
      out.write("            <div id=\"sesion\">\n");
      out.write("                Perfil\n");
      out.write("            </div>\n");
      out.write("        </a>\n");
      out.write("        <a href=\"CerrarSesionServlet\">\n");
      out.write("            <div id=\"sesion\">\n");
      out.write("                Cerrar Sesion\n");
      out.write("            </div>\n");
      out.write("        </a>\n");
      out.write("    </div>\n");
      out.write("    ");

    } else {
    
      out.write("\n");
      out.write("    <div id=\"sesionC\">\n");
      out.write("        <a href=\"Registro.jsp\">\n");
      out.write("            <div id=\"sesion\">\n");
      out.write("                Registrate\n");
      out.write("            </div>\n");
      out.write("        </a>\n");
      out.write("        <a href=\"Iniciar_Sesion.jsp\">\n");
      out.write("            <div id=\"sesion\">\n");
      out.write("                Inicia Sesion\n");
      out.write("            </div>\n");
      out.write("        </a>\n");
      out.write("    </div>\n");
      out.write("    ");

    }
    
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("        <div>\n");
      out.write("            \n");
      out.write("            <ul>\n");
      out.write("                <li><a href=\"./indexServlet?pag=0&tipo=all\" \n");
      out.write("                       ");

                           String tipo = (String) request.getSession().getAttribute("tipo");
                           if(tipo == null){
                               out.println("id='selected'");
                               tipo = "all";
                           }
                       
      out.write("\n");
      out.write("                       >Principal</a></li>\n");
      out.write("                <li><a href=\"./indexServlet?pag=0&tipo=Teoria\"\n");
      out.write("                       ");

                           if(tipo.equals("Teoria")){
                               out.println("id='selected'");
                           }
                       
      out.write("\n");
      out.write("                       >Teorías</a></li>\n");
      out.write("                <li><a href=\"./indexServlet?pag=0&tipo=Curiosidades\"\n");
      out.write("                       ");

                           if(tipo.equals("Curiosidades")){
                               out.println("id='selected'");
                           }
                       
      out.write("   \n");
      out.write("                       >Curiosidades</a></li>\n");
      out.write("                <li><a href=\"./indexServlet?pag=0&tipo=Creepypasta\"\n");
      out.write("                       ");

                           if(tipo.equals("Creepypasta")){
                               out.println("id='selected'");
                           }
                       
      out.write("\n");
      out.write("                       >Creepypastas</a></li>\n");
      out.write("                <li><a href=\"./indexServlet?pag=0&tipo=Easteregg\"\n");
      out.write("                       ");

                           if(tipo.equals("Easteregg")){
                               out.println("id='selected'");
                           }
                       
      out.write("\n");
      out.write("                       >Easter eggs</a></li>\n");
      out.write("                <li id=\"buscador\">\n");
      out.write("                    <form action=\"send\" method=\"get\" name=\"buscador\">\n");
      out.write("                        <div id=\"lupa\">\n");
      out.write("                            <img src=\"img/buscar.png\" alt=\"buscar\" width=30>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"buscar\">\n");
      out.write("                            <input name=\"buscador\" type=\"text\" placeholder=\"Buscar\">\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </li>\n");
      out.write("            </ul>\n");
      out.write("\n");
      out.write("        </div>\n");
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
