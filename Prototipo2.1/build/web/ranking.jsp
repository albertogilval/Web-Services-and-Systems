<%-- 
    Document   : ranking
    Created on : 22-may-2017, 4:21:57
    Author     : alberto
--%>

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
        <div id="ranking">
            <table id="ranking_table">
                <thead>
                <th class="posicion">Posicion</th>
                <th colspan="2">Usuario</th>
                <th>Puntos</th>
                <th>Logros</th>
                </thead>
                <tbody>
                    <tr class="podio">
                        <td class="posicion">1</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario" id="gold"></td>
                        <td class="usuario">I like trains</td>
                        <td class="puntos">1264</td>
                        <td class="logros">20</td>
                    </tr>
                    <tr class="podio">
                        <td class="posicion">2</td>
                        <td class="img_ranking"><img src="img/usuario2.png" alt="usuario2" class="img_usuario" id="silver"></td>
                        <td class="usuario">beep beep I'm a sheep</td>
                        <td class="puntos">1064</td>
                        <td class="logros">15</td>
                    </tr>
                    <tr class="podio">
                        <td class="posicion">3</td>
                        <td class="img_ranking"><img src="img/usuario2.png" alt="usuario2" class="img_usuario" id="bronze"></td>
                        <td class="usuario">everybody do the flop</td>
                        <td class="puntos">1024</td>
                        <td class="logros">13</td>
                    </tr>
                    <tr>
                        <td class="posicion">4</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">mineturtle, hello!</td>
                        <td class="puntos">856</td>
                        <td class="logros">13</td>
                    </tr>
                    <tr>
                        <td class="posicion">5</td>
                        <td class="img_ranking"><img src="img/usuario2.png" alt="usuario2" class="img_usuario"></td>
                        <td class="usuario">Look out he got a nose</td>
                        <td class="puntos">508</td>
                        <td class="logros">9</td>
                    </tr>
                    <tr>
                        <td class="posicion">6</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">The orb</td>
                        <td class="puntos">365</td>
                        <td class="logros">5</td>
                    </tr>
                    <tr>
                        <td class="posicion">7</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">keep calm and throw cheese</td>
                        <td class="puntos">325</td>
                        <td class="logros">5</td>
                    </tr>
                    <tr>
                        <td class="posicion">8</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">meow meow I'm a cow</td>
                        <td class="puntos">312</td>
                        <td class="logros">4</td>
                    </tr>
                    <tr>
                        <td class="posicion">9</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">asdf movies</td>
                        <td class="puntos">253</td>
                        <td class="logros">4</td>
                    </tr>
                    <tr>
                        <td class="posicion">10</td>
                        <td class="img_ranking"><img src="img/usuario1.jpg" alt="usuario1" class="img_usuario"></td>
                        <td class="usuario">I'm gonna do the internet</td>
                        <td class="puntos">50</td>
                        <td class="logros">1</td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</body>
</html>
