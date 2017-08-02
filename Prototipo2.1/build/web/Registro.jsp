<%-- 
    Document   : Registro

    Author     : Juan Carlos
    Author     : Patricia
    Author     : Andres
    Author     : Alberto
--%>

<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Registro</title>
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
        <div id="registro2">
            <h1 id="registrate">Regístrate</h1>
            <form  id="regform" method="post" action="RegistroServlet">
                <div>
                    <h3>Nombre de usuario: </h3>
                    <%
                        String existe = request.getParameter("existe");
                        if(existe != null){
                            out.println("<h4 style='color: red'>El nombre de usuario ya existe</h4>");
                        }
                    %>
                    <input  type="text"  name="user" value="" placeholder="Su nombre de usuario" maxlength="97"  required >
                </div>
                <div>
                    <h3>Correo electrónico: </h3>
                    <input  type="email"  name="email" value="" placeholder="Su dirección de correo electrónico" maxlength="97"  aria-required="true" >
                </div>
                <div>
                    <h3>Contraseña: </h3>
                    <%
                        String coinciden = request.getParameter("coinciden");
                        if(coinciden != null){
                            out.println("<h4 style='color: red'>Las contraseñas deben coincidir</h4>");
                        }
                        String longitud = request.getParameter("longitud");
                        if(longitud != null){
                            out.println("<h4 style='color: red'>La contraseña tiene que ser mayor que 4</h4>");
                        }
                    %>
                    <input type="password" autocomplete="off" name="password" placeholder="Su contraseña" maxlength="128"  aria-required="true">
                </div>
                <div>
                    <h3>Repita la contraseña: </h3>
                    <input type="password" autocomplete="off" name="password2" placeholder="Su contraseña" maxlength="128"  aria-required="true">
                </div>
                <div>
                    <h3>Seleccione fecha de nacimiento: </h3>

                    <select name="dd" aria-required="true">
                        <option value="" selected disabled>Día</option>
                        <%
                            for(int i=1;i<=31;i++){
                        %>
                        <option value="<%out.println(i);%>"><%out.println(i);%></option>
                        <%
                            }
                        %>
                        
                    </select>
                    <select name="mm" aria-required="true">
                        <option value="" selected disabled>Mes de nacimiento</option>
                        <option value="1">Enero</option>
                        <option value="2">Febrero</option>
                        <option value="3">Marzo</option>
                        <option value="4">Abril</option>
                        <option value="5">Mayo</option>
                        <option value="6">Junio</option>
                        <option value="7">Julio</option>
                        <option value="8">Agosto</option>
                        <option value="9">Septiembre</option>
                        <option value="10">Octubre</option>
                        <option value="11">Noviembre</option>
                        <option value="12">Diciembre</option>
                    </select>
                    <select name="yyyy" aria-required="true">
                        <option value="" selected disabled>Año</option>
                        <%
                            int year = Calendar.getInstance().get(Calendar.YEAR);
                            for(int j=year;j>=year-100;j--){
                        %>
                        <option value="<%out.println(j);%>"><%out.println(j);%></option>
                        <%
                            }
                        %>
                       
                    </select>
                </div>

                <div>
                    <h3>Seleccione género: </h3>
                    <select name="gendero" aria-required="false">
                        <option value="" selected disabled>Sexo</option>
                        <option value="1">Hombre</option>
                        <option value="2">Mujer</option>
                        <option value="3">No especificar</option>
                    </select>
                </div>
                <div id="checkbox">
                    <%
                        String condiciones = request.getParameter("condiciones");
                        if(condiciones != null){
                            out.println("<h4 style='color: red'>Debe aceptar los terminos y condicinoes</h4>");
                        }
                    %>
                    <input type="checkbox" name="condiciones" value="condiciones">He <a href="condiciones.jsp">leído</a> y acepto los términos y condiciones de uso.
                </div>
                <div id="boton">
                    <input type="submit" value="Registrarse"></input>
                </div>


            </form>
        </div>

    </body>
</html>

