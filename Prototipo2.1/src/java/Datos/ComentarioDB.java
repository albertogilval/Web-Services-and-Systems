/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import modelo.Aporte;
import modelo.Comentario;
import modelo.Etiqueta;
import modelo.Usuario;

/**
 *
 * @author Andres
 */
public class ComentarioDB {
    
    public static ArrayList<Comentario> getComentarioDB(int idComent){
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        Comentario comentario;
        
        String query = "SELECT * FROM Comentario C"
                + " WHERE C.idA = ?"
                + " ORDER BY C.id DESC";
        
            int id;
            int idA;   
            String idU;
            String cuerpo;
            Date fecha;  
            ArrayList<Comentario> comentarios= new ArrayList<Comentario>();
        try{
            
            PreparedStatement statement = connection.prepareStatement(query); 
            statement.setInt(1, idComent);
            ResultSet rs = statement.executeQuery();
            while (rs.next()){
                comentario = new Comentario();
                id = rs.getInt("id");
                idA = rs.getInt("idA");
                idU = rs.getString("idU");
                cuerpo = rs.getString("cuerpo");
                //fecha = rs.getDate("fecha");
            
                comentario.setId(id);
                comentario.setIdA(idA);
                comentario.setIdU(idU);
                comentario.setCuerpo(cuerpo);
                //comentario.setFecha(fecha);
                comentarios.add(comentario);
                
                            }
                statement.close();
                pool.freeConnection(connection);
                rs.close();
            return comentarios;
        }catch(SQLException e){
            
            e.printStackTrace();
            return null;
        }
    }
        
        public static void registrarComentario (Comentario comentario) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query;
        sql_query = "INSERT INTO"
                + " Comentario (idA, cuerpo, fecha, idU)"
                + " VALUES (?,?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql_query);
            ps.setInt(1, comentario.getIdA());
            ps.setString(2, comentario.getCuerpo());
            ps.setDate(3, (java.sql.Date)comentario.getFecha());
            ps.setString(4, comentario.getIdU());
            
            ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        
        
    }
}
