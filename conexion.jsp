<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%
//-------------------------------------------
/*Funcion encargada de obtener la conexion con 
la base de datos
*/
//-------------------------------------------

//---------------------------------------------------------------------
// Conexion a la base de datos, a traves de ODBC, guardado como SIAGEP
//---------------------------------------------------------------------

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

//---------------------------------------------------------------------
// Declaraciones de la pricipales variables utilizadas para manipular 
// las conexiones JDBC.
//---------------------------------------------------------------------

String url = "jdbc:odbc:SIAGEPWEB";

con = DriverManager.getConnection(url,"root","");
//con = DriverManager.getConnection("jdbc:mysql://localhost/alcalsis?user=root&password=");



//Class.forName("com.mysql.jdbc.Driver").newInstance();

//con = DriverManager.getConnection("jdbc:mysql://localhost/dissoft_alcalsis?user=dissoft_alcasis&password=rootbill&zeroDateTimeBehavior=convertToNull&jdbcCompliantTruncation=false");
//con = DriverManager.getConnection("jdbc:mysql://localhost/alcalsis?user=root&password=wind1221");


%>