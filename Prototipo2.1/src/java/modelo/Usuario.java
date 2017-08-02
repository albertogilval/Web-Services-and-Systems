/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author Juan Carlos
 * @author Patricia
 * @author Andres
 * @author Alberto
 */
public class Usuario {
        
    private String aliasPropio;
    private String nombre;   
    private String apellidos;   
    private String foto;
    private String contrasenya;
    private String correo;
    private int sexo;
    private String lugar;
    private boolean moderador;

    /**
     * @return the aliasPropio
     */
    public String getAliasPropio() {
        return aliasPropio;
    }

    /**
     * @param aliasPropio the aliasPropio to set
     */
    public void setAliasPropio(String aliasPropio) {
        this.aliasPropio = aliasPropio;
    }

    /**
     * @return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return the apellidos
     */
    public String getApellidos() {
        return apellidos;
    }

    /**
     * @param apellidos the apellidos to set
     */
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    /**
     * @return the foto
     */
    public String getFoto() {
        return foto;
    }

    /**
     * @param foto the foto to set
     */
    public void setFoto(String foto) {
        this.foto = foto;
    }

    /**
     * @return the contrasenya
     */
    public String getContrasenya() {
        return contrasenya;
    }

    /**
     * @param contrasenya the contrasenya to set
     */
    public void setContrasenya(String contrasenya) {
        this.contrasenya = contrasenya;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the sexo
     */
    public int getSexo() {
        return sexo;
    }

    /**
     * @param sexo the sexo to set
     */
    public void setSexo(int sexo) {
        this.sexo = sexo;
    }
    
    public String getLugar() {
        return lugar;
    }

    /**
     * @param lugar the nombre to set
     */
    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    /**
     * @return the moderador
     */
    public boolean isModerador() {
        return moderador;
    }

    /**
     * @param moderador the moderador to set
     */
    public void setModerador(boolean moderador) {
        this.moderador = moderador;
    }
}
