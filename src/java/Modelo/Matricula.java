/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author Alex
 */
public class Matricula {
    
    int idmatricula;
    String semestre;
    int ciclo;
    String estado;
    Estudiante  estudiante;
    Curso   curso;
    Carrera carrera;

    public Matricula() {
    }

    public Matricula(int idmatricula, String semestre, int cliclo, String estado, Estudiante estudiante, Curso curso, Carrera carrera) {
        this.idmatricula = idmatricula;
        this.semestre = semestre;
        this.ciclo = cliclo;
        this.estado = estado;
        this.estudiante = estudiante;
        this.curso = curso;
        this.carrera = carrera;
    }

    public int getIdmatricula() {
        return idmatricula;
    }

    public void setIdmatricula(int idmatricula) {
        this.idmatricula = idmatricula;
    }

    public String getSemestre() {
        return semestre;
    }

    public void setSemestre(String semestre) {
        this.semestre = semestre;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int cliclo) {
        this.ciclo = cliclo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Estudiante getEstudiante() {
        return estudiante;
    }

    public void setEstudiante(Estudiante estudiante) {
        this.estudiante = estudiante;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    public Carrera getCarrera() {
        return carrera;
    }

    public void setCarrera(Carrera carrera) {
        this.carrera = carrera;
    }
    
    
    
}
