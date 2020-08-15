/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Estudiante;
import ModeloDAO.EstudianteDAO;
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
