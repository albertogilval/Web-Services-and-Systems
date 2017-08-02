<%-- 
    Document   : enviar-aporte

    Author     : Juan Carlos
    Author     : Patricia
    Author     : Andres
    Author     : Alberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <div id=aporte>
            <form method="post" action="addServlet" enctype="multipart/form-data">
                <h1 id="enviar_aporte">Enviar aporte:</h1>
                <h2 class="formulario">Título: <input name="titulo" aria-required="true" placeholder="título de su aporte..."> </h2>
                <h2 class="formulario">Categoría:<select name="categoria" aria-required="true" id="tipoTema">
                        <!--<option value="" selected disabled>Categoria</option>-->
                        <option>Teoria</option>
                        <option>Creepypasta</option>
                        <option>Curiosidades</option>
                        <option>Easteregg</option>
                    </select>
                </h2>
                <h2 class="formulario">Etiquetas: <input name="etiquetas" aria-required="true" placeholder="etiqueta1; etiqueta2; etiqueta3;..."> </h2>
                <h2 class="formulario">Imagen: <input type="file" id="subir_imagen" name="pic" accept="image/*" aria-required="true"> </h2>
                <h2 class="formulario">Descripción:<textarea name="descripcion" rows="5"cols="20" placeholder="contenido de su aporte..." aria-required="true"></textarea> </h2>
                
                <p><input type="submit" value="Enviar aporte" id="submit"></p>
            </form>
        </div>
    </body>
</html>
