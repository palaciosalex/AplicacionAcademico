/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Carrera;
import Modelo.Curso;
import Modelo.Estudiante;
import Modelo.Matricula;
import ModeloDAO.CarreraDAO;
import ModeloDAO.CursoDAO;
import ModeloDAO.EstudianteDAO;
import ModeloDAO.MatriculaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Alex
 */
@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {
    String listarestudiante = "Vista/ListarEstudiante.jsp";
    String agregarestudiante = "Vista/AgregarEstudiante.jsp";
    String editarestudiante = "Vista/EditarEstudiante.jsp";
    Estudiante estudiante = new Estudiante();
    EstudianteDAO estudianteDAO = new EstudianteDAO();
    
    
    //Controlador Curso
    String listarcurso = "Vista/ListarCurso.jsp";
    String agregarcurso= "Vista/AgregarCurso.jsp";
    String editarcurso = "Vista/EditarCurso.jsp";
    Curso curso = new Curso();
    CursoDAO cursoDAO = new CursoDAO();
    
    //Contralador Carrera
    String listarcarrera = "Vista/ListarCarrera.jsp";
    String agregarcarrera= "Vista/AgregarCarrera.jsp";
    String editarcarrera = "Vista/EditarCarrera.jsp";
    Carrera carrera = new Carrera();
    CarreraDAO carreraDAO = new CarreraDAO();
    
    //Controlador Matricula
    String listarmatricula = "Vista/ListarMatricula.jsp";
    String agregarmatricula = "Vista/AgregarMatricula.jsp";
    String editarmatricula = "Vista/EditarMatricula.jsp";
    Matricula matricula = new Matricula();
    MatriculaDAO matriculaDAO = new MatriculaDAO();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String s_accion = request.getParameter("f_accion");
        if (s_accion.equalsIgnoreCase("listarestudiante")) {
            acceso = listarestudiante;
        }else if (s_accion.equalsIgnoreCase("agregarestudiante01")) {
            acceso = agregarestudiante;
        }else if (s_accion.equalsIgnoreCase("agregarestudiante02")) {
            String s_nombre = request.getParameter("f_nombre");
            String s_apellidos = request.getParameter("f_apellidos");
            String s_dni = request.getParameter("f_dni");
            String s_codigo = request.getParameter("f_codigo");
            String s_direccion = request.getParameter("f_direccion");
            String s_estado = request.getParameter("f_estado");
            
            estudiante.setNombre(s_nombre);
            estudiante.setApellidos(s_apellidos);
            estudiante.setDni(s_dni);
            estudiante.setCodigo(s_codigo);
            estudiante.setDireccion(s_direccion);
            estudiante.setEstado(s_estado);
            estudianteDAO.agregarestudiante(estudiante);
            acceso = listarestudiante;
            
        }else if (s_accion.equalsIgnoreCase("editarestudiante01")) {
            request.setAttribute("f_idestudiante", request.getParameter("f_idestudiante"));
            acceso = editarestudiante;
        }else if (s_accion.equalsIgnoreCase("editarestudiante02")) {
            int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
            String s_nombre = request.getParameter("f_nombre");
            String s_apellidos = request.getParameter("f_apellidos");
            String s_dni = request.getParameter("f_dni");
            String s_codigo = request.getParameter("f_codigo");
            String s_direccion = request.getParameter("f_direccion");
            String s_estado = request.getParameter("f_estado");
            
            estudiante.setIdestudiante(s_idestudiante);            
            estudiante.setNombre(s_nombre);
            estudiante.setApellidos(s_apellidos);
            estudiante.setDni(s_dni);
            estudiante.setCodigo(s_codigo);
            estudiante.setDireccion(s_direccion);
            estudiante.setEstado(s_estado);
            estudianteDAO.editarestudiante(estudiante);
            acceso = listarestudiante;
        }else if (s_accion.equals("eliminarestudiante")) {
            int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
            estudianteDAO.eliminarestudiante(s_idestudiante);
            acceso = listarestudiante;
            
            //listadoCurso
            
        }else if (s_accion.equalsIgnoreCase("listarcurso")) {
            acceso = listarcurso;
        }else if (s_accion.equalsIgnoreCase("agregarcurso01")) {
            acceso = agregarcurso;
        }else if (s_accion.equalsIgnoreCase("agregarcurso02")) {
            String s_nombre = request.getParameter("f_nombre");
            int s_horas = Integer.valueOf(request.getParameter("f_horas"));
            int s_creditos = Integer.valueOf(request.getParameter("f_creditos"));
            String s_estado = request.getParameter("f_estado");
            curso.setNombre(s_nombre);
            curso.setHoras(s_horas);
            curso.setCreditos(s_creditos);
            curso.setEstado(s_estado);
            cursoDAO.agregarcurso(curso);
            acceso = listarcurso;

        }else if (s_accion.equalsIgnoreCase("editarcurso01")) {
        request.setAttribute("f_idcurso", request.getParameter("f_idcurso"));
        acceso = editarcurso;
        }else if (s_accion.equalsIgnoreCase("editarcurso02")) {
            int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));            
            String s_nombre = request.getParameter("f_nombre");
            int s_horas = Integer.valueOf(request.getParameter("f_horas"));
            int s_creditos = Integer.valueOf(request.getParameter("f_creditos"));            
            String s_estado = request.getParameter("f_estado");
            curso.setIdcurso(s_idcurso);
            curso.setNombre(s_nombre);
            curso.setHoras(s_horas);
            curso.setCreditos(s_creditos);
            curso.setEstado(s_estado);            
            cursoDAO.editarcurso(curso);
            acceso = listarcurso;
        }else if (s_accion.equalsIgnoreCase("eliminarcurso")) {
            int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));
            cursoDAO.eliminarcurso(s_idcurso);
            acceso = listarcurso;
            
            
            //carrera
        }else if (s_accion.equalsIgnoreCase("listarcarrera")) {
            acceso = listarcarrera;
        }else if (s_accion.equalsIgnoreCase("agregarcarrera01")) {
            acceso = agregarcarrera;
        }else if (s_accion.equalsIgnoreCase("agregarcarrera02")) {
            String s_nombre = request.getParameter("f_nombre");
            String s_estado = request.getParameter("f_estado");
            carrera.setNombre(s_nombre);
            carrera.setEstado(s_estado);
            carreraDAO.agregarcarrera(carrera);
            acceso = listarcarrera;

        }else if (s_accion.equalsIgnoreCase("editarcarrera01")) {
        request.setAttribute("f_idcarrera", request.getParameter("f_idcarrera"));
        acceso = editarcarrera;
        }else if (s_accion.equalsIgnoreCase("editarcarrera02")) {
            int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));            
            String s_nombre = request.getParameter("f_nombre");           
            String s_estado = request.getParameter("f_estado");
            carrera.setIdcarrera(s_idcarrera);
            carrera.setNombre(s_nombre);
            carrera.setEstado(s_estado);            
            carreraDAO.editarcarrera(carrera);
            acceso = listarcarrera;
        }else if (s_accion.equalsIgnoreCase("eliminarcarrera")) {
            int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));
            carreraDAO.eliminarcarrera(s_idcarrera);
            acceso = listarcarrera;
        }

        //listadoMatricula------
            
        else if (s_accion.equalsIgnoreCase("listarmatricula")) {
            acceso = listarmatricula;
        }else if (s_accion.equalsIgnoreCase("agregarmatricula01")) {
            acceso = agregarmatricula;
        }else if (s_accion.equalsIgnoreCase("agregarmatricula02")) {
            
            String s_semestre= request.getParameter("f_semestre");
            int s_ciclo= Integer.valueOf(request.getParameter("f_ciclo"));
            String s_estado= request.getParameter("f_estado");
            int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
            int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));
            int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));

            matricula.setSemestre(s_semestre);
            matricula.setCiclo(s_ciclo);
            matricula.setEstado(s_estado);
            estudiante.setIdestudiante(s_idestudiante);
            matricula.setEstudiante(estudiante);
            curso.setIdcurso(s_idcurso);
            matricula.setCurso(curso);
            carrera.setIdcarrera(s_idcarrera);
            matricula.setCarrera(carrera);
            matriculaDAO.agregarmatricula(matricula);
            acceso = listarmatricula;

        }else if (s_accion.equalsIgnoreCase("editarmatricula01")) {
            request.setAttribute("f_idmatricula", request.getParameter("f_idmatricula"));
            acceso = editarmatricula;
        }else if (s_accion.equalsIgnoreCase("editarmatricula02")) {
            
            int s_idmatricula=Integer.valueOf(request.getParameter("f_idmatricula"));
            String s_semestre= request.getParameter("f_semestre");
            int s_ciclo= Integer.valueOf(request.getParameter("f_ciclo"));
            String s_estado= request.getParameter("f_estado");
            int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
            int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));
            int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));

            matricula.setIdmatricula(s_idmatricula);
            matricula.setSemestre(s_semestre);
            matricula.setCiclo(s_ciclo);
            matricula.setEstado(s_estado);
            estudiante.setIdestudiante(s_idestudiante);
            matricula.setEstudiante(estudiante);
            curso.setIdcurso(s_idcurso);
            matricula.setCurso(curso);
            carrera.setIdcarrera(s_idcarrera);
            matricula.setCarrera(carrera);            
            matriculaDAO.editarmatricula(matricula);
            acceso = listarmatricula;
        }else if (s_accion.equalsIgnoreCase("eliminarmatricula")) {
            int s_idmatricula = Integer.valueOf(request.getParameter("f_idmatricula"));
            matriculaDAO.eliminarmatricula(s_idmatricula);
            acceso = listarmatricula;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
