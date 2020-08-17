<%-- 
    Document   : ListarCarrera
    Created on : 17/08/2020, 12:13:12 AM
    Author     : Jean
--%>

<%@page import="java.util.Iterator"%>
<%@page import="Modelo.Carrera"%>
<%@page import="java.util.List"%>
<%@page import="ModeloDAO.CarreraDAO"%>
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
                <h1>Listado de Carrera</h1>
            </div>
            <div class="row">
                <a class="btn btn-success" href="Controlador?f_accion=agregarcarrera01">Agregar Nuevo Carrera</a>
            </div><br>
            <div class="row">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">ID</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Estado</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                            CarreraDAO carreraDAO = new CarreraDAO();
                            List<Carrera> carreras = carreraDAO.listarcarrera();
                            Iterator<Carrera> iterator = carreras.iterator();
                            Carrera carrera = null;
                            while (iterator.hasNext()) {
                                carrera = iterator.next();
                        %>
                        <tr>
                            <td><% out.print(carrera.getIdcarrera()); %></td>
                            <td><% out.print(carrera.getNombre()); %></td>
                            <td><% out.print(carrera.getEstado()); %></td>
                            <td>
                                <a class="btn btn-warning" href="Controlador?f_accion=editarcarrera01&f_idcarrera=<% out.print(carrera.getIdcarrera()); %>">
                                    Editar
                                </a>
                                <%
                                    if(carreraDAO.validareliminacion(carrera.getIdcarrera())==true){
                                %>
                                <a class="btn btn-danger" href="Controlador?f_accion=eliminarcarrera&f_idcarrera=<% out.print(carrera.getIdcarrera()); %>">
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
                        <li class="active">Lista Carrera</li>
                </ol>
            </div>
        </div>
    </body>
    </body>
</html>
