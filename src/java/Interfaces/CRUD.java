/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import Modelo.Estudiante;
import java.util.List;

/**
 *
 * @author TuNombre
 */
public interface CRUD {
    public List listarestudiante(); // listar
    public Estudiante buscarestudiante(int idestudiante); // buscar
    public boolean agregarestudiante(Estudiante estudiante); // agregar
    public boolean editarestudiante(Estudiante estudiante); // editar
    public boolean eliminarestudiante(int idestudiante); // eliminar
}
