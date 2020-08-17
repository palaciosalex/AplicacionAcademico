<%-- 
    Document   : EditarMatricula
    Created on : 17/08/2020, 12:11:44 AM
    Author     : Alex
--%>

<%@page import="Modelo.Carrera"%>
<%@page import="ModeloDAO.CarreraDAO"%>
<%@page import="Modelo.Curso"%>
<%@page import="ModeloDAO.CursoDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Matricula"%>
<%@page import="ModeloDAO.MatriculaDAO"%>
<%@page import="Modelo.Estudiante"%>
<%@page import="ModeloDAO.EstudianteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Editar Matricula</title>
    </head>
    <body>
        <div class="container">
            <%
                MatriculaDAO matriculaDAO = new MatriculaDAO();
                int s_idmatricula = Integer.valueOf(request.getParameter("f_idmatricula"));
                Matricula matricula = (Matricula)matriculaDAO.buscarmatricula(s_idmatricula);
            %>
            
            <div class="row text-center">
                <h2>Editar Matricula</h2>
            </div><br>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-9">
                    <form name="EditarMatriculaForm" action="Controlador" method="get" class="form-horizontal">
                        <div class="form-group">
                            <label for="1" class="col-md-2 control-label">Semestre</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_semestre" value="<% out.println(matricula.getSemestre()); %>" maxlength="6"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="2" class="col-sm-2 control-label">Ciclo</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_ciclo" value="<% out.println(matricula.getCiclo()); %>" maxlength="2"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="3" class="col-sm-2 control-label">Estado</label>
                            <div class="col-md-2">
                              <input class="form-control" type="text" name="f_estado" value="<% out.println(matricula.getEstado()); %>" maxlength="1" />
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
                                        
                                        if(estudiante.getIdestudiante()==matricula.getEstudiante().getIdestudiante()){
                                    %>
                                    <option value="<%out.print(estudiante.getIdestudiante());%>" selected><%out.print(estudiante.getNombre()+" "+estudiante.getApellidos());%></option>
                                        
                                    <%}else{%>
                                    <option value="<%out.print(estudiante.getIdestudiante());%>"><%out.print(estudiante.getNombre()+" "+estudiante.getApellidos());%></option>
                                    <%}
                                    }
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
                                        
                                        if(curso.getIdcurso()==matricula.getCurso().getIdcurso()){
                                    %>
                                    <option value="<%out.print(curso.getIdcurso());%>" selected><%out.print(curso.getNombre());%></option>
                                    <%}else{%>
                                    %>
                                    <option value="<%out.print(curso.getIdcurso());%>"><%out.print(curso.getNombre());%></option>
                                    <%}
                                    }
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
                                        
                                        if(carrera.getIdcarrera()==matricula.getCarrera().getIdcarrera()){
                                    %>
                                    <option value="<%out.print(carrera.getIdcarrera());%>" selected><%out.print(carrera.getNombre());%></option>
                                    <%}else{
                                    %>
                                    <option value="<%out.print(carrera.getIdcarrera());%>"><%out.print(carrera.getNombre());%></option>
                                    <%}
                                    }
                                    %>
                              </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <input class="btn btn-primary" type="submit" value="Editar Matricula" name="editar" />
                                <input type="hidden" value="editarmatricula02" name="f_accion"/>
                                <input type="hidden" value="<% out.print(matricula.getIdmatricula()); %>" name="f_idmatricula">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="row">
                <ol class="breadcrumb">
                        <li><a href="index.html">Inicio</a></li>
                        <li><a href="Controlador?f_accion=listarmatricula">Lista Matriculas</a></li>
                        <li class="active">Editar Matricula</li>
                </ol>
            </div>
        </div>
    </body>
</html>
