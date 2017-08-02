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
import modelo.Comentario;
import modelo.Valoracion;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class ValoracionDB {
    public static ArrayList<Valoracion> getValoracion(int id){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        PreparedStatement sentencia = null;
        ResultSet rs = null;
        

        Valoracion valoracion;
        
        String query = "SELECT * "
                + "FROM Valoracion V "
                + "WHERE V.idA = '"+id+"' ";
        
        ArrayList<Valoracion> valoraciones = new ArrayList<Valoracion>();
        try{
            sentencia = conexion.prepareStatement(query);
            rs = sentencia.executeQuery();
            while (rs.next()){
                valoracion = new Valoracion();
                valoracion.setValoracion(rs.getInt("valoracion"));

                valoraciones.add(valoracion);
            }
            rs.close();
            sentencia.close();
            pool.freeConnection(conexion);
            return valoraciones;
        }catch(Exception e){
            
            e.printStackTrace();
            return null;
        }
    }
    public static void anadirPunto(Valoracion valoracion){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query;
        sql_query = "INSERT INTO"
                + " Valoracion (aliasU, idA,valoracion)"
                + " VALUES (?,?,?)";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql_query);
            ps.setString(1, valoracion.getAliasU());
            ps.setInt(2, valoracion.getIdA());
            ps.setInt(3, valoracion.getValoracion());
            ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static boolean existe(Valoracion valoracion){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        ResultSet rs = null;
        
        String query = "SELECT * "
                + "FROM Valoracion V "
                + "WHERE V.idA = '"+valoracion.getIdA()+"' "
                + "AND V.aliasU = '"+valoracion.getAliasU()+"' ";
        int valor = 9;
        try{
            Statement statement = conexion.createStatement();
            rs = statement.executeQuery(query);
            if (rs.next()) {
                    
                valor = rs.getInt("valoracion");

                
                pool.freeConnection(conexion);
                rs.close();
                
            }
            if(valor == 9){
                return false;
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } 
    }
    public static void update(Valoracion valoracion){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        ResultSet rs = null;
        String sql_query = 
                "UPDATE Valoracion V "
                + "SET V.valoracion=' "
                + valoracion.getValoracion()+"' "
                + "WHERE V.idA = '"+valoracion.getIdA()+"' "
                + "AND V.aliasU = '"+valoracion.getAliasU()+"' ";
        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(sql_query);
            ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        }catch (SQLException e) {
            e.printStackTrace();
        }  
    }
        public static ArrayList<Valoracion> getValoracionUsuario(String alias){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        PreparedStatement sentencia = null;
        ResultSet rs = null;
        

        Valoracion valoracion;
        
        String query = "SELECT * "
                + "FROM Valoracion V "
                + "WHERE V.aliasU = '"+alias+"' ";
        
        ArrayList<Valoracion> valoraciones = new ArrayList<Valoracion>();
        try{
            sentencia = conexion.prepareStatement(query);
            rs = sentencia.executeQuery();
            while (rs.next()){
                valoracion = new Valoracion();
                valoracion.setValoracion(rs.getInt("valoracion"));

                valoraciones.add(valoracion);
            }
            rs.close();
            sentencia.close();
            pool.freeConnection(conexion);
            return valoraciones;
        }catch(Exception e){
            
            e.printStackTrace();
            return null;
        }
    }
}
