<%-- 
    Document   : Iniciar_Sesion

    Author     : Juan Carlos
    Author     : Patricia
    Author     : Andres
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Iniciar sesion</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
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
                           }else{
                               if(tipo.equals("all")){
                                   out.println("id='selected'");
                               }
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
        <div id="registro">
            <h1 id="inicia_sesion">Inicia Sesión</h1>
            <form  id="regform" method="post" action="IniciarSesionServlet">
                <div class="nombre">
                    <h3>Nombre de usuario: </h3>
                    <input  type="text"  name="nombre" id="nombre" value="" placeholder="Su nombre de usuario" maxlength="97"  aria-required="true" >
                </div>
                <div>
                    <h3 id="contrasenya">Contraseña: </h3>
                    <input  type="password"  name="passwd" id="passwd" value="" placeholder="Su contraseña" maxlength="97"  aria-required="true" >
                </div>
                <div id="olvido">
                    <a href="recuperar_contraseña.html">He olvidado mi contraseña</a>
                </div>
                <div id="boton">
                    <input id="submit-button" type="submit" value="Iniciar Sesión"></input>
                </div>
            </form>
        </div>
    </body>
</html>
