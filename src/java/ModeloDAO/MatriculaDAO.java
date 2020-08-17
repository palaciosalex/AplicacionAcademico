
package ModeloDAO;

import Config.bd.ConectaBd;
import Interfaces.CRUD_Matricula;
import Modelo.Carrera;
import Modelo.Curso;
import Modelo.Estudiante;
import Modelo.Matricula;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alex
 */
public class MatriculaDAO implements CRUD_Matricula{
    
    ConectaBd cn = new ConectaBd();
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    Matricula m = new Matricula();
    EstudianteDAO estudianteDAO = new EstudianteDAO();
    
    @Override
    public List listarmatricula() {
        ArrayList<Matricula> matriculas = new ArrayList<>();
        String consulta = " select M.idmatricula,M.semestre,M.ciclo,M.estado,"
                        + " E.nombre,E.apellidos,C.nombre,Ca.nombre"
                        + " from estudiante E,curso C,carrera Ca,matricula M"
                        + " where M.idestudiante=E.idestudiante and"
                        + " M.idcurso=C.idcurso and"
                        + " M.idcarrera=Ca.idcarrera"
                        + " order by E.nombre,M.semestre";
                        
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Matricula matricula = new Matricula();
                Estudiante estudiante = new Estudiante();
                Curso curso = new Curso();
                Carrera carrera = new Carrera();
                
                matricula.setIdmatricula(rs.getInt("M.idmatricula"));
                matricula.setSemestre(rs.getString("M.semestre"));
                matricula.setCiclo(rs.getInt("M.ciclo"));
                matricula.setEstado(rs.getString("M.estado"));
                estudiante.setNombre(rs.getString("E.nombre"));
                estudiante.setApellidos(rs.getString("E.apellidos"));
                matricula.setEstudiante(estudiante);
                curso.setNombre(rs.getString("C.nombre"));
                matricula.setCurso(curso);
                carrera.setNombre(rs.getString("Ca.nombre"));
                matricula.setCarrera(carrera);
                matriculas.add(matricula);
                
            }
        } catch (Exception e) {
            
        }
        return matriculas;
    }

    @Override
    public Matricula buscarmatricula(int idmatricula) {
        String consulta = " select *  "
                        + " from matricula "
                        + " where idmatricula = " + idmatricula + " ;";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            rs = pst.executeQuery();
            while (rs.next()) {
                Estudiante estudiante = new Estudiante();
                Curso curso = new Curso();
                Carrera carrera = new Carrera();
                
                m.setIdmatricula(rs.getInt("idmatricula"));
                m.setSemestre(rs.getString("semestre"));
                m.setCiclo(rs.getInt("ciclo"));
                m.setEstado(rs.getString("estado"));
                estudiante.setIdestudiante(rs.getInt("idestudiante"));
                m.setEstudiante(estudiante);
                curso.setIdcurso(rs.getInt("idcurso"));
                m.setCurso(curso);
                carrera.setIdcarrera(rs.getInt("idcarrera"));
                m.setCarrera(carrera);

            }
        } catch (Exception e) {
        }
        
        return m;
    }

    @Override
    public boolean agregarmatricula(Matricula matricula) {
        String consulta = " insert into matricula(semestre, ciclo, estado, idestudiante, idcurso, idcarrera)  "
                        + " values( "
                        + "'"+ matricula.getSemestre()+"', "
                        + "'"+ matricula.getCiclo()+"', "
                        + "'"+ matricula.getEstado()+"', "
                        + "'"+ matricula.getEstudiante().getIdestudiante()+"', "
                        + "'"+ matricula.getCurso().getIdcurso()+"', "
                        + "'"+ matricula.getCarrera().getIdcarrera()+"') ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean editarmatricula(Matricula matricula) {
        String consulta = " update matricula "
                        + " set "
                        + " semestre = '"+ matricula.getSemestre()+"', "
                        + " ciclo = "+ matricula.getCiclo() +", "
                        + " estado = '"+ matricula.getEstado()+"', "
                        + " idestudiante = '"+ matricula.getEstudiante().getIdestudiante() +"', "
                        + " idcurso = '"+ matricula.getCurso().getIdcurso()+"', "
                        + " idcarrera = '"+ matricula.getCarrera().getIdcarrera() +"' "
                        + " where "
                        + " idmatricula = " + matricula.getIdmatricula()+ "; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }

    @Override
    public boolean eliminarmatricula(int idmatricula) {
        String consulta = " delete from matricula "
                        + " where "
                        + " idmatricula = " + idmatricula + "; ";
        try {
            con = cn.getConnection();
            pst = con.prepareStatement(consulta);
            pst.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
