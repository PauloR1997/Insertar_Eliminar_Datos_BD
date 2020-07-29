<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Datos Persona</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idpersona;
            String s_nombre;
            String s_DNI;
            String s_telefono;
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
                s_idpersona = request.getParameter("f_idpersona");

                if (s_accion != null && s_accion.equals("M1")) {
                    consulta = "    select nombre, DNI, telefono "
                            + " from skerepersona "
                            + " where"
                            + " idpersona = " + s_idpersona + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>

        <form class="tablain" name="EditarPersonaForm" action="DatosPersona.jsp" method="GET">

            <table >
                <thead>
                    <tr>
                        <th colspan="2">Editar Persona</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>DNI </td>
                        <td><input type="text" name="f_DNI" value="<% out.print(rs.getString(2)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Telefono </td>
                        <td><input type="text" name="f_telefono" value="<% out.print(rs.getString(3)); %>" maxlength="9" size="11"/></td>
                    </tr>

                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idpersona" value="<% out.print(s_idpersona); %>" />    
                        </td>
                    </tr>


                </tbody>
            </table>

        </form>
        <%
            }
        } else {
        %>
        <form class="tablain" name="AgregarPersonaForm" action="DatosPersona.jsp" method="GET">
            <table >
                <thead>
                    <tr>
                        <th colspan="2">Agregar Persona</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Nombre </td>
                        <td><input type="text" name="f_nombre" maxlength="40" size="20" /></td>
                    </tr>

                    <tr>
                        <td>DNI </td>
                        <td><input type="text" name="f_DNI"  maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Telefono </td>
                        <td><input type="text" name="f_telefono"  maxlength="12" size="11"/></td>
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
                        <th colspan="6">Datos Persona</th>
                    </tr>
                    <tr>
                        <th>N°</th>
                        <th>Nombre</th>
                        <th>DNI</th>
                        <th>Telefono</th>
                        <th>Eliminar</th>
                        <th>Editar</th>

                    </tr>

                </thead>

                <%
                    if (s_accion != null) {
                        if (s_accion.equals("E")) {
                            consulta = "   delete from skerepersona "
                                    + " where "
                                    + " idpersona = " + s_idpersona + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();

                        } else if (s_accion.equals("C")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_DNI = request.getParameter("f_DNI");
                            s_telefono = request.getParameter("f_telefono");
                            consulta = "   insert into "
                                    + " skerepersona(nombre, DNI, telefono) "
                                    + " values ('" + s_nombre + "','" + s_DNI + "','" + s_telefono + "')";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        } else if (s_accion.equals("M2")) {
                            s_nombre = request.getParameter("f_nombre");
                            s_DNI = request.getParameter("f_DNI");
                            s_telefono = request.getParameter("f_telefono");

                            consulta = " update  skerepersona  "
                                    + "  set  "
                                    + "  nombre = '" + s_nombre + "',"
                                    + "  DNI = '" + s_DNI + "',"
                                    + "  telefono = '" + s_telefono + "' "
                                    + "  where "
                                    + "  idpersona = " + s_idpersona + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                    }
                    consulta = " Select idpersona, nombre, DNI, telefono "
                            + " from skerepersona ";
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
                    <td><%out.print(rs.getString(4));%></td>
                    <td><a href="DatosPersona.jsp?f_accion=E&f_idpersona=<%out.print(ide);%>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                    <td><a href="DatosPersona.jsp?f_accion=M1&f_idpersona=<%out.print(ide);%>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>

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