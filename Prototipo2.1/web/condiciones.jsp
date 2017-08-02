<%-- 
    Document   : condiciones
    Created on : 18-may-2017, 13:30:29
    Author     : patri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>condiciones</title>
        <link rel="stylesheet" type="text/css" href="style.css" />
    </head>
    <body>
        <div>
         <%@include file="navbartop.jsp" %>
        </div>
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
	<div id="contenido_terminos"><!-main->
			<h1>Términos y condiciones de uso</h1>
			<p><strong>1. Introducción</strong></p>
			<p>Las presentes condiciones generales de uso de la página web, regulan los términos y condiciones de acceso y uso de www.3d-turtle.com, propiedad de 3-D Turtle S.A., con domicilio en c/ falsa, 123, Valladolid, España y con Código de Identificación Fiscal número 1343656idf, en adelante, 3-D Turtle S.A., que el usuario del Portal deberá de leer y aceptar para usar todos los servicios e información que se facilitan desde el portal. El mero acceso y/o utilización del portal, de todos o parte de sus contenidos y/o servicios significa la plena aceptación de las presentes condiciones generales de uso.
			</p>
			<p><strong>2. Condiciones de uso</strong></p>
			<p>Las presentes condiciones generales de uso del portal regulan el acceso y la utilización del portal, incluyendo los contenidos y los servicios puestos a disposición de los usuarios en y/o a través del portal, bien por el portal, bien por sus usuarios, bien por terceros. No obstante, el acceso y la utilización de ciertos contenidos y/o servicios puede encontrarse sometido a determinadas condiciones específicas.
			</p>
			<p><strong>3. Modificaciones</strong></p>
			<p>La empresa se reserva la facultad de modificar en cualquier momento las condiciones generales de uso del portal. En todo caso, se recomienda que consulte periódicamente los presentes términos de uso del portal, ya que pueden ser modificados.
			</p>
			<p><strong>4. Obligaciones del usuario</strong></p>
			<p>El usuario deberá respetar en todo momento los términos y condiciones establecidos en las presentes condiciones generales de uso del portal. De forma expresa el usuario manifiesta que utilizará el portal de forma diligente y asumiendo cualquier responsabilidad que pudiera derivarse del incumplimiento de las normas.
			</p>
			<p>Así mismo, el usuario no podrá utilizar el portal para transmitir, almacenar, divulgar promover o distribuir datos o contenidos que sean portadores de virus o cualquier otro código informático, archivos o programas diseñados para interrumpir, destruir o perjudicar el funcionamiento de cualquier programa o equipo informático o de telecomunicaciones.
			</p>
			<p><strong>5. Responsabilidad del portal</strong></p>
			<p>El usuario conoce y acepta que el portal no otorga ninguna garantía de cualquier naturaleza, ya sea expresa o implícita, sobre los datos, contenidos, información y servicios que se incorporan y ofrecen desde el Portal.
			</p>
			<p>Exceptuando los casos que la Ley imponga expresamente lo contrario, y exclusivamente con la medida y extensión en que lo imponga, el Portal no garantiza ni asume responsabilidad alguna respecto a los posibles daños y perjuicios causados por el uso y utilización de la información, datos y servicios del Portal.
			</p>
			<p>En todo caso, el Portal excluye cualquier responsabilidad por los daños y perjuicios que puedan deberse a la información y/o servicios prestados o suministrados por terceros diferentes de la Empresa. Toda responsabilidad será del tercero ya sea proveedor o colaborador.
			</p>
			<p><strong>6. Propiedad intelectual e industrial</strong></p>
			<p>Todos los contenidos, marcas, logos, dibujos, documentación, programas informáticos o cualquier otro elemento susceptible de protección por la legislación de propiedad intelectual o industrial, que sean accesibles en el portal corresponden exclusivamente a la empresa o a sus legítimos titulares y quedan expresamente reservados todos los derechos sobre los mismos. Queda expresamente prohibida la creación de enlaces de hipertexto (links) a cualquier elemento integrante de las páginas web del Portal sin la autorización de la empresa, siempre que no sean a una página web del Portal que no requiera identificación o autenticación para su acceso, o el mismo esté restringido.
			</p>
			<p>En cualquier caso, el portal se reserva todos los derechos sobre los contenidos, información datos y servicios que ostente sobre los mismos. El portal no concede ninguna licencia o autorización de uso al usuario sobre sus contenidos, datos o servicios, distinta de la que expresamente se detalle en las presentes condiciones generales de uso del portal.
			</p>
			<p><strong>7. Legislación aplicable, jurisdicción competente y notificaciones</strong></p>
			<p>Las presentes condiciones se rigen y se interpretan de acuerdo con las Leyes de España. Para cualquier reclamación serán competentes los juzgados y tribunales de (indicar la ciudad). Todas las notificaciones, requerimientos, peticiones y otras comunicaciones que el Usuario desee efectuar a la Empresa titular del Portal deberán realizarse por escrito y se entenderá que han sido correctamente realizadas cuando hayan sido recibidas en la siguiente dirección (indicar dirección de correo en la que se desean recibir las notificaciones).
			</p>
	</div>
    </body>
</html>
