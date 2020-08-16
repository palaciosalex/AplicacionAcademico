/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Curso;
import java.util.List;

/**
 *
 * @author Jean
 */
public interface CRUD_Curso {
    public List listarcurso();
    public Curso buscarcurso(int idcurso); 
    public boolean agregarcurso(Curso curso); 
    public boolean editarcurso(Curso curso); 
    public boolean eliminarcurso(int idcurso); 
}
