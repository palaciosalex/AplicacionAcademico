<%-- 
    Document   : AgregarMatricula
    Created on : 16/08/2020, 07:26:16 PM
    Author     : Alex
--%>

<%@page import="Modelo.Carrera"%>
<%@page import="ModeloDAO.CarreraDAO"%>
<%@page import="Modelo.Curso"%>
<%@page import="ModeloDAO.CursoDAO"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Matricula</title>
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container">
            <div class="row text-center">
                <h2>Agregar Matricula</h2>
            </div><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <form name="AgregarMatriculaForm" action="Controlador" method="get" class="form-horizontal">
                        <div class="form-group">
                            <label for="1" class="col-md-2 control-label">Semestre</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_semestre" value="" maxlength="6"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="2" class="col-sm-2 control-label">Ciclo</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_ciclo" value="" maxlength="2"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estado</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_estado" value="" maxlength="1" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estudiante</label>
                            <div class="col-md-5">
                                <select class="form-control" name="f_idestudiante">
                                    <%
                                    EstudianteDAO estudianteDAO = new EstudianteDAO();
                                    List<Estudiante> estudiantes = estudianteDAO.listarestudiante();
                                    Iterator<Estudiante> iterator = estudiantes.iterator();
                                    Estudiante estudiante = null;
                                    while (iterator.hasNext()) {
                                        estudiante = iterator.next();
                                    %>
                                    <option value="<%out.print(estudiante.getIdestudiante());%>"><%out.print(estudiante.getNombre()+" "+estudiante.getApellidos());%></option>
                                    <%}
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Curso</label>
                            <div class="col-md-4">
                              <select class="form-control" name="f_idcurso">
                                    <%
                                    CursoDAO cursoDAO = new CursoDAO();
                                    List<Curso> cursos = cursoDAO.listarcurso();
                                    Iterator<Curso> iterator2 = cursos.iterator();
                                    Curso curso = null;
                                    while (iterator2.hasNext()) {
                                        curso = iterator2.next();
                                    %>
                                    <option value="<%out.print(curso.getIdcurso());%>"><%out.print(curso.getNombre());%></option>
                                    <%}
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Carrera</label>
                            <div class="col-md-3">
                              <select class="form-control" name="f_idcarrera">
                                 <%
                                    CarreraDAO carreraDAO = new CarreraDAO();
                                    List<Carrera> carreras = carreraDAO.listarcarrera();
                                    Iterator<Carrera> iterator3 = carreras.iterator();
                                    Carrera carrera = null;
                                    while (iterator3.hasNext()) {
                                        carrera = iterator3.next();
                                    %>
                                    <option value="<%out.print(carrera.getIdcarrera());%>"><%out.print(carrera.getNombre());%></option>
                                    <%}
                                    %>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input class="btn btn-primary" type="submit" value="Agregar Matricula" name="agregar" />
                                <input type="hidden" value="agregarmatricula02" name="f_accion"/>
                            </div>
                        </div>

                    </form>
                    
                </div>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="Controlador?f_accion=listarmatricula">Lista Matriculas</a></li>
                        <li class="active">Agregar Matricula</li>
                </ol>
            </div>
        </div>
    </body>
</html>
