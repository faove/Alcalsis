<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de PIC

   
---------------------
Faove
03/01/05 
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>

<html>
<head>
<meta http-equiv="Content-Language" content="es">
<meta name="GENERATOR" content="Microsoft FrontPage 12.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>Patente de Industria y Comercio
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

<%-- <jsp:useBean id="beanInstanceName" scope="session" class="package.class" /> --%>
<%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>

<%
try{
//Declaraciones:
String campo="NRO_PAT";

String buscar_txt = request.getParameter("buscar_txt");

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

%> 
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
  <tr>
    <td width="33%"><p align="center">
        <p align="center">
     <%@ include file="frame_pic.jsp" %></td>
    <td width="33%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="33%">
<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Patente

    1 - Perfil basico del Patente.
    2 - Permite buscar un Patente
        operaciones.


---------------------
Date Desarrollador
: 14/11/03 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
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
        // Obtenemos el valor de boton buscar o del boton de patente   (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String BUSCAR = null;
        
        String pulsar_buscar = request.getParameter("Pic");
        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de publicidad (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");
        String codigo = "";
        String patente = "";
%>
<hr>

<%@ include file="search_pic.jsp" %>    
 
      <table border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse; text-align:center" bordercolor="#111111" width="98%" id="AutoNumber1" height="35">
        <tr>
          <td width="5%" rowspan="2">&nbsp;</td>
          <td width="24%" rowspan="2">&nbsp;</td>
          <td width="10%" rowspan="2">&nbsp;</td>
          <td width="10%" rowspan="2">&nbsp;</td>
          <td width="10%" rowspan="2">&nbsp;</td>
          <td width="10%" rowspan="2">&nbsp;</td>
          <td width="10%" rowspan="2">&nbsp;</td>
          <td width="16%" rowspan="2">&nbsp;</td>
          <td width="19%">

        </td>
    <td width="11%" height="35" rowspan="2">&nbsp;</td>
  </tr>
  </table>

<%

//-----------------------------------------------------------------------
// Verificamos si tiene algun valor pulsar_buscar, para asi desplegar los
// valores asociados al codigo de catastro deseada
//-----------------------------------------------------------------------

if (buscar_txt == null){ // inicio if 1
%>
<table border="0" align="center" cellpadding="0" cellspacing="0" style="border-collapse: collapse; text-align:center" bordercolor="#111111" width="98%" id="AutoNumber1" height="431">
 
        <tr>
        <p>
        <b><font face="Tahoma" size="2"><a title="Agregar un Establecimiento Nuevo" href="../pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Establecimiento 
	</a></font></b> &nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Cerrar Perfil de Patente" href="../alcalsis.jsp?id_usuarios=<%=id_user%>&login=<%=request.getParameter("login")%>&pass=<%=request.getParameter("pass")%>">Cerrar</a></font></b></p>
          <td width="5%">&nbsp;</td>
          <td width="24%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="19%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <p align="center"><font face="Arial" size="2">No. Patente:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <p align="center"></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Razón 
    Social:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
    <font face="Arial" size="2">Número de Boletín (BIF) :</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
          </td>
          <td width="16%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">RIF:</font></td>
          <td width="19%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="16%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="19%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Cédula:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Propietario/Rep. Legal:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Dirección:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
          </td>
          <td width="16%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Dirección Propietario:</font></td>
          <td width="19%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="16%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="19%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
			<font face="Arial" size="2">Fecha Inicio:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
    <font face="Arial" size="2">Fecha Inscripción:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Reg_Merca:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
          </td>
          <td width="16%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
          </td>
          <td width="19%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="10%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="16%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="19%" align="center" style="border-top-style: solid; border-top-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Capital:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Sector:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
    <font face="Arial" size="2">Status:</font></td>
          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
          </td>
          <td width="16%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Org:</font></td>
          <td width="19%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="16%" align="center">&nbsp;</td>
          <td width="19%" align="center">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" align="center">&nbsp;</td>
          <td width="24%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Obreros:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
          <font face="Arial" size="2">Empleados:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
    <font face="Arial" size="2">Área:</font></td>
          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="16%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="19%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%" height="19">&nbsp;</td>
          <td width="24%" height="19">&nbsp;</td>
          <td width="10%" height="19">&nbsp;</td>
          <td width="10%" height="19">&nbsp;</td>
          <td width="10%" height="19">&nbsp;</td>
          <td width="10%" height="19">&nbsp;</td>
          <td width="10%" height="19">&nbsp;</td>
          <td width="16%" height="19">&nbsp;</td>
          <td width="19%" height="19">&nbsp;</td>
          <td width="11%" height="19">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%">&nbsp;</td>
          <td width="24%">&nbsp;</td>
          <td width="10%">
          
         </td>
          <td width="10%">
          
          </td>
          <td width="10%">
          </td>
          <td width="10%">
          </td>
          <td width="10%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="19%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
        </tr>
        <tr>
          <td width="5%">&nbsp;</td>
          <td width="24%">&nbsp;</td>
          <td width="10%">&nbsp;</td>
          <td width="10%">
          </td>
          <td width="10%">
          </td>
          <td width="10%">
          </td>
          <td width="10%">&nbsp;</td>
          <td width="16%">&nbsp;</td>
          <td width="19%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
        </tr>
      </table>

      <hr>
      
      
<%
} // fin del if (verifica si pulsar_buscar es null) // fin if 1
else // inicio else 1
{
        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular 
        // las conexiones JDBC.
        //---------------------------------------------------------------------

        Statement stmt = null;
        Statement stmt_sector = null;
        ResultSet rcd = null;
        ResultSet rcd_sector = null;

        //----------------------------------------
        // Obtenemos el valor del combox (NRO_PAT)
        //----------------------------------------
        String patent = buscar_txt; 

        String  strquery = "SELECT NRO_PAT,RAZON_SOCIAL,COD_CATA,RIF_CID,CEDULA," +
                "DIRECCION_PRO,PROPIETARIO,DIRECCION,FECHA_INI,FECHA_INS, " +
                "REG_MER,CAPITAL,SECTOR,STATU,ORG,OBREROS,EMPLEADOS,AREA " +
               "FROM establecimientos WHERE NRO_PAT ='" + patent + "'"; 
        
        stmt = con.createStatement();
        
        rcd = stmt.executeQuery(strquery);
        //rcd.getMetaData() getFetchDirection()afterLast() getFetchSize()previous()    beforeFirst()
        //rcd.setFetchSize(1)
        if (rcd.next()) { // inicio if 2

        //--------------------------------------------
        // Asignacion de los resultados de la consulta
        //--------------------------------------------
        patente = rcd.getString("NRO_PAT");
        String razon   = rcd.getString("RAZON_SOCIAL");
        codigo  = rcd.getString("COD_CATA");
        String rif     = rcd.getString("RIF_CID");
        String cedula  = rcd.getString("CEDULA");        
        String dire_p  = rcd.getString("DIRECCION_PRO");
        String propie  = rcd.getString("PROPIETARIO");
        String direcc  = rcd.getString("DIRECCION");
        java.sql.Date fecha_in  = rcd.getDate("FECHA_INI");
        java.sql.Date fecha_is  = rcd.getDate("FECHA_INS");
        String reg_mer  = rcd.getString("REG_MER");
        java.math.BigDecimal capital  = rcd.getBigDecimal("CAPITAL");
        int sector    = rcd.getInt("SECTOR");
        String status   = rcd.getString("STATU"); 
        String org      = rcd.getString("ORG");
        short obreros   = rcd.getShort("OBREROS");
        short empleados = rcd.getShort("EMPLEADOS");
        double area      = rcd.getDouble("AREA");
%>      

        
<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
    <tr>
	</b></a>
	<b><font face="Tahoma" size="2"><a title="Visualizar e Imprimir el Estado de Cuenta de un Establecimiento" href="../patente_edo_cuenta.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Estado 
	de Cuenta</a></font></b>&nbsp;&nbsp;
	<b><font face="Tahoma" size="2"><a title="Liquidar un Establecimiento" href="../pic_liq_simul.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Liquidación 
	Simultanea</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Visualizar las Actividades" href="../pic_act_dec.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Actividades Declaradas 
	</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Agregar,Cambiar de Status de las Actividades" href="../pic_act_def.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Actividades Definidas 
	</a></font></b>&nbsp;&nbsp;
   	    <b><font face="Tahoma" size="2">&nbsp;<a title="Permite Recaudar una Planilla" href="../recaudacion.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&callback=pic_liq_simul.jsp&cedula=<%=cedula%>&pass=<%=pass%>&direccion=<%=direcc%>">Recaudación</a></font></b>&nbsp;&nbsp;
	<p align="left">
	<b><font face="Tahoma" size="2"><a title="Editar el Establecimiento" href="../pic_editar_est.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Editar Establecimiento 
	</a></font></b> &nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Agregar un Establecimiento Nuevo" href="../pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Agregar Establecimiento 
	</a></font></b> &nbsp;&nbsp;
	    <b><font face="Tahoma" size="2"><a title="Solvencia a un establecimiento que no tenga Deuda(s)" href="../pic_certf_solv.jsp?id_usuarios=<%=id_user%>&cod_cata=<%=codigo%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Certificado de Solvencia
	</a></font></b> &nbsp;&nbsp;
	 <b><font face="Tahoma" size="2"><a title="Genera las Declaraciones de Ingresos Brutos del Establecimiento" href="../pic_declara_jurada.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Declaración 
	de Ingresos</a></font></b>&nbsp;&nbsp;       
	<b><font face="Tahoma" size="2"><a title="Cerrar Perfil de Patente" href="../alcalsis.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>">Cerrar</a></font></b>
	</p>
    </tr>
           <td width="10%" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1; border-left-style:solid; border-left-width:1px">&nbsp;</td>
          <td width="10%" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="10%" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="10%" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="11%" bordercolor="#FFE3AA" style="border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="11%" bordercolor="#FFE3AA" style="border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="11%" bordercolor="#FFE3AA" style="border-right-style: none; border-right-width: medium; border-top-style: solid; border-top-width: 1">&nbsp;</td>
          <td width="17%" style="border-left-style: none; border-left-width: medium; border-right-style:solid; border-right-width:1px; border-top-style:solid; border-top-width:1px" bordercolor="#FFE3AA">&nbsp;</td>
        </tr>
  <tr>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <p align="center"><b><font face="Arial" size="2">Nro de 
    Patente:</font></b></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <font face="Arial" size="2"><%
    if (patente != null){
        out.print(patente);
    }%></font>    
    </td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <p align="center"><b><font face="Arial" size="2">Razón 
    Social:</font></b></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <font face="Arial" size="2"><%
    if (razon != null){
        out.print(razon);
    }%></font>
    </td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <b>
    <font face="Arial" size="2">Número de Boletín (BIF):</font></b></td>
    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <font face="Arial" size="2"><%
    if (codigo != null){
        out.print(codigo);
    }%></font>
    &nbsp;</td>
    <td width="18%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <p align="center"><b><font face="Arial" size="2">RIF:</font></b></td>
    <td width="5%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
    <font face="Arial" size="2"><%
    if (rif != null){
        out.print(rif);
    }%></font>&nbsp;</td>
    <td width="11%" height="57" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="10%" align="center">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
          <td width="18%" align="center">&nbsp;</td>
          <td width="5%" align="center">&nbsp;</td>
          <td width="11%" align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Cédula:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (cedula != null){
        out.print(cedula);
    }%></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Propietario/Rep. Legal:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (propie != null){
        out.print(propie);
    }%></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Dirección:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (direcc != null){
        out.print(direcc);
    }%></font>
    &nbsp;</td>
    <td width="18%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Dirección Propietario:</font></b></td>
    <td width="5%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (dire_p != null){
        out.print(dire_p);
    }%></font>
    &nbsp;</td>
    <td width="11%" height="38" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="5%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Fecha Inicio:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (fecha_in != null){
        out.print(sdf.format(fecha_in));
    }%></font>&nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Fecha Inscripción:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (fecha_is != null){
        out.print(sdf.format(fecha_is));
    }%></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Reg_Merca:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (reg_mer != null){
        out.print(reg_mer);
    }%></font>
    &nbsp;</td>
    <td width="18%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="5%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="12%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="5%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <p align="center"><b><font face="Arial" size="2">Capital:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%=capital%></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Sector:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2">
    <%
    
    String  strquery_sector = "SELECT SECTOR,NOMBRE " +
               "FROM tabla_sectores WHERE SECTOR =" + sector + ""; 
        //out.print(strquery_sector);
        stmt_sector = con.createStatement();
        
        rcd_sector = stmt_sector.executeQuery(strquery_sector);

        if (rcd_sector.next()) {

            String nombre_sector = rcd_sector.getString("NOMBRE");

            out.print(nombre_sector);

        }
    %></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Status:</font></b></td>
    <td width="10%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (status != null){
        out.print(status);
    }%></font>
    &nbsp;</td>
    <td width="18%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Org:</font></b></td>
    <td width="5%" bgcolor="#E2E2E2" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%
    if (org != null){
        out.print(org);
    }%></font>
     &nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="10%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="18%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="5%" height="18" align="center" style="border-style: none; border-width: medium"></td>
    <td width="11%" height="18" align="center" style="border-style: none; border-width: medium"></td>
  </tr>
  <tr>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b><font face="Arial" size="2">Obreros:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%=obreros%></font>
     &nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Empleados:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%=empleados%></font>
    &nbsp;</td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <b>
    <font face="Arial" size="2">Área:</font></b></td>
    <td width="10%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
    <font face="Arial" size="2"><%=area%></font>
    &nbsp;</td>
    <td width="18%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;</td>
    <td width="5%" bgcolor="#B7DBFF" height="19" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">&nbsp;
    </td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">
    </td>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">

    </td>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">
    </td>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">
    </td>
    <td width="10%" height="20" align="center" style="border-style: none; border-width: medium">
    </td>
    <td width="18%" height="20" align="center" style="border-style: none; border-width: medium">
    </td>
    <td width="5%" height="20" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="11%" height="20" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="10%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="18%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="5%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="11%" height="19" align="center" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
</table>
      
<%
        } //fin if 3
		
		//····························································
		//Definicion de mes de la funcion bimestre
		String mm="";		
		java.util.Date fecha = new java.util.Date();
		//Formato solo año
        SimpleDateFormat fecha_ano = new SimpleDateFormat("yyyy");
        String ano = fecha_ano.format(fecha);
		//Llamada a la funcion encangada de busacar el bimestre actual
        %>
		<%@ include file="bimetres.jsp" %>
		<%
		//Concatenacion del año y el mes para la cuota
        String bimestre = ano + mm;
		//····························································
		
        //Formato solo mes
        //SimpleDateFormat fecha_mes = new SimpleDateFormat("MM");
        //String mes = fecha_mes.format(fecha);
	
		Statement stmt_sol_inm = null;
		ResultSet rcd_sol_inm = null;
		Statement stmt_sol_pub = null;
		ResultSet rcd_sol_pub = null;
		

        
		//---------------------------------------------------------------------
        // Buscamos en facturas si tiene statu VI, menores que el bimestre
        // actual 
        //---------------------------------------------------------------------
        String  strquery_sol_inm = "SELECT CUOTA,STATU,ID_INSTANCIA " +
               "FROM facturas WHERE ID_OBJ = 'INM' and CUOTA<='" + bimestre + "' and ID_INSTANCIA ='" + codigo + "' and STATU = 'VI'"; 

        //out.print(strquery_sol_inm);

        stmt_sol_inm = con.createStatement();
        
        rcd_sol_inm = stmt_sol_inm.executeQuery(strquery_sol_inm);

        if (rcd_sol_inm.next()) {       
                
			out.print("<table border=0 width=100% cellspacing=1>");
			out.print("<tr>");
			out.print("<td bgcolor=#FFFFCC>");
			out.print("<p align=center><font face=\"Franklin Gothic Book\" size=2>El Inmueble de BIF: " + codigo + " asociado al establecimiento <font color=#FF0000>NO</font> esta Solvente</font></td>");
			out.print("</tr>");
			out.print("</table>");
                 
		}
		//---------------------------------------------------------------------
        // Buscamos en facturas si tiene statu VI, menores que el bimestre
        // actual 
        //---------------------------------------------------------------------
        String  strquery_sol_pub = "SELECT CUOTA,STATU,ID_INSTANCIA " +
               "FROM facturas WHERE ID_OBJ = 'PUB' and CUOTA<='" + bimestre + "' and ID_INSTANCIA ='" + patente + "' and STATU = 'VI'"; 

        //out.print(strquery_sol_inm);

        stmt_sol_pub = con.createStatement();
        
        rcd_sol_pub = stmt_sol_pub.executeQuery(strquery_sol_pub);

        if (rcd_sol_pub.next()) {       
                
			out.print("<table border=0 width=100% cellspacing=1>");
			out.print("<tr>");
			out.print("<td bgcolor=#FFFFCC>");
			out.print("<p align=center><font face=\"Franklin Gothic Book\" size=2>La Publicidad del Nro de Patente: " + patente + "  <font color=#FF0000>NO</font> esta Solvente</font></td>");
			out.print("</tr>");
			out.print("</table>");
                 
		}				   
    }
	

}// fin if 1

        
   }catch (Exception e) {
        out.print("<p><b>");
        out.print("A ocurrido el siguiente error: ");
        out.println(e.toString());
        out.print(" notifiquelo al Administrador");
        out.print("</b></p>");
   }
%>      

    </td>
    <td width="33%" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="34%" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
  <tr>
    <td width="33%" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="33%" style="border-style: none; border-width: medium">&nbsp;</td>
    <td width="34%" style="border-style: none; border-width: medium">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<MAP NAME="patente">
 <AREA SHAPE=RECT NOHREF  ALT="Información de contacto"  COORDS="658,126,661,138">
 <AREA SHAPE=RECT HREF="index.html"  ALT="www.alcalsis.com"  COORDS="601,126,636,136">
 <AREA SHAPE=RECT HREF="ayuda.html"  ALT="Ayuda del site"  COORDS="683,126,720,138">
</MAP>