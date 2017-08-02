<%-- 
    Document   : Perfil
    Created on : 21-may-2017, 13:02:33
    Author     : Andres
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Valoracion"%>
<%@page import="Datos.UsuarioBD"%>
<%@page import="modelo.Usuario"%>
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

                       >Principal</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Teoria"

                       >Teorías</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Curiosidades"

                       >Curiosidades</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Creepypasta"

                       >Creepypastas</a></li>
                <li><a href="./indexServlet?pag=0&tipo=Easteregg"

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
        <%            Usuario usuario = (Usuario) request.getAttribute("usuario");


        %>
        <div>
            <div id="nom_img_perfil">
                <img src="img/profile.png" alt="perfil" id="perfil">
                <h1 style="margin-top:110px;">
                    <%  out.println(usuario.getAliasPropio());%><br>
                    <%  out.println(usuario.getLugar()); %>
                </h1>
            </div>
            <div id="punt_rank">
                <div id="puntuacion">
                    <p>
                        Puntos
                    </p>
                    <p id = "puntos">
                        <%

                            ArrayList<Valoracion> valoraciones = (ArrayList<Valoracion>) request.getSession().getAttribute("valoraciones");
                            int puntuacion = 0;
                            for (Valoracion valoracion : valoraciones) {
                                puntuacion += valoracion.getValoracion();
                            }
                            out.println(puntuacion);

                        %>
                    </p>
                </div>
                <a href="ranking.jsp">
                    <div class="rank">
                        <p>
                            Ranking
                        </p>
                        <p class="rank">
                            407º
                        </p>
                    </div>
                </a>
            </div>
        </div>
        <div id="datosPerfil">
            <div id="encabezadoPerfil">
                <ul id = "navPerfil">
                    <li class="perfil" id="selected"><a href="VerPerfilServlet">Feed</a></li>
                    <li class="perfil"><a href="VerPerfilServlet?AliasU=<%  out.println(usuario.getAliasPropio());%>">Aportes</a></li>
                    <li class="perfil"><a href="VerPerfilServlet?AliasU=<%  out.println(usuario.getAliasPropio());%>">Logros</a></li>
                    <li class="perfil"><a href="VerPerfilServlet?AliasU=<%  out.println(usuario.getAliasPropio());%>">Favoritos</a></li>
                    <li class="perfil"><a href="VerPerfilServlet?AliasU=<%  out.println(usuario.getAliasPropio());%>">Seguidos</a></li>
                    <li class="perfil"><a href="VerPerfilServlet?AliasU=<%  out.println(usuario.getAliasPropio());%>">Ajustes</a></li>
                </ul>
            </div>
            <br>
            <div id="contenidoPerfil">
                <div class="feed">
                    <img src="img/logro.png" alt="logro" class="img_feed">
                    <div class="meh">
                        <p>
                            Logro "Curioso" desbloqueado
                        </p>
                    </div>
                </div>
                <div class="feed">
                    <img src="img/comentario.png" alt="logro" class="img_feed">
                    <div class="meh">
                        <p>
                            Calimero comentó en tu aporte "Carnaval lolero 2017"
                        </p>
                    </div>
                </div>
                <div class="feed">
                    <img src="img/logro.png" alt="logro" class="img_feed">
                    <div class="meh">
                        <p>Logro "Aventurero" desbloqueado	</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
