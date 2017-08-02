/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import modelo.Usuario;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class UsuarioBD {
   /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

    public static Usuario obtenerUsuario(String aliasPropio, String contrasenya) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query = "SELECT * "
                + "FROM Usuario U "
                + "WHERE U.aliasPropio='"+aliasPropio+"' "
                + "AND U.contrasenya='"+contrasenya+"'";
        String nombre;
        String apellidos;   
        String foto;
        String correo;
        int sexo;
        String lugar;
        boolean moderador;
        
        try {
            Usuario user = new Usuario();
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            if (rs.next()) {
                    
                nombre = rs.getString("nombre");
                apellidos = rs.getString("apellidos");
                foto = rs.getString("foto");
                sexo = rs.getInt("sexo");
                correo = rs.getString("correo");
                moderador = rs.getBoolean("moderador");
                lugar = rs.getString("lugar");
                
                              
                user.setAliasPropio(aliasPropio);
                user.setNombre(nombre);
                user.setApellidos(apellidos);
                user.setFoto(foto);
                user.setSexo(sexo);
                user.setCorreo(correo);
                user.setModerador(moderador);
                user.setNombre(nombre);
                user.setContrasenya(contrasenya);
                user.setLugar(lugar);

                
                pool.freeConnection(connection);
                rs.close();
                
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        
    }
    public static boolean exist(String aliasPropio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query = "SELECT * "
                + "FROM Usuario U "
                + "WHERE U.aliasPropio='"+aliasPropio+"' ";
        String nombre = null;
        
        try {
            Usuario user = new Usuario();
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            if (rs.next()) {
                    
                nombre = rs.getString("nombre");

                
                pool.freeConnection(connection);
                rs.close();
                
            }
            if(nombre == null){
                return false;
            }
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        
    }
    
    public static void registrarUsuario (Usuario usuario) {
        // Comentario para que pueda subirlo a bitbucket.
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query;
        sql_query = "INSERT INTO Usuario"
                + " VALUES (?,?,?,NULL,?,?,?,?,NULL)";
        PreparedStatement ps = null;
        
        try {
            ps = connection.prepareStatement(sql_query);
            ps.setString(1, usuario.getAliasPropio());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApellidos());
            ps.setInt(4, usuario.getSexo());
            ps.setString(5, usuario.getContrasenya());
            ps.setString(6, usuario.getCorreo());
            ps.setInt(7, 0);
            
            ps.executeUpdate();
            ps.close();
            pool.freeConnection(connection);
        }catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public static void actualizarUsuario(Usuario u) {
        //TODO cuidado nombres repetidos        
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query = "UPDATE USUARIO U"
                + " SET U.aliasPropio='"+u.getAliasPropio()+"', U.contrasenya="+u.getContrasenya()+
                ", U.foto="+u.getFoto()+"'";
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
    
    public static Usuario obtenerUsuarioNombre(String aliasPropio) {
        ConnectionPool pool = ConnectionPool.getInstance();
        Connection connection = pool.getConnection();
        String sql_query = "SELECT * "
                + "FROM Usuario U "
                + "WHERE U.aliasPropio='"+aliasPropio+"' ";
                
        String nombre;
        String apellidos; 
        String contrasenya;
        String foto;
        String correo;
        String lugar;
        int sexo;
        boolean moderador;
        
        try {
            Usuario user = new Usuario();
            Statement statement = connection.createStatement(); 
            ResultSet rs = statement.executeQuery(sql_query);
            if (rs.next()) {
                    
                nombre = rs.getString("nombre");
                apellidos = rs.getString("apellidos");
                contrasenya = rs.getString("contrasenya");
                foto = rs.getString("foto");
                sexo = rs.getInt("sexo");
                correo = rs.getString("correo");
                lugar = rs.getString("lugar");
                moderador = rs.getBoolean("moderador");
                              
                user.setAliasPropio(aliasPropio);
                user.setNombre(nombre);
                user.setApellidos(apellidos);
                user.setFoto(foto);
                user.setSexo(sexo);
                user.setCorreo(correo);
                user.setModerador(moderador);
                user.setNombre(nombre);
                user.setContrasenya(contrasenya);
                user.setLugar(lugar);

                
                pool.freeConnection(connection);
                rs.close();
                
            }
            return user;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        
    }

}  


