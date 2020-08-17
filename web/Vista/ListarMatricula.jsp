<%-- 
    Document   : ListarMatricula
    Created on : 16/08/2020, 07:26:42 PM
    Author     : Alex
--%>
<%@page import="Modelo.Matricula"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.MatriculaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Listar Matricula</title>
    </head>
    <body>
        <div class="container">
            <div class="row text-center">
                <h1>Listado de Matriculas</h1>
            </div>
            <div class="row">
                <a class="btn btn-success" href="Controlador?f_accion=agregarmatricula01">Agregar Nueva Matricula</a>
            </div><br>
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Semestre</th>
                            <th class="text-center">Ciclo</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Estudiante</th>
                            <th class="text-center">Curso</th>
                            <th class="text-center">Carrera</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            MatriculaDAO matriculaDAO = new MatriculaDAO();
                            List<Matricula> matriculas = matriculaDAO.listarmatricula();
                            Iterator<Matricula> iterator = matriculas.iterator();
                            Matricula matricula = null;
                            while (iterator.hasNext()) {
                                matricula = iterator.next();


                        %>
                        <tr>
                            <td><% out.print(matricula.getIdmatricula()); %></td>
                            <td><% out.print(matricula.getSemestre()); %></td>
                            <td><% out.print(matricula.getCiclo()); %></td>
                            <td><% out.print(matricula.getEstado()); %></td>
                            <td><% out.print(matricula.getEstudiante().getNombre()+" "+matricula.getEstudiante().getApellidos()); %></td>
                            <td><% out.print(matricula.getCurso().getNombre()); %></td>
                            <td><% out.print(matricula.getCarrera().getNombre()); %></td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?f_accion=editarmatricula01&f_idmatricula=<% out.print(matricula.getIdmatricula()); %>">
                                    Editar
                                </a>
                                <a class="btn btn-danger" href="Controlador?f_accion=eliminarmatricula&f_idmatricula=<% out.print(matricula.getIdmatricula()); %>">
                                    Eliminar
                                </a>


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
                        <li class="active">Lista Matriculas</li>
                </ol>
            </div>
        </div>
    </body>
</html>
