/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ModeloDAO;

import Interfaces.CRUD_Curso;
import Modelo.Curso;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Config.bd.ConectaBd;
/**
 *
 * @author Jean
 */
public class CursoDAO implements CRUD_Curso{
    
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Curso e = new Curso();

    @Override
    public List listarcurso() {
        ArrayList<Curso>cursos = new ArrayList<>();
        String consulta = " Select * "
                        + " from curso; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {                
                Curso curso = new Curso();
                curso.setIdcurso(rs.getInt("idcurso"));
                curso.setNombre(rs.getString("nombre"));
                curso.setHoras(rs.getInt("horas"));
                curso.setCreditos(rs.getInt("creditos"));
                curso.setEstado(rs.getString("estado"));
                cursos.add(curso);
            }
        } catch (Exception e) {
            System.out.println("Error en listar....");
        }
        return cursos;

    }

    @Override
    public Curso buscarcurso(int idcurso) {
        String consulta = " Select * "
                        + " from curso  "
                        + " where idcurso = "+ idcurso +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                e.setIdcurso(rs.getInt("idcurso"));
                e.setNombre(rs.getString("nombre"));
                e.setHoras(rs.getInt("horas"));
                e.setCreditos(rs.getInt("creditos"));
                e.setEstado(rs.getString("estado"));
            }
        } catch (Exception e) {
            System.out.println("Error al buscar curso....");
        }
        return e;
    }

    @Override
    public boolean agregarcurso(Curso curso) {
        String consulta = " insert into curso(nombre, horas, creditos, estado) "
                        + " values(  "
                        + "'"+ curso.getNombre() +"',  "                        
                        + "'"+ curso.getHoras() +"',  "
                        + "'"+ curso.getCreditos() +"',  "
                        + "'"+ curso.getEstado() +"'); ";
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
    public boolean editarcurso(Curso curso) {
        String consulta =   " update curso "
                        +   " set "
                        +   " nombre = '"+ curso.getNombre() +"',"
                        +   " horas = '"+ curso.getHoras()+"', "                        
                        +   " creditos = '"+ curso.getCreditos()+"', "                        
                        +   " estado = '"+ curso.getEstado() +"'  "
                        +   " where "
                        +   " idcurso = "+ curso.getIdcurso() +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en editar curso");
        }
        return false;   
    }

    @Override
    public boolean eliminarcurso(int idcurso) {
        String consulta =   " delete from curso "
                        +   " where " 
                        +   " idcurso = "+ idcurso +" ; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en editar curso");
        }
        return false;
    }
    
    public boolean validareliminacion(int idcurso) {
        boolean valido=true;
        String consulta = "select * from matricula where idcurso="+idcurso;
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
