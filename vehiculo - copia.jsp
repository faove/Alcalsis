<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session="true" %>

<html>
<head><title>Servicios y Trámites de Vehículo.
<%
Connection con = null;
%>

<%@ include file="conexion.jsp" %>
<%
String login = request.getParameter("login");
%>
<%@ include file="title_usuario.jsp" %> 
</title></head>
<body bgcolor="#FFFFFF" align="center">

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
  <tr>
    <td width="33%"><p align="center">
        <p align="center">
     <%@ include file="frame_veh.jsp" %></td>
    <td width="33%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="33%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="33%">
<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Vehículo

    1 - Perfil basico del Vehiculo.
    2 - Permite buscar un vehiculo a través de la placa y realizar diferentes
        operaciones.


---------------------
Date Desarrollador
: 14/11/03 FAOVE
: 02/06/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>

<%
//Declaraciones:
String campo="PLACA";

String buscar_txt = request.getParameter("buscar_txt");

Statement stmt_marca = null;
Statement stmt_modelo = null;
Statement stmt_tipo = null;

ResultSet rcd_tipo = null;
ResultSet rcd_marca = null;
ResultSet rcd_modelo = null;
SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
%>

<%
    //------------------------------------------------------------------
    // Validación de entrada, todo usuario del sistema necesita un login
    //------------------------------------------------------------------

