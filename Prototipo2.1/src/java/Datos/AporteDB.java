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
import modelo.Etiqueta;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class AporteDB {
 
    public static Aporte getAporteDB(int id){
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        PreparedStatement sentencia = null;
        ResultSet rs = null;
        Aporte aporte;
        
        String query = "SELECT * FROM Aporte "
                + "WHERE id = ?";
        
        try{
            
            sentencia = conexion.prepareStatement(query);
            sentencia.setInt(1, id);
            rs = sentencia.executeQuery();
            aporte = null;
            if (rs.next()){
                aporte = new Aporte();
                aporte.setId(rs.getInt("id"));
                aporte.setTitulo(rs.getString("titulo"));
                aporte.setCuerpo(rs.getString("cuerpo"));
                aporte.setTipo(rs.getString("tipo"));
                aporte.setAliasU(rs.getString("aliasU"));
                aporte.setImg(rs.getString("img"));
            }
            rs.close();
            sentencia.close();
            pool.freeConnection(conexion);
            return aporte;
            
        }catch(Exception e){
            
            e.printStackTrace();
            return null;
        }
    }
    public static ArrayList<Aporte> getAportesDB(){
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        PreparedStatement sentencia = null;
        ResultSet rs = null;
        

        Aporte aporte;
        
        String query = "SELECT * FROM Aporte ORDER BY id DESC";
        
        ArrayList<Aporte> aportes = new ArrayList<Aporte>();
        try{
            
            sentencia = conexion.prepareStatement(query);
            rs = sentencia.executeQuery();
            while (rs.next()){
                aporte = new Aporte();
                aporte.setId(rs.getInt("id"));
                aporte.setTitulo(rs.getString("titulo"));
                aporte.setCuerpo(rs.getString("cuerpo"));
                aporte.setTipo(rs.getString("tipo"));
                aporte.setAliasU(rs.getString("aliasU"));
                aporte.setImg(rs.getString("img"));
                
                aportes.add(aporte);
            }
            rs.close();
            sentencia.close();
            pool.freeConnection(conexion);
            return aportes;
            
        }catch(Exception e){
            
            e.printStackTrace();
            return null;
        }
    }
    
    public static ArrayList<Aporte> getAportesDB(String tipo){
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection conexion = pool.getConnection();
        PreparedStatement sentencia = null;
        ResultSet rs = null;
        

        Aporte aporte;
        
        String query = "SELECT * "
                + "FROM Aporte A "
                + "WHERE A.tipo = '"+tipo+"' "
                + "ORDER BY id DESC";
        
        ArrayList<Aporte> aportes = new ArrayList<Aporte>();
        try{
            
            sentencia = conexion.prepareStatement(query);
            rs = sentencia.executeQuery();
            while (rs.next()){
                aporte = new Aporte();
                aporte.setId(rs.getInt("id"));
                aporte.setTitulo(rs.getString("titulo"));
                aporte.setCuerpo(rs.getString("cuerpo"));
                aporte.setTipo(rs.getString("tipo"));
                aporte.setAliasU(rs.getString("aliasU"));
                aporte.setImg(rs.getString("img"));
                
                aportes.add(aporte);
            }
            rs.close();
            sentencia.close();
            pool.freeConnection(conexion);
            return aportes;
            
        }catch(Exception e){
            
            e.printStackTrace();
            return null;
        }
    }
    
    public static int getLastId(){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        
        String sql_query = "SELECT A.id"
                +" FROM aporte A"
                +" ORDER BY id DESC"
                +" LIMIT 1";
        int id = 0;
        try{
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            
            if(rs.next()){
                id = rs.getInt("id");
                pool.freeConnection(connection);
                rs.close();
                
            }
            return id;
        }catch(Exception e){
            return id;
        }
        
    }
    public static int createAporte(Aporte aporte){
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        PreparedStatement ps = null;
        
        String aliasU = aporte.getAliasU();
        String cuerpo=  aporte.getCuerpo();
            
        Date fecha = aporte.getFecha();
        int id =  aporte.getId();
        String tipo = aporte.getTipo();
        String titulo = aporte.getTitulo();
        String img = aporte.getImg();
        
        /*ArrayList<String> etiquetas =  aporte.getEtiquetas();*/
      
        /*String sql_query = "INSERT INTO"
                + " Aporte (titulo, cuerpo, fecha, tipo, aliasU)"
                + " VALUES (?,?,?,?,?)";*/
        String sql_query = "INSERT INTO"
                + " Aporte (titulo, cuerpo, fecha, tipo, aliasU, img)"
                + " VALUES (?,?,?,?,?,?)";

        try { 
            ps = connection.prepareStatement(sql_query);
            
            //ps.setInt(1, id);
            ps.setString(1, titulo);
            ps.setString(2, cuerpo);
            ps.setDate(3, (java.sql.Date) fecha);
            ps.setString(4, tipo);
            ps.setString(5, aliasU);
            ps.setString(6, img);
            

            int res = ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
            int i = getLastId();
            return i;
        }catch (SQLException e) {e.printStackTrace(); return 0;}
    
    }
    
    public static String getUserAporte(int id){
        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        
        String sql_query = "SELECT A.aliasU"
                +" FROM aporte A"
                +" WHERE A.id = '"+id+"' ";
        String aliasPropio= "";
        
        try{
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            
            if(rs.next()){
                aliasPropio = rs.getString("aliasU");
                pool.freeConnection(connection);
                rs.close();
                
            }
            return aliasPropio;
        }catch(Exception e){
            return null;
        } 
    }
}
