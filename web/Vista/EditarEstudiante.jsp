
<%@page import="Modelo.Estudiante"%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Estudiante</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                EstudianteDAO estudianteDAO = new EstudianteDAO();
                int s_idestudiante = Integer.valueOf(request.getParameter("f_idestudiante"));
                Estudiante estudiante = (Estudiante)estudianteDAO.buscarestudiante(s_idestudiante);
            %>
            
            <div class="row text-center">
                <h2>Editar Estudiante</h2>
            </div><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <form name="EditarEstudianteForm" action="Controlador" method="get" class="form-horizontal">
                        <div class="form-group">
                            <label for="1" class="col-md-2 control-label">Nombre</label>
                            <div class="col-md-4">
                              <input class="form-control" type="text" name="f_nombre" value="<% out.println(estudiante.getNombre()); %>" maxlength="30"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="2" class="col-sm-2 control-label">Apellidos</label>
                            <div class="col-md-4">
                              <input class="form-control" type="text" name="f_apellidos" value="<% out.println(estudiante.getApellidos()); %>" maxlength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">DNI</label>
                            <div class="col-md-3">
                              <input class="form-control" type="text" name="f_dni" value="<% out.println(estudiante.getDni()); %>" maxlength="8"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Codigo</label>
                            <div class="col-md-3">
                              <input class="form-control" type="text" name="f_codigo" value="<% out.println(estudiante.getCodigo()); %>" maxlength="9"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Direccion</label>
                            <div class="col-md-6">
                                <input class="form-control" type="text" name="f_direccion" value="<% out.println(estudiante.getDireccion()); %>" maxlength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estado</label>
                            <div class="col-xs-1">
                              <input class="form-control" type="text" name="f_estado" value="<% out.println(estudiante.getEstado()); %>" maxlength="1"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input class="btn btn-primary" type="submit" value="Editar Estudiante" name="editar" />
                                <input type="hidden" value="editarestudiante02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(estudiante.getIdestudiante()); %>" name="f_idestudiante">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="Controlador?f_accion=listarestudiante">Lista Estudiantes</a></li>
                        <li class="active">Editar Estudiante</li>
                </ol>
            </div>
        </div>
    </body>
</html>
