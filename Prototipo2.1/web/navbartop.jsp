<!DOCTYPE html>
<%-- 
    Document   : navbartop
    Created on : 30-abr-2017, 11:11:29
    Author     : Juan Carlos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="img-top">
    <img src="img/tortuga.png" alt="tortuga" width=200 id="tortuga">
    <img src="img/3D-turtle.png" alt="titulo">
    <%
        if (request.getSession().getAttribute("User") != null) {
    %>
    <div id="sesionC">
        <a href="VerPerfilServlet">
            <div id="sesion">
                Perfil
            </div>
        </a>
        <a href="CerrarSesionServlet">
            <div id="sesion">
                Cerrar Sesion
            </div>
        </a>
    </div>
    <%
    } else {
    %>
    <div id="sesionC">
        <a href="Registro.jsp">
            <div id="sesion">
                Registrate
            </div>
        </a>
        <a href="Iniciar_Sesion.jsp">
            <div id="sesion">
                Inicia Sesion
            </div>
        </a>
    </div>
    <%
    }
    %>
</div>
