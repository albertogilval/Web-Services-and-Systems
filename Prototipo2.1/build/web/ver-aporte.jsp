<%-- 
    Document   : ver-aporte

    Author     : Juan Carlos
    Author     : Patricia
    Author     : Andres
    Author     : Alberto
--%>
<%@page import="modelo.Comentario"%>
<%@page import="modelo.Valoracion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Aporte"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Ver aporte</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <%@include file="navbartop.jsp" %>
        <div>
            
            <ul>
                <li><a href="./indexServlet?pag=0&tipo=all" 
                       <%
                           String tipo = (String) request.getSession().getAttribute("tipo");
                           if(tipo == null){
                               out.println("id='selected'");
                               tipo = "all";
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
        <div id="contenido"><!--main-->
            <%
                int id = Integer.parseInt(request.getParameter("id"));
                Aporte aporte = (Aporte) request.getSession().getAttribute("aporte");
            %>
            <h1><%out.println(aporte.getTitulo());%></h1>
            <a href="./VerPerfilServlet?AliasU=<%out.println(aporte.getUser(aporte.getId()));%>" >
            <h3><%out.println(aporte.getUser(aporte.getId()));%></h3>
            </a>
            <img src="
                 <%
                    if(aporte.getImg() == null){
                        out.println("img/default.png");
                    }else{
                        out.println("img2/"+aporte.getImg());
                    }
                 %>
                 " id="main-image">
            <p id="cuerpo">
                <%
                    out.println(aporte.getCuerpo());
                %>
            </p>
            <div class="tag" id="mainTag">Etiquetas:</div>
            <%
                ArrayList<String> etiquetas = (ArrayList<String>) request.getSession().getAttribute("etiquetas");

                for(String etiqueta : etiquetas){
            %>
                    <div class="tag"><%out.println(etiqueta);%></div>
            <%
                }
            %>
            
            <br>
            <br>
            <p style="margin-left:30px">
                <%
                    ArrayList<Valoracion> valoraciones = (ArrayList<Valoracion>) request.getSession().getAttribute("valoraciones");
                    int puntuacion = 0;
                    for(Valoracion valoracion: valoraciones){
                        puntuacion+=valoracion.getValoracion();
                    }
                    out.println(puntuacion);
                    request.getSession().setAttribute("idA", id);
                %>
                puntos</p>

            <a href="VariarPuntuacionServlet?idA=<%out.println(request.getParameter("id")); %>&punto=1" data-toggle="tooltip" title="+1" > <img   src="img/puntuacion-mas.png" alt="mas" class="puntuacion"></a>
            <a href="VariarPuntuacionServlet?idA=<%out.println(request.getParameter("id")); %>&punto=-1" data-toggle="tooltip" title="-1" > <img   src="img/puntuacion-menos.png" alt="menos" class="puntuacion"></a>
            
            <div id="bocadillo">
                <img src="img/comentario.jpg" height=27>
                <%
                    ArrayList<Comentario> comentarios; 
                    comentarios = (ArrayList<Comentario>) request.getSession().getAttribute("comentarios");
                    if(comentarios == null){
                        out.println(0);
                    }else{
                        out.println(comentarios.size());
                    }
                %>
            </div>
            <img src="img/favorito.png" alt="favorito" id="favorito">
            <img src="img/twitter.png" alt="twitter" class="compartir">
            <img src="img/facebook.jpg" alt="twitter" class="compartir">
            <br>
            <br>
            <br>
            Comentarios:
            <div>
                <form action="anadirComentario" method="post" name="comment">
                    <textarea name="comm" type="textarea" rows="50" cols="20" placeholder="Comenta el aporte"></textarea>
                    <br>
                    <input type="submit" value="Enviar comentario" id="submit">
                </form>
            </div>
            <%
                
                if(comentarios != null){
                    for(int j= 0;j<comentarios.size();j++){
                %>
            <div class="comentario">
                <img src="img/usuario2.png" alt="usuario2" class="perfil_usuario">
                <h3><a href="./VerPerfilServlet?AliasU=<%out.println(comentarios.get(j).getIdU());%>" ><% out.println(comentarios.get(j).getIdU());%></a></h3>
                <p><% out.println(comentarios.get(j).getCuerpo());   %></p>
                <img src="img/puntuacion-mas.png" alt="mas" class="puntuacion-comentario">
                <img src="img/puntuacion-menos.png" alt="mas" class="puntuacion-comentario">
            </div>
                <% 
                    }
                }else{
                    System.out.println("lasjdifhg");
                }
                    %>
        </div>
        <div id="derecha_ver">
            
            <a href="
               <%
                   if (request.getSession().getAttribute("User") != null) {
                       
                       out.println("enviar-aporte.jsp");
                   } else {
                       out.println("Iniciar_Sesion.jsp");
                   }
               %>
               ">
                <div id="enviar">
                    <img src="img/nube.png" alt="nube" id="nube" width=70 height=70>
                    <p id="subir">Subir aporte<p>
                </div>
            </a>
            <div class="destacados"><!-enviar aporete->
                <h1 id="aportes-destacados">Aportes destacados:</h1>
                <div>
                    <hr></hr>
                    <a href="#Principal"><img src="img/JakAndDaxter.jpg" alt="JakAndDaxter" class="imagen-destacados"></a>
                    <a href="#Principal"><span id="titulo_des"> Curiosidades: Encuentran la batería número 101 </span></a>
                </div>
                <div>
                    <hr></hr>
                    <a href="#Principal"><img src="img/mario.jpg" alt="mario" class="imagen-destacados"></a>
                    <a href="#Principal"><span id="titulo_des"> Teoría: Super Mario Bros 3 es en realidad una obra de teatro </span></a>
                </div>
            </div>
        </div>
    </body>
</html>
