/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Datos;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class ConnectionPool {
    
private static final String URL = "java:/comp/env/jdbc/pruebadb";
    
    private static ConnectionPool pool = null;
    
    private DataSource dataSource = null;
    
    public ConnectionPool(){
        try {
            InitialContext contextoInicial = new InitialContext();
            dataSource = (DataSource) contextoInicial.lookup(URL);
            
        } catch(Exception e) {
            throw new IllegalStateException("Base de datos no encontrada", e);
        }
    }
    /** 
     * @return la unica instancia posible de la Clase ConexionPool, en caso de
     * que no exista tambien se encarga de crearla
     */
    public static ConnectionPool getInstance() {
        if (pool == null) {
            pool = new ConnectionPool();
        }
        return pool;
    }
    
    /**
     * @return una conexion con la base de datos
     */
    public Connection getConnection() {
        try {
            return dataSource.getConnection();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
            return null;
        }
    }
    
    /**
     * Libera la conexión dada
     * 
     * @param c la conexion que queremos liberar
     */
    public void freeConnection(Connection c) {
        try {
            c.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    }
}