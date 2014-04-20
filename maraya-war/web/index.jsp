<%@page import="java.io.PrintWriter"%>
<%@page import="maraya.entity.UsuariosPacientes"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
    <body>
        <div>TODO write content</div>
        <% 
            HttpSession miSesion = request.getSession(true);
            UsuariosPacientes user = null;
            
            user = (UsuariosPacientes)miSesion.getAttribute("usuario");
            
            //out.println("Tipo: " + (String)miSesion.getAttribute("tipoUsuario") + "<br>");
            
            if(user == null){
                out.println("El usuario aun no esta identificado");
                out.println("<a href='loginUsuario.jsp'> Login </a>");
            }else{
                out.println("Hola, " + user.getUser());
                out.println("<a href='Logout'> Logout </a>");
            }
        %>
    </body>
</html>
