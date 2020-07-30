<%-- 
    Document   : DatosArea
    Created on : 29/07/2020, 07:10:44 PM
    Author     : Saul 
--%>

<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Datos area</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idarea;
            String s_nombre;
            String s_estado;

        %>
        <link rel="stylesheet" href="tablas.css">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    </head>
    <body>
        <br>
        <br>
       <%
            try {
                ConectaBd bd = new ConectaBd();
                cn = bd.getConnection();

                s_accion = request.getParameter("f_accion");
                s_idarea = request.getParameter("f_idarea");

                if (s_accion != null && s_accion.equals("M1")) {
                    consulta = "    select nombre, estado "
                            + " from skerearea "
                            + " where"
                            + " idarea = " + s_idarea + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>

        <form class="tablain" name="EditarAreaForm" action="DatosArea.jsp" method="GET">

            <table >
                <thead>
                    <tr>
                        <th colspan="2">Editar Area</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Estado </td>
                        <td><input type="text" name="f_estado" value="<% out.print(rs.getString(2)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idarea" value="<% out.print(s_idarea); %>" />    
                        </td>
                    </tr>


                </tbody>
            </table>

        </form>
        <%
            }
        } else {
        %>
        <form class="tablain" name="AgregarAreaForm" action="DatosArea.jsp" method="GET">
            <table >
                <thead>
                    <tr>
                        <th colspan="2">Agregar Area</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" maxlength="40" size="20" /></td>
                    </tr>

                    <tr>
                        <td>Estado </td>
                        <td><input type="text" name="f_estado"  maxlength="8" size="8"/></td>
                    </tr>
                    

                    <tr align = "center">
                        <td colspan="2">
                            <input type="submit" value="Agregar" name="f_agregar" />
                            <input type="hidden" name="f_accion" value="C" />
                        </td>
                    </tr>

                </tbody>
            </table>
        </form>
        <%
            }
        %>
        <form>
            <table align = "center"  class="tablaout" >
                <thead>
                    <tr>
                        <th colspan="6">Datos Area</th>
                    </tr>
                    <tr>
                        <th>N°</th>
                        <th>Nombre</th>
                        <th>Estado</th>
                        <th>Eliminar</th>
                        <th>Editar</th>

                    </tr>

                </thead>

                <%
                    if (s_accion != null) {
                        if (s_accion.equals("E")) {
                            consulta = "   delete from skerearea "
                                    + " where "
                                    + " idarea = " + s_idarea + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();

                        } else if (s_accion.equals("C")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_estado = request.getParameter("f_estado");
                            consulta = "   insert into "
                                    + " skerearea(nombre, estado) "
                                    + " values ('" + s_nombre + "','" + s_estado + "')";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        } else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_estado = request.getParameter("f_estado");
                            consulta = " update  skerearea  "
                                    + "  set  "
                                    + "  nombre = '" + s_nombre + "',"
                                    + "  estado = '" + s_estado + "' "
                                    + "  where "
                                    + "  idarea = " + s_idarea + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                    }
                    consulta = " Select idarea, nombre, estado "
                            + " from skerearea ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    int num = 0;
                    String ide;
                    while (rs.next()) {
                        ide = rs.getString(1);
                        num++;

                %>
                <tr align = "center">
                    <td><%out.print(num);%></td>
                    <td><%out.print(rs.getString(2));%></td>
                    <td><%out.print(rs.getString(3));%></td>
                    
                    <td><a href="DatosArea.jsp?f_accion=E&f_idarea=<%out.print(ide);%>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                    <td><a href="DatosArea.jsp?f_accion=M1&f_idarea=<%out.print(ide);%>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>

                </tr> 

                <%
                        }
                    } catch (Exception e) {
                        out.print("Error SQL");
                    }

                %>

            </table>

        </form>
        <a href="Menu.jsp"><input  type="submit" value="Regresar al menu" ></a>
    </body>
</html>