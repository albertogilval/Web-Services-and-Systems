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
import modelo.Etiqueta;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class EtiquetaDB {

    public static int createEtiqueta(Etiqueta etiqueta, int idA) {

        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        
        PreparedStatement ps = null;
        
        String cuerpo = etiqueta.getCuerpo();
        Date fecha = etiqueta.getFecha();
        
        String query = "INSERT INTO "
                + "Etiqueta(idA, cuerpo) "
                + "VALUES (?,?)";
        
        try{
            ps = connection.prepareStatement(query);
            ps.setInt(1, idA);
            ps.setString(2, cuerpo);
            
            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            return res;
            
        }catch(SQLException e){
            
            e.printStackTrace();
            return 0;
        }
    }
    public static ArrayList<String> getEtiquetasAporte(int id) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query = "SELECT * FROM Etiqueta E WHERE E.idA='"+id+"'";   
        
        ArrayList<String> etiquetas = new ArrayList<>();
        try {
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            while (rs.next()) {
                etiquetas.add(rs.getString("cuerpo"));
            }
            pool.freeConnection(connection);
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        return etiquetas;
    }
}
