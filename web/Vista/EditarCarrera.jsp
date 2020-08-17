<%-- 
    Document   : EditarCarrera
    Created on : 17/08/2020, 12:21:07 AM
    Author     : Jean
--%>

<%@page import="Modelo.Carrera"%>
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
            <%
                CarreraDAO carreraDAO = new CarreraDAO();
                int s_idcarrera = Integer.valueOf(request.getParameter("f_idcarrera"));
                Carrera carrera = (Carrera)carreraDAO.buscarcarrera(s_idcarrera);                
            %>
            <div class="row text-center">
                <h2>Editar Carrera</h2>
            </div><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <form name="EditarCarreraForm" action="Controlador" method="get" class="form-horizontal">
                        <div class="form-group">
                            <label for="1" class="col-md-2 control-label">Nombre</label>
                            <div class="col-md-4">
                              <input class="form-control" type="text" name="f_nombre" value="<% out.println(carrera.getNombre()); %>" maxlength="30"/>
                            </div>
                        </div>                                               
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estado</label>
                            <div class="col-xs-1">
                              <input class="form-control" type="text" name="f_estado" value="<% out.println(carrera.getEstado()); %>" maxlength="1"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input class="btn btn-primary" type="submit" value="Editar Carrera" name="editar" />
                                <input type="hidden" value="editarcarrera02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(carrera.getIdcarrera()); %>" name="f_idcarrera">
                            </div>
                        </div>                       
                    </form>
                </div>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="Controlador?f_accion=listarcarrera">Lista Carrera</a></li>
                        <li class="active">Editar Carrera</li>
                </ol>
            </div>
        </div>
    </body>
    </body>
</html>
