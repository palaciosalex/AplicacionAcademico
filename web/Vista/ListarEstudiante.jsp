<%-- 
    Document   : ListarEstudiante
    Created on : 10/08/2020, 09:13:41 AM
    Author     : TuNombre
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Estudiantes</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row text-center">
                <h1>Listado de Estudiantes</h1>
            </div>
            <div class="row">
                <a class="btn btn-success" href="Controlador?f_accion=agregarestudiante01">Agregar Nuevo Estudiante</a>
            </div><br>
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Apellidos</th>
                            <th class="text-center">DNI</th>
                            <th class="text-center">Código</th>
                            <th class="text-center">Dirección</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            EstudianteDAO estudianteDAO = new EstudianteDAO();
                            List<Estudiante> estudiantes = estudianteDAO.listarestudiante();
                            Iterator<Estudiante> iterator = estudiantes.iterator();
                            Estudiante estudiante = null;
                            while (iterator.hasNext()) {
                                estudiante = iterator.next();


                        %>
                        <tr>
                            <td><% out.print(estudiante.getIdestudiante()); %></td>
                            <td><% out.print(estudiante.getNombre()); %></td>
                            <td><% out.print(estudiante.getApellidos()); %></td>
                            <td><% out.print(estudiante.getDni()); %></td>
                            <td><% out.print(estudiante.getCodigo()); %></td>
                            <td><% out.print(estudiante.getDireccion()); %></td>
                            <td><% out.print(estudiante.getEstado()); %></td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?f_accion=editarestudiante01&f_idestudiante=<% out.print(estudiante.getIdestudiante()); %>">
                                    Editar
                                </a>
                                <%
                                    if(estudianteDAO.validareliminacion(estudiante.getIdestudiante())==true){
                                %>
                                <a class="btn btn-danger" href="Controlador?f_accion=eliminarestudiante&f_idestudiante=<% out.print(estudiante.getIdestudiante()); %>">
                                    Eliminar
                                </a>
                                <%}else{
                                %>
                                <a class="btn btn-danger disabled">
                                    Eliminar
                                </a>
                                <%}
                                %>

                            </td>
                        </tr>
                        <%    }
                        %>                    
                    </tbody>
                </table>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li class="active">Lista Estudiantes</li>
                </ol>
            </div>
        </div>
    </body>
</html>
