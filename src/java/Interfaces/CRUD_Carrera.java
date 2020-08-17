/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Carrera;
import java.util.List;

/**
 *
 * @author Jean
 */
public interface CRUD_Carrera {
    public List listarcarrera();
    public Carrera buscarcarrera(int idcarrera); 
    public boolean agregarcarrera(Carrera carrera); 
    public boolean editarcarrera(Carrera carrera); 
    public boolean eliminarcarrera(int idcarrera); 
}
