<%-- 
    Document   : menu
    Created on : jul 28, 2020, 4:45:44 p.m.
    Author     : Master Race
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <form name="f_datos" action="valida.jsp" method="POST" class="box">
            <h1>Bienvenido</h1>
            <img src="logou.png" width="120px" height="120px" alt=""/>
            <input type="text" name="f_usuario" placesholder="Usuario">
            <input type="password" name="f_clave" placeholder="Contraseña">
            <input type="submit" name="" value="Iniciar sesion">
        </form>
    </body>
</html>
