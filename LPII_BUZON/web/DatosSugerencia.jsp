<%@page import="java.sql.*" %>
<%@page import="bd.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>  Datos Sugerencia</title>
        <%!
            String consulta;
            Connection cn;
            PreparedStatement pst;
            ResultSet rs;
            String s_accion;
            String s_idsugerencia;
            String s_descripcion;
            String s_fecha;
            String s_idarea;
            String s_idpersona;
            String s_idrol;
            
         
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
                s_idsugerencia = request.getParameter("f_idsugerencia");

                if (s_accion != null && s_accion.equals("M1")) {
                    consulta = "    select descripcion, fecha, idarea , idpersona , idrol "
                            + " from skeresugerencia "
                            + " where"
                            + " idsugerencia = " + s_idsugerencia + "; ";
                    //out.print(consulta);
                    pst = cn.prepareStatement(consulta);
                    rs = pst.executeQuery();
                    if (rs.next()) {
        %>

        <form class="tablain" name="EditarsugerenciaForm" action="DatosSugerencia.jsp" method="GET">

            <table >
                <thead>
                    <tr>
                        <th colspan="2">Editar sugerencia</th>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <td>Descripcion </td>
                        <td><input type="text" name="f_descripcion" value="<% out.print(rs.getString(1)); %>" maxlength="40" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Fecha</td>
                        <td><input type="text" name="f_fecha" value="<% out.print(rs.getString(2)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Area</td>
                        <td><input type="text" name="f_idarea" value="<% out.print(rs.getString(3)); %>" maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Persona</td>
                        <td><input type="text" name="f_idpersona" value="<% out.print(rs.getString(4)); %>" maxlength="40" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Rol</td>
                        <td><input type="text" name="f_idrol" value="<% out.print(rs.getString(5)); %>" maxlength="8" size="8"/></td>
                    </tr>
                   

                    <tr align="center">
                        <td colspan="2">
                            <input type="submit" value="Editar" name="f_editar" />
                            <input type="hidden" name="f_accion" value="M2" />
                            <input type="hidden" name="f_idsugerencia" value="<% out.print(s_idsugerencia); %>" />    
                        </td>
                    </tr>


                </tbody>
            </table>

        </form>
        <%
            }
        } else {
        %>
        <form class="tablaon" name="AgregarSugerenciaForm" action="DatosSugerencia.jsp" method="GET">
            <br>
            <table >
                <thead>
                    <tr>
                        <th colspan="2">Agregar Sugerencia</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Descripcion </td>
                        <td><input type="text" name="f_descripcion" maxlength="40" size="20" /></td>
                    </tr>

                    <tr>
                        <td>Fecha </td>
                        <td><input type="text" name="f_fecha"  maxlength="10" size="10"/></td>
                    </tr>
                    <tr>
                        <td>Area </td>
                        <td><input type="text" name="f_idarea"  maxlength="8" size="8"/></td>
                    </tr>
                    <tr>
                        <td>Persona </td>
                        <td><input type="text" name="f_idpersona"  maxlength="40" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Rol </td>
                        <td><input type="text" name="f_idrol"  maxlength="8" size="8"/></td>
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
                        <th colspan="8">Datos Sugerencia</th>
                    </tr>
                    <tr>
                        <th>N°</th>
                        <th>Descripcion</th>
                        <th>Fecha</th> 
                        <th>Area</th>
                        <th>Persona</th> 
                        <th>Rol</th>
                        <th>Eliminar</th>
                        <th>Editar</th>

                    </tr>

                </thead>

                <%
                    if (s_accion != null) {
                        if (s_accion.equals("E")) {
                            consulta = "   delete from skeresugerencia "
                                    + " where "
                                    + " idsugerencia = " + s_idsugerencia + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();

                        } else if (s_accion.equals("C")) {
                            s_descripcion = request.getParameter("f_descripcion");
                            s_fecha = request.getParameter("f_fecha");
                            s_idarea = request.getParameter("f_idarea");
                            s_idpersona = request.getParameter("f_idpersona");
                            s_idrol = request.getParameter("f_idrol");
                          
                            consulta = "   insert into "
                                    + " skeresugerencia(descripcion, fecha, idarea, idpersona, idrol) "
                                    + " values ('" + s_descripcion + "','" + s_fecha + "','" + s_idarea + "','" + s_idpersona + "','" + s_idrol + "')";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        } else if (s_accion.equals("M2")) {
                            s_descripcion = request.getParameter("f_descripcion");
                            s_fecha = request.getParameter("f_fecha");
                             s_idarea = request.getParameter("f_idarea");
                            s_idpersona = request.getParameter("f_idpersona");
                            s_idrol = request.getParameter("f_idrol");
                            

                            consulta = " update  skeredescripcion  "
                                    + "  set  "
                                    + "  descripcion = '" + s_descripcion + "',"
                                    + "  fecha = '" + s_fecha+ "',"
                                    + "  idarea = '" + s_idarea + "',"
                                    + "  idpersona = '" + s_idpersona+ "',"
                                    + "  idrol = '" + s_idrol+ "'"
                                    + "  where "
                                    + "  idsugerencia = " + s_idsugerencia + "; ";
                            //out.print(consulta);
                            pst = cn.prepareStatement(consulta);
                            pst.executeUpdate();
                        }
                    }
                    consulta = " Select idsugerencia, descripcion, fecha, idarea, idpersona, idrol "
                            + " from skeresugerencia ";
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
                    <td><%out.print(rs.getString(5));%></td> 
                    <td><%out.print(rs.getString(6));%></td> 
                    <td><a href="DatosSugerencia.jsp?f_accion=E&f_idsugerencia=<%out.print(ide);%>"><i class="fa fa-trash" aria-hidden="true"></i></a></td>
                    <td><a href="DatosSugerencia.jsp?f_accion=M1&f_idsugerencia=<%out.print(ide);%>"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>

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