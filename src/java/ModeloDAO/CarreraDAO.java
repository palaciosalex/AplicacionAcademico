/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUD_Carrera;
import Modelo.Carrera;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jean
 */
public class CarreraDAO implements CRUD_Carrera{
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Carrera e = new Carrera();

    @Override
    public List listarcarrera() {
        ArrayList<Carrera>carreras = new ArrayList<>();
        String consulta = " Select * "
                        + " from carrera; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Carrera carrera = new Carrera();
                carrera.setIdcarrera(rs.getInt("idcarrera"));
                carrera.setNombre(rs.getString("nombre"));               
                carrera.setEstado(rs.getString("estado"));
                carreras.add(carrera);
            }
        } catch (Exception e) {
            System.out.println("Error en listar....");
        }
        return carreras;
    }

    @Override
    public Carrera buscarcarrera(int idcarrera) {
        String consulta = " Select * "
                        + " from carrera  "
                        + " where idcarrera = "+ idcarrera +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                e.setIdcarrera(rs.getInt("idcarrera"));
                e.setNombre(rs.getString("nombre"));            
                e.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar carrera....");
        }
        return e;
    }

    @Override
    public boolean agregarcarrera(Carrera carrera) {
        String consulta = " insert into carrera(nombre, estado) "
                        + " values(  "
                        + "'"+ carrera.getNombre() +"',  "
                        + "'"+ carrera.getEstado() +"'); ";
        System.out.println(consulta);
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarcarrera(Carrera carrera) {
        String consulta =   " update carrera "
                        +   " set "
                        +   " nombre = '"+ carrera.getNombre() +"',"                 
                        +   " estado = '"+ carrera.getEstado() +"'  "
                        +   " where "
                        +   " idcarrera = "+ carrera.getIdcarrera() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en editar carrea");
        }
        return false;
    }

    @Override
    public boolean eliminarcarrera(int idcarrera) {
        String consulta =   " delete from carrera "
                        +   " where " 
                        +   " idcarrera = "+ idcarrera +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en editar carrera");
        }
        return false;
    }
    
    public boolean validareliminacion(int idcarrera) {
        boolean valido=true;
        String consulta = "select * from matricula where idcarrera="+idcarrera;
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            
            if(rs.last()){
                valido=false;
            }
            
        } catch (Exception e) {
        }
        return valido;
    }
    
}