if ((request.getParameter("login") == null) || (request.getParameter("login")=="")) {

%>
    <p align="center" >&nbsp; </P>
    <p align="center" > Entrada no permitida, por favor verifique su login. <a href="index.html">presione aquí</a></P>
<%
}else{
        //----------------------------------------------------------------------------
        // Obtenemos el valor de boton buscar o del boton de vehiculo (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String BUSCAR = null;
        String pulsar_buscar = request.getParameter("Veh");
        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de vehiculo (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");
%>
<hr>

<%@ include file="search_veh.jsp" %>

<table border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse; text-align:center" bordercolor="#111111" width="98%" id="AutoNumber1" height="20">
  <tr>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">&nbsp;</td>
    <td width="10%" height="20">
        </td>
    <td width="11%" height="20">&nbsp;</td>
  </tr>
</table>
 
  <%
//String p_b = pulsar_buscar
//pulsar_buscar

//-----------------------------------------------------------------------
// Verificamos si tiene algun valor pulsar_buscar, para asi desplegar los
// valores asociados a tal nro de patente deseada
//-----------------------------------------------------------------------
//if (pulsar_buscar.trim().equals("Publicidad")){

//if (pulsar_buscar.length == 0) throw new NoSuchElementException() 

//if (pulsar_buscar != "Publicidad"){
if (buscar_txt == null){ // inicio if 1
%>
<table border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse; text-align:center" bordercolor="#111111" width="98%" id="AutoNumber1" height="431">
 
  <tr>
  <p><b><font face="Tahoma" size="2"><a href="../veh_nuevo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>">Agregar un Vehículo Nuevo
   </a></font></b>&nbsp;
  <b><font face="Tahoma" size="2"><a href="../alcalsis.jsp?id_usuarios=<%=id_user%>&login=<%=request.getParameter("login")%>&pass=<%=request.getParameter("pass")%>">Cerrar</a></font></b>
  </p>
    <td width="10%" height="35" align="center" style="border-left-style: solid; border-left-width: 1; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: none; border-bottom-width: medium" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">
    <p align="left"><font face="Arial" size="2">
    Datos del Vehículo:</font></td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="18%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="4%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="35" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="11%" height="35" align="center" style="border-left-style: none; border-left-width: medium; border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1; border-bottom-style: none; border-bottom-width: medium" bordercolor="#FFE3AA">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="32" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <p align="center"><font face="Arial" size="2">Placa:  
    </font></td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">&nbsp;
    </td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <p align="center"><font face="Arial" size="2">
    Marca:</font></td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <p align="center"></td>
    <td width="18%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <font face="Arial" size="2">Modelo:</font></td>
    <td width="4%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">&nbsp;
    </td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <p align="center"><font face="Arial" size="2">Año 
    del Vehículo:</font></td>
    <td width="10%" bordercolor="#E2E2E2" bgcolor="#B7DBFF" height="32" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1">
    <p align="center"></td>
    <td width="11%" height="32" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="4%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <p align="center"><font face="Arial" size="2">
    Fecha de Inscripción:</font></td>

    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Tipo de Uso:</font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="18%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Costo:</font></td>
    <td width="4%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Año de Registro:</font></td>
    <td width="11%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="12%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="4%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <p align="center"><font size="2" face="Arial">
    Valor Fiscal:</font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">
    Fecha de Registro:</font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="18%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    &nbsp;</td>
    <td width="4%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0">
    </td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="18%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="4%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium" bordercolor="#C0C0C0"></td>
    <td width="11%" height="18" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0"></td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium">
    </td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="18%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="4%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
    <td width="11%" height="18" align="center" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium"></td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0">
    <p align="left"><font face="Arial" size="2">
    Datos del Propietario:</font></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="18%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="4%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="10%" height="18" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:none; border-top-width:medium" bordercolor="#C0C0C0"></td>
    <td width="11%" height="18" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0"></td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Nombre:</font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font size="2" face="Arial">CI:</font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="18%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Dirección:</font></td>
    <td width="4%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">Teléfono:</font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="18%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="4%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="12" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0"></td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">No Patente:</font></td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">
    <font face="Arial" size="2">RIF:</font></td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="18%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="4%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="12" align="center" style="border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium; border-top-style:solid; border-top-width:1; border-bottom-style:solid; border-bottom-width:1" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="11%" height="12" align="center" style="border-style:none; border-width:medium; " bordercolor="#C0C0C0"></td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-left-style: solid; border-left-width: 1; border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="18%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="4%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-bottom-style: solid; border-bottom-width: 1; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium" bordercolor="#FFE3AA">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-left-style: none; border-left-width: medium; border-right-style: solid; border-right-width: 1; border-top-style: none; border-top-width: medium; border-bottom-style: solid; border-bottom-width: 1" bordercolor="#FFE3AA">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="12" align="center" style="border-right-style: none; border-right-width: medium; border-left-style:none; border-left-width:medium; border-bottom-style:none; border-bottom-width:medium"></td>
    <td width="10%" height="12" align="center" style="border-left-style: none; border-left-width: medium; border-bottom-style: none; border-bottom-width: medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="10%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="10%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="10%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="18%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="4%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium">
    </td>
    <td width="10%" height="12" align="center" style="border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium; border-right-style:none; border-right-width:medium"></td>
    <td width="10%" height="12" align="center" style="border-right-style: none; border-right-width: medium; border-bottom-style: none; border-bottom-width: medium; border-left-style:none; border-left-width:medium">
    </td>
    <td width="11%" height="12" align="center" style="border-left-style: none; border-left-width: medium; border-right-style:none; border-right-width:medium; border-bottom-style:none; border-bottom-width:medium"></td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium; border-right-style:none; border-right-width:medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; ">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style:none; border-width:medium; ">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-style:none; border-width:medium; ">&nbsp;</td>
    <td width="4%" height="19" align="center" style="border-top-style: none; border-top-width: medium; border-left-style:none; border-left-width:medium">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="11%" height="19" align="center">&nbsp;</td>
  </tr>
</table>

<%
} // fin del if (verifica si pulsar_buscar es null) // fin if 1
else // inicio else 1
{


        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular 
        // las conexiones JDBC.
        //---------------------------------------------------------------------
        Statement stmt = null;
        ResultSet rcd = null;
        
        //----------------------------------------
        // Obtenemos el valor del combox (PLACA)
        //----------------------------------------
        String patent = buscar_txt;  
        

        String  strquery = "SELECT PLACA,MARCA,MODELO,ANIO_VEH,ANIO_ULT_LIQ," +
                "FEC_ULT_PAGO,FEC_ADQ,FEC_REG,FEC_INS,TIP_USO,COSTO, " +                
                "ANIO_REG,VALOR_FISCAL,COD_MARCA,COD_MODELO,NOMBRE,CI_RIF,DIRECCION,TEL,NRO_PAT " +
               "FROM vehiculos WHERE " + campo + " ='" + patent + "'"; 
        
        stmt = con.createStatement();
        
        rcd = stmt.executeQuery(strquery);

        if (rcd.next()) { // inicio if 2

        //--------------------------------------------
        // Asignacion de los resultados de la consulta
        //--------------------------------------------
        String placa            = rcd.getString("PLACA");
        String marca            = rcd.getString("MARCA");
        String modelo           = rcd.getString("MODELO");
        String año_veh          = rcd.getString("ANIO_VEH");
        String año_ult          = rcd.getString("ANIO_ULT_LIQ");
        java.sql.Date fecha_ult = rcd.getDate("FEC_ULT_PAGO");
        java.sql.Date fecha_adq = rcd.getDate("FEC_ADQ");                		
	java.sql.Date fecha_reg = rcd.getDate("FEC_REG");
        java.sql.Date fecha_ins = rcd.getDate("FEC_INS");                                
        short tipo_uso          = rcd.getShort("TIP_USO");
        java.math.BigDecimal costo  = rcd.getBigDecimal("COSTO");
        String año_reg          = rcd.getString("ANIO_REG");        
        double valor_fiscal     = rcd.getDouble("VALOR_FISCAL");        
        short cod_marca         = rcd.getShort("COD_MARCA");
        short cod_modelo        = rcd.getShort("COD_MODELO");
        String nombre           = rcd.getString("NOMBRE");
        String ci_rif           = rcd.getString("CI_RIF");
        String direccion        = rcd.getString("DIRECCION");
        String tel              = rcd.getString("TEL");
        String nro_pat          = rcd.getString("NRO_PAT");

%>       
  <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
                   
	<tr>
			</b></a><b><font face="Tahoma" size="2"><a href="../vehiculo_edo_cuenta.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&placa=<%=placa%>&marca=<%=cod_marca%>&modelo=<%=cod_modelo%>&nombre=<%=nombre%>&pass=<%=pass%>">Estado 
			de Cuenta</a></font></b>&nbsp;
            <b><font face="Tahoma" size="2"><a href="../veh_liq_simul.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&placa=<%=placa%>&marca=<%=cod_marca%>&modelo=<%=cod_modelo%>&nombre=<%=nombre%>&pass=<%=pass%>">Liquidación 
            Simultanea</a></font></b>&nbsp;
            <b><font face="Tahoma" size="2"><a href="../veh_liq_anual.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&placa=<%=placa%>&marca=<%=cod_marca%>&modelo=<%=cod_modelo%>&nombre=<%=nombre%>&pass=<%=pass%>">Liquidación 
            Anual</a></font></b>&nbsp;
            <b><font face="Tahoma" size="2"><a href="../veh_nuevo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>">Agregar Vehículo
		    </a></font></b>&nbsp;
		    <b><font face="Tahoma" size="2"><a href="../veh_editar.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&placa=<%=placa%>&marca=<%=cod_marca%>&modelo=<%=cod_modelo%>&nombre=<%=nombre%>&pass=<%=pass%>">Editar 
            Vehículo</a></font></b>&nbsp;
			<p><b><font face="Tahoma" size="2"><a href="../alcalsis.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>">Cerrar</a></font></b></p>
 	</tr>
   <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: solid; border-left-width: 1; border-top-style: solid; border-top-width: 1">
    <p align="left"><b><font face="Arial" size="2">
    Datos del Vehículo:</font></b></td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-right-style: solid; border-right-width: 1; border-top-style: solid; border-top-width: 1">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-left-style: solid; border-left-width: 1">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="57" align="center">&nbsp;</td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><font face="Arial" size="2"><b>Placa: </b> 
    </font></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%
    if (placa != null){
        out.print(placa);
    }
    %></font><font face="Arial" size="2">
        </font></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><font face="Arial" size="2">
    <b>Marca:</b></font></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><font face="Arial" size="2"><%
    						String  strquery_marca = "SELECT COD_MARCA,MARCA " +
                                   "FROM tab_veh_marca where COD_MARCA = " + cod_marca + ""; 
                            
                            stmt_marca = con.createStatement();

                            rcd_marca = stmt_marca.executeQuery(strquery_marca);

                            if (rcd_marca.next()) {
								
                                int cmarca = rcd_marca.getInt("COD_MARCA");

                                String dmarca = rcd_marca.getString("MARCA");

                                	out.print(dmarca);
                            }
    %></font></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Modelo:</font></b></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%
    
    						String  strquery_modelo = "SELECT ANIO,MODELO_DESC " +
                                   "FROM tab_veh_modelo where COD_MARCA = " + cod_marca + " and COD_MODELO = " + cod_modelo + " ORDER BY COD_MARCA,COD_MODELO,ANIO"; 
                            
                            stmt_modelo = con.createStatement();

                            rcd_modelo = stmt_modelo.executeQuery(strquery_modelo);

                            if (rcd_modelo.next()) {
								
                                String dano= rcd_modelo.getString("ANIO");

                                String dmodelo= rcd_modelo.getString("MODELO_DESC");
                                
                                out.print("" + dmodelo + " " + dano + "");
                                
                            }
    %></font></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><b><font face="Arial" size="2">Año 
    del Veh:</font></b></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#E2E2E2" height="57" align="center" style="border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><font face="Arial" size="2"><%=año_veh%> </font></td>
    <td width="11%" height="57" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-right-style: none; border-right-width: medium">&nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><b><font face="Arial" size="2">
    Fecha de Inscripción:</font></b></td>

    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%
    if (fecha_ins != null){
        out.print(sdf.format(fecha_ins));
    }
    %></font></td>                   
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Tipo de Uso:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%
    
    						String  strquery_tipo = "SELECT TIPO_VEHICULO,DESCRIPCION " +
                                   "FROM tab_veh_tipo_uso where TIPO_VEHICULO = " + tipo_uso + ""; 
                            
                            stmt_tipo = con.createStatement();

                            rcd_tipo = stmt_tipo.executeQuery(strquery_tipo);
                            
                            
                            while (rcd_tipo.next()) {
							
                                String descripcion = rcd_tipo.getString("DESCRIPCION");
                                
                                out.print(descripcion);

                            }
    
    %></font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Costo:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=costo%></font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Año de Registro:</font></b></td>
    <td width="11%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=año_reg%></font></td>
    <td width="12%" height="19" align="center" style="border-left-style: none; border-left-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="11%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-right-style: none; border-right-width: medium">&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <p align="center"><b><font size="2" face="Arial">
    Valor Fiscal:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
   <font face="Arial" size="2"><%=valor_fiscal%></font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b><font face="Arial" size="2">
    Fecha de Registro:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%
    if (fecha_reg != null){
        out.print(sdf.format(fecha_reg));
    }
    %></font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    &nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"></font></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    </td>
    <td width="11%" height="19" align="center" style="border-left-style: none; border-left-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center">
    </td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="11%" height="18" align="center"></td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center">
    <p align="left"><b><font face="Arial" size="2">
    Datos del Propietario:</font></b></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="10%" height="18" align="center"></td>
    <td width="11%" height="18" align="center"></td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-right-style: none; border-right-width: medium">&nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Nombre:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=nombre%></font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font size="2" face="Arial">Cédula:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=ci_rif%></font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Dirección:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=direccion%></font></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Teléfono:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=tel%></font></td>
    <td width="11%" height="19" align="center" style="border-left-style: none; border-left-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-bottom-style: none; border-bottom-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-right-style: none; border-right-width: medium">&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b>
    <font face="Arial" size="2">Nº Patente:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <font face="Arial" size="2"><%=nro_pat%></font></td>
    
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">
    <b><font face="Arial" size="2">RIF:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" bordercolor="#C0C0C0" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-style:none; border-width:medium; ">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: solid; border-left-width: 1; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;</td>
    <td width="10%" height="19" align="center" bordercolor="#FFE3AA" style="border-left-style: none; border-left-width: medium; border-right-style: solid; border-right-width: 1px; border-top-style: solid; border-top-width: 1; border-bottom-style: solid; border-bottom-width: 1">&nbsp;
    </td>
    <td width="11%" height="19" align="center" bordercolor="#FFE3AA" style="border-right-style: none; border-right-width: medium; border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="20" align="center">&nbsp;</td>
    <td width="10%" height="20" align="center" style="border-right-style: none; border-right-width: medium">&nbsp;</td>
    <td width="10%" height="20" align="center" style="border-style:none; border-width:medium; ">

    </td>
    <td width="10%" height="20" align="center" style="border-style:none; border-width:medium; ">

    </td>
    <td width="10%" height="20" align="center" style="border-style:none; border-width:medium; ">  

    </td>
    <td width="10%" height="20" align="center" style="border-style:none; border-width:medium; ">
    </td>
    <td width="10%" height="20" align="center" style="border-style:none; border-width:medium; ">    
    </td>
    <td width="10%" height="20" align="center" style="border-left-style: none; border-left-width: medium">
    </td>
    <td width="10%" height="20" align="center">
    <p></td>
    <td width="11%" height="20" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-top-style: none; border-top-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="11%" height="19" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="10%" height="19" align="center">&nbsp;</td>
    <td width="11%" height="19" align="center">&nbsp;</td>
  </tr>
</table>
    </p>
<%
          } //fin if 3
    }      
}// fin if 1
%>
    <p></td>
    <td width="33%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="33%">&nbsp;</td>
    <td width="33%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<MAP NAME="vehiculo">
 <AREA SHAPE=RECT NOHREF  ALT="Información de contacto"  COORDS="658,126,661,138">
 <AREA SHAPE=RECT HREF="index.html"  ALT="www.alcalsis.com"  COORDS="601,126,636,136">
 <AREA SHAPE=RECT HREF="ayuda.html"  ALT="Ayuda del site"  COORDS="683,126,720,138">
</MAP>