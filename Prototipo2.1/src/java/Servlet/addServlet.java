/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Datos.AporteDB;
import Datos.EtiquetaDB;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
import modelo.Aporte;
import modelo.Etiqueta;
import modelo.Usuario;
/*
import java.io.File;
import java.util.List;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
*/

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
@WebServlet(name = "addServlet", urlPatterns = {"/addServlet"})
@MultipartConfig
public class addServlet extends HttpServlet {

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
        String path = getServletContext().getRealPath("/img2");
        //try (PrintWriter out = response.getWriter()) {
            
            Part filePart = request.getPart("pic");
            String fileName = (String) getFileName(filePart);
            System.out.println(fileName);
            //String fileName = "id"+;
            InputStream fileContent = filePart.getInputStream();
            OutputStream outFile = null;
            
            try {
                outFile = new FileOutputStream(new File(path + File.separator + fileName));
                System.out.println(path + File.separator + fileName);
                int read = 0;
                byte[] bytes = new byte[1024];
                while ((read = fileContent.read(bytes)) != -1) {
                    outFile.write(bytes, 0, read);
                }
                //out.println("Fichero " + fileName + " creado");
            } catch (FileNotFoundException fne) {
                //out.println("Error al subir el fichero:");
                //out.println("<br/>" + fne.getMessage());
            } finally {
                if (outFile != null) {
                    outFile.close();
                }
                if (fileContent != null) {
                    fileContent.close();
                }
                /*if (out != null) {
                    out.println("</body></html>");
                    out.close();
                }*/
            }
            Aporte aporte = new Aporte();
            aporte.setId(1);
            String[] titulo = request.getParameterValues("titulo");
            aporte.setTitulo(titulo[0]);
            String[] cuerpo = request.getParameterValues("descripcion");
            aporte.setCuerpo(cuerpo[0]);
            String[] categoria = request.getParameterValues("categoria");
            aporte.setTipo(categoria[0]);
            Usuario user = (Usuario) request.getSession().getAttribute("User");
            aporte.setAliasU(user.getAliasPropio());
            aporte.setImg(fileName);
            
            String[] temp = request.getParameterValues("etiquetas");
            String[] etiquetas = temp[0].split(";");
            
            Etiqueta etiqueta;
            
            int i = AporteDB.createAporte(aporte);
            for(int j = 0;j<etiquetas.length;j++){
                etiqueta  = new Etiqueta();
                etiqueta.setCuerpo(etiquetas[j]);
                
                EtiquetaDB.createEtiqueta(etiqueta, i);
            }
            /*
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet addServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>¡Aporte Enviado!</h1>");
            out.println("<a href=index.jsp>Continuar</a>");
            out.println("</body>");
            out.println("</html>");
            
        }catch(Exception e){
            System.out.println(e);
           System.out.println("error"+e.getMessage());
        }*/
        String nextPage = "./AporteServlet?id="+i;
        
        RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);
    }
    private static String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"","");
                return fileName.substring(fileName.lastIndexOf('/')
                        + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
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
        
        String nextPage = "index.jsp";
        
        
        
        
        
        
        
        
        
        
        
        processRequest(request, response);
        /*RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
        dispatcher.forward(request, response);*/
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
