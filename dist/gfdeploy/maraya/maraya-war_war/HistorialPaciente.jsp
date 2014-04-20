<%-- 
    Document   : ConsultarHistorial
    Created on : 20-abr-2014, 19:53:42
    Author     : Pulgy
--%>
<%@page import="maraya.entity.Historial" %>
<%@page import="maraya.entity.Paciente" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Consulta de Historial Clinico</title>
    </head>
    <body>
        <%
            Historial historial = (Historial) request.getAttribute("Historial");
            Paciente paciente = (Paciente) request.getAttribute("Paciente");
        %>
        <h1><p align=="Center">Historial Clinico De <%= paciente.getNombre() +" " + paciente.getApellidos() %></p></h1>
       
        
        <table border= "1">
            <caption><B>Informaci&oacute;n</B></caption>
            <tr>
                <th>DNI</th>
                <th>NºHistorial</th>
                <th>Fecha Nacimiento</th>
                <th>Informaci&oacute;n</th>
                <th>Fecha De Historial</th>
            </tr>
            <tr>
                <td><%= paciente.getDni()%> </td>
                <td> <%= historial.getNHistorial() %> </td>
                <td> <%= paciente.getFechaNacimiento() %></td>      
                <td><%= historial.getInformacion() %> </td>
                <td><%= historial.getFechaCreacion() %></td>
            </tr>
            
        </table>
               
    </body>
</html>
