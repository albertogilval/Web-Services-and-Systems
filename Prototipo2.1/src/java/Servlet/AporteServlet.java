/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Datos.AporteDB;
import Datos.ComentarioDB;
import Datos.EtiquetaDB;
import Datos.ValoracionDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Aporte;
import modelo.Comentario;
import modelo.Valoracion;

/**
 *
 * @author alberto
 */
public class AporteServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String nextPage = "ver-aporte.jsp";
        
        int id = Integer.parseInt(request.getParameter("id"));
        Aporte aporte = AporteDB.getAporteDB(id);
        request.getSession().setAttribute("aporte", aporte);
        
        ArrayList<String> etiquetas = EtiquetaDB.getEtiquetasAporte(aporte.getId());
        request.getSession().setAttribute("etiquetas", etiquetas);
        
        ArrayList<Comentario> comentarios; 
        comentarios = ComentarioDB.getComentarioDB(id);
        request.getSession().setAttribute("comentarios", comentarios);
        
        ArrayList<Valoracion> valoraciones = ValoracionDB.getValoracion(aporte.getId());
        request.getSession().setAttribute("valoraciones", valoraciones);
        
        
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
