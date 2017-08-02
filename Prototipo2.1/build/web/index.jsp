<%-- 
    Document   : index

    Author     : Juan Carlos
    Author     : Patricia
    Author     : Andres
    Author     : Alberto
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Aporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        
       <%@include file="navbartop.jsp" %>
       
        <div>
            
            <ul>
                <li><a href="./indexServlet?pag=0&tipo=all" 
                       <%
                           String tipo = request.getParameter("tipo");
                           if(tipo == null){
                               tipo = "all";
                           }
                           if(tipo.equals("all")){
                                   out.println("id='selected'");
                               }
                           
                       %>
                       >Principal</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Teoria"
                       <%
                           if(tipo.equals("Teoria")){
                               out.println("id='selected'");
                           }
                       %>
                       >Teorías</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Curiosidades"
                       <%
                           if(tipo.equals("Curiosidades")){
                               out.println("id='selected'");
                           }
                       %>   
                       >Curiosidades</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Creepypasta"
                       <%
                           if(tipo.equals("Creepypasta")){
                               out.println("id='selected'");
                           }
                       %>
                       >Creepypastas</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Easteregg"
                       <%
                           if(tipo.equals("Easteregg")){
                               out.println("id='selected'");
                           }
                       %>
                       >Easter eggs</a></li>
                <li id="buscador">
                    <form action="send" method="get" name="buscador">
                        <div id="lupa">
                            <img src="img/buscar.png" alt="buscar" width=30>
                        </div>
                        <div id="buscar">
                            <input name="buscador" type="text" placeholder="Buscar">
                        </div>
                    </form>

                </li>
            </ul>

        </div>

        <div id="izda">
            <%
                int pag;
                

                if (request.getParameter("pag") == null) {
                    pag = 0;
                } else {
                    String variable = request.getParameter("pag");
                    pag = Integer.parseInt(variable);
                    if (pag < 0) {
                        pag = 0;
                    }
                }
                int npages;
                Aporte aporte;
                ArrayList<Aporte> aportes;
                aportes = (ArrayList<Aporte>) request.getSession().getAttribute("aportes");
                Aporte a[] = new Aporte[aportes.size()];
                aportes.toArray(a);
                npages = (a.length/10)+1;
                int size = 284;

                for (int i = 0 + 10 * pag; i < aportes.size() && i <= 9 + 10 * pag; i++) {
                    /*aporte = aportes.get(i);*/
                    aporte = a[i];

            %>
            <div id="parrafo">
                <hr></hr>
                <a href="./AporteServlet?id=<%out.print(aporte.getId());%>">
                    <img src="
                         <%
                             if(aporte.getImg() == null){
                                 out.println("img/default.png");
                             }else{
                                 out.println("img2/"+aporte.getImg());
                             }
                         %>
                         " alt="Ace" id="Imagen">
                </a>
                <a href="./AporteServlet?id=<%out.print(aporte.getId());%>"><span id="titulo"> <%out.println(aporte.getTitulo());%> </span></a>
                <p id="cuerpo">
                    <%
                        String temp = aporte.getCuerpo();
                        temp = temp.replaceAll("\n", " ");

                        if (aporte.getCuerpo().length() > size) {
                            out.println(temp.substring(0, size)+ "...");
                        } else {
                            out.println(temp);
                        }
                    %>
                </p>
            </div>
            <%
                }
            %>
            <%
                if(pag > 0){
            %>
            <div id="paginacion">
               
                <a href="./indexServlet?pag=<%
                    if (pag != 0) {
                        out.print(pag - 1);
                    } else {
                        out.print(pag);
                    }
                   %>&tipo=<%out.print(tipo);%>"><button id="pag_sig">Pagina Anterior</button></a>
            </div>
            <%
                }
                if(npages > pag+1){
            %>
            <div id="paginacion">
                <a href="./indexServlet?pag=<%out.print(pag + 1);%>&tipo=<%out.print(tipo);%>"><button id="pag_sig">Pagina Siguiente</button></a>
            </div>
            <%
                }
            %>
        </div>
        <div id="derecha">
            <a href="
               <%
                   if (request.getSession().getAttribute("User") != null) {
                       
                       out.println("enviar-aporte.jsp");
                   } else {
                       out.println("Iniciar_Sesion.jsp");
                   }
               %>
               ">
                <div id="subir_aporte">
                    <img src="img/nube.png" alt="nube" id="nube" width=70 height=70>
                    <p id="subir">Subir aporte<p>
                </div>
            </a>
            <div id="destacados">
                <h1>Aportes Destacados</h1>
                <div id="parrafo_destacado">
                    <hr></hr>
                    <a href="#Principal"><img src="img/JakAndDaxter.jpg" alt="JakAndDaxter" id="im_des"></a>
                    <a href="#Principal"><span id="titulo_des"> Curiosidades: Encuentran la batería número 101 </span></a>
                </div>
                <div id="parrafo_destacado">
                    <hr></hr>
                    <a href="#Principal"><img src="img/mario.jpg" alt="mario" id="im_des"></a>
                    <a href="#Principal"><span id="titulo_des"> Teoría: Super Mario Bros 3 es en realidad una obra de teatro </span></a>
                </div>
                <div id="parrafo_destacado">
                    <hr></hr>
                    <a href="#Principal"><img src="img/ratchet-clank.jpg" alt="ratchet-clank" id="im_des"></a>
                    <a href="#Principal"><span id="titulo_des"> Easter Egg: Cameos encontrados en Ratchet And Clank </span></a>
                </div>

            </div>
        </div>


    </body>
</html>
    
