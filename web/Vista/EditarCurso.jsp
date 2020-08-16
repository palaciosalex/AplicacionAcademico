<%-- 
    Document   : EditarCurso
    Created on : 15/08/2020, 04:01:54 PM
    Author     : Jean
--%>

<%@page import="Modelo.Curso"%>
<%@page import="ModeloDAO.CursoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>.::Editar Curso::.</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <%
                CursoDAO cursoDAO = new CursoDAO();
                int s_idcurso = Integer.valueOf(request.getParameter("f_idcurso"));
                Curso curso = (Curso)cursoDAO.buscarcurso(s_idcurso);
            %>
            <div class="row text-center">
                <h2>Editar Curso</h2>
            </div><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <form name="EditarCursoForm" action="Controlador" method="get" class="form-horizontal">
                        <div class="form-group">
                            <label for="1" class="col-md-2 control-label">Nombre</label>
                            <div class="col-md-4">
                              <input class="form-control" type="text" name="f_nombre" value="<% out.println(curso.getNombre()); %>" maxlength="30"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="2" class="col-sm-2 control-label">Horas</label>
                            <div class="col-md-4">
                              <input class="form-control" type="text" name="f_horas" value="<% out.println(curso.getHoras()); %>" maxlength="50"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Creditos</label>
                            <div class="col-md-3">
                              <input class="form-control" type="text" name="f_creditos" value="<% out.println(curso.getCreditos()); %>" maxlength="8"/>
                            </div>
                        </div>                        
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estado</label>
                            <div class="col-xs-1">
                              <input class="form-control" type="text" name="f_estado" value="<% out.println(curso.getEstado()); %>" maxlength="1"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input class="btn btn-primary" type="submit" value="Editar Curso" name="editar" />
                                <input type="hidden" value="editarcurso02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(curso.getIdcurso()); %>" name="f_idcurso">
                            </div>
                        </div>                       
                    </form>
                </div>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="Controlador?f_accion=listarcurso">Lista Curso</a></li>
                        <li class="active">Editar Curso</li>
                </ol>
            </div>
        </div>
    </body>
</html>
