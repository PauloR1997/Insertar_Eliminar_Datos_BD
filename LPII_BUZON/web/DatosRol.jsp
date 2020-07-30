<%-- 
    Document   : DatosRol
    Created on : 29/07/2020, 08:20:21 PM
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>
<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Datos Rol</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idrol;
            String s_nombre;
           

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
                s_idrol = request.getParameter("f_idrol");

                if (s_accion != null && s_accion.equals("M1")) {
                    consulta = "    select nombre"
                            + " from skererol "
                            + " where"
                            + " idrol = " + s_idrol + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>

        <form class="tablain" name="EditarRolForm" action="DatosRol.jsp" method="GET">

            <table >
                <thead>
                    <tr>
                        <th colspan="2">Editar Rol</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    
                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idrol" value="<% out.print(s_idrol); %>" />    
                        </td>
                    </tr>


                </tbody>
            </table>

        </form>
        <%
            }
        } else {
        %>
        <form class="tablain" name="AgregarRolForm" action="DatosRol.jsp" method="GET">
            <table >
                <thead>
                    <tr>
                        <th colspan="2">Agregar Rol</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" maxlength="40" size="20" /></td>
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
                        <th colspan="6">Datos Rol</th>
                    </tr>
                    <tr>
                        <th>N°</th>
                        <th>Nombre</th>
                        <th>Eliminar</th>
                        <th>Editar</th>

                    </tr>

                </thead>

                <%
                    if (s_accion != null) {
                        if (s_accion.equals("E")) {
                            consulta = "   delete from skererol "
                                    + " where "
                                    + " idrol = " + s_idrol + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();

                        } else if (s_accion.equals("C")) {
                            s_nombre = request.getParameter("f_nombre");
                            
                            consulta = "   insert into "
                                    + " skererol(nombre) "
                                    + " values ('" + s_nombre + "')";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        } else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            
                            consulta = " update  skererol  "
                                    + "  set  "
                                    + "  nombre = '" + s_nombre + "'"
                                  
                                    + "  where "
                                    + "  idrol = " + s_idrol + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                    }
                    consulta = " Select idrol, nombre"
                            + " from skererol ";
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
                    
                    <td><a href="DatosRol.jsp?f_accion=E&f_idrol=<%out.print(ide);%>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                    <td><a href="DatosRol.jsp?f_accion=M1&f_idrol=<%out.print(ide);%>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>

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
