
package Interfaces;

import Modelo.Matricula;
import java.util.List;

/**
 *
 * @author Alex
 */
public interface CRUD_Matricula {
    
    public List listarmatricula(); // listar
    public Matricula buscarmatricula(int idmatricula); // buscar
    public boolean agregarmatricula(Matricula matricula); // agregar
    public boolean editarmatricula(Matricula matricula); // editar
    public boolean eliminarmatricula(int idmatricula); // eliminar
}
