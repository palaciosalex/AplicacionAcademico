/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Jean
 */
public class Curso {
    private int idcurso;
    private String nombre;
    private int horas;
    private int creditos;
    private String estado;
    
    public Curso() {
    }

    public Curso(int idcurso, String nombre, int horas, int creditos, String estado) {
        this.idcurso = idcurso;
        this.nombre = nombre;
        this.horas = horas;
        this.creditos = creditos;
        this.estado = estado;
    }

    public int getIdcurso() {
        return idcurso;
    }

    public void setIdcurso(int idcurso) {
        this.idcurso = idcurso;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getHoras() {
        return horas;
    }

    public void setHoras(int horas) {
        this.horas = horas;
    }

    public int getCreditos() {
        return creditos;
    }

    public void setCreditos(int creditos) {
        this.creditos = creditos;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
