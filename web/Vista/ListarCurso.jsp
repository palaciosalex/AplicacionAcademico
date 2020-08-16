<%-- 
    Document   : ListarCurso
    Created on : 15/08/2020, 04:06:32 PM
    Author     : Jean
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Curso"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="row text-center">
                <h1>Listado de Curso</h1>
            </div>
            <div class="row">
                <a class="btn btn-success" href="Controlador?f_accion=agregarcurso01">Agregar Nuevo Curso</a>
            </div><br>
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Horas</th>
                            <th class="text-center">Creditos</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            CursoDAO cursoDAO = new CursoDAO();
                            List<Curso> cursos = cursoDAO.listarcurso();
                            Iterator<Curso> iterator = cursos.iterator();
                            Curso curso = null;
                            while (iterator.hasNext()) {
                                curso = iterator.next();
                        %>
                        <tr>
                            <td><% out.print(curso.getIdcurso()); %></td>
                            <td><% out.print(curso.getNombre()); %></td>
                            <td><% out.print(curso.getHoras()); %></td>
                            <td><% out.print(curso.getCreditos()); %></td>
                            <td><% out.print(curso.getEstado()); %></td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?f_accion=editarcurso01&f_idcurso=<% out.print(curso.getIdcurso()); %>">
                                    Editar
                                </a>
                                <%
                                    if(cursoDAO.validareliminacion(curso.getIdcurso())==true){
                                %>
                                <a class="btn btn-danger" href="Controlador?f_accion=eliminarcurso&f_idcurso=<% out.print(curso.getIdcurso()); %>">
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
                        <li class="active">Lista Curso</li>
                </ol>
            </div>
        </div>
    </body>
</html>
