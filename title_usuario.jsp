<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%
//--------------------------------------------
//Funcion encargada de obtener el nombre de un
//Usuario que ha inciado sesion.
//--------------------------------------------
//login = request.getParameter("login");
java.util.Date fechn = new java.util.Date();
SimpleDateFormat fech_actual = new SimpleDateFormat("dd-MM-yyyy");
SimpleDateFormat hora_actual = new SimpleDateFormat("HH:mm:ss");
//---------------------------------------------------------------------
// Conexion a la base de datos, a traves de ODBC, guardado como SIAGEP
//---------------------------------------------------------------------

//Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

//---------------------------------------------------------------------
// Declaraciones de la pricipales variables utilizadas para manipular 
// las conexiones JDBC.
//---------------------------------------------------------------------
//Connection c_title = null;
Statement  s_title = null;
ResultSet  r_title = null;

//String url_c_title = "jdbc:odbc:SIAGEPWEB";

//c_title = DriverManager.getConnection(url_c_title);

//Sentencia SQL
String sqlstr_title = "SELECT Nombre_Completo" +
    " FROM usuarios_alcalsis Where nombre_usuario ='" + login + "'";

        //out.print(sqlstr);

        //s_title = c_title.createStatement();
        s_title = con.createStatement();
        r_title = s_title.executeQuery(sqlstr_title);

        if (r_title.next()){
            //--------------------------------------------
            // Asignacion de los resultados de la consulta
            //--------------------------------------------
            String nombre = r_title.getString("Nombre_Completo");
            out.print(" - " + nombre + " / " + fech_actual.format(fechn) + " / " + hora_actual.format(fechn) + "");
            
        }

%>