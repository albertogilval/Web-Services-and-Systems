/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Datos.UsuarioBD;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
@WebServlet(name = "RegistroServlet", urlPatterns = {"/RegistroServlet"})
public class RegistroServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("user");
        String email = request.getParameter("email");
        String contrasenya = request.getParameter("password");
        String contrasenya2 = request.getParameter("password2");
        String condiciones = request.getParameter("condiciones");
        String nextPage;
        
        HttpSession sesion = request.getSession();
        if(UsuarioBD.exist(user)) {
            nextPage = "Registro.jsp?existe=true";
        }else if(user.contains(" ")){
            nextPage = "Registro.jsp?espacios=true";
        }else if(!contrasenya.equals(contrasenya2)){
            nextPage = "Registro.jsp?coinciden=true";
        }else if(contrasenya.length() < 4){
            nextPage = "Registro.jsp?longitud=true";
        }else if(condiciones == null){
            nextPage = "Registro.jsp?condiciones=true";
            System.out.println(">><<");
        }else{
            Usuario usuario = new Usuario ();
            usuario.setAliasPropio(user);
            usuario.setContrasenya(contrasenya);
            usuario.setCorreo(email);
            UsuarioBD.registrarUsuario(usuario);
            sesion.setAttribute("User", usuario);
            nextPage = "./indexServlet";
            
        }
        
            System.out.println(">>"+condiciones);
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
            dispatcher.forward(request, response);
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
