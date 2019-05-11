<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de PIC

   
---------------------
Faove
03/01/05 
Modificado
31/07/2011
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>Menu de Patente de Industria y Comercio </title>

    <link rel="stylesheet" href="../alcalsis/style.css" type="text/css" media="screen" />
    <!--[if IE 6]>
<link rel="stylesheet" href="../alcalsis/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]>
<link rel="stylesheet" href="../alcalsis/style.ie7.css" type="text/css" media="screen" /><![endif]-->

    <script type="text/javascript" src="../alcalsis/script.js"></script>
</head>
<%
Connection con = null;
Statement ps = null;
ResultSet rs = null;
Statement stmt = null;
ResultSet rcd = null;
String login = request.getParameter("login");
String passw = request.getParameter("pass");
%>
<%@ include file="conexion.jsp" %>
<%

%>
<%@ include file="title_usuario.jsp" %>

<body>
    
<%
try{
//Declaraciones:
String campo="NRO_PAT";

String buscar_txt = request.getParameter("buscar_txt");

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

%> 
<%
/*-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Patente

    1 - Perfil basico del Patente.
    2 - Permite buscar un Patente
        operaciones.


---------------------
Date Desarrollador
: 14/11/03 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--*/
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


<div id="art-main">
        <div class="art-sheet">
            <div class="art-sheet-tl"></div>
            <div class="art-sheet-tr"></div>
            <div class="art-sheet-bl"></div>
            <div class="art-sheet-br"></div>
            <div class="art-sheet-tc"></div>
            <div class="art-sheet-bc"></div>
            <div class="art-sheet-cl"></div>
            <div class="art-sheet-cr"></div>
            <div class="art-sheet-cc"></div>
            <div class="art-sheet-body">
                <div class="art-header">
                    <div class="art-header-jpeg"></div>
                    <div class="art-logo">
                        <h1 id="name-text" class="art-logo-name"><a href="#">DisSoft -Alcalsis -</a></h1>
                        <div id="slogan-text" class="art-logo-text">Sistema Inform&aacutetico para la Gesti&oacuten y Recaudaci&oacuten de los Impuesto</div>
                    </div>
                </div>
                <div class="art-nav">
                	<div class="l"></div>
                	<div class="r"></div>
                	<ul class="art-menu">
                		<li>
                			<a href="#" class="active"><span class="l"></span><span class="r"></span><span class="t">Inicio</span></a>
                		</li>
                		<li>
                			<a href="#"><span class="l"></span><span class="r"></span><span class="t">Tributos</span></a>
                			<ul>
                				<li><a href="#">Patente de Insdustria</a>
                					<ul>
                						<li><a title="Agregar un Establecimiento Nuevo" href="../pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Establecimiento</a></li>
                						<li><a href="#">Estado de Cuenta</a></li>
                						<li><a href="#">Menu Subitem 1.3</a></li>
                					</ul>
                				</li>
                				<li><a href="#">Inmuebles Urbanos</a></li>
                				<li><a href="#">Publicidad Comercial</a></li>
                				<li><a href="#">Patente de Vehiculos</a></li>
                			</ul>
                		</li>		
                		<li>
                			<a href="#"><span class="l"></span><span class="r"></span><span class="t">About</span></a>
                		</li>
                	</ul>
                </div>
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-sidebar1">
                            <div class="art-vmenublock">
                                <div class="art-vmenublock-body">
                                            <div class="art-vmenublockheader">
                                                <div class="l"></div>
                                                <div class="r"></div>
                                                 <div class="t">Navigation</div>
                                            </div>
                                            <div class="art-vmenublockcontent">
                                                <div class="art-vmenublockcontent-body">
                                            
                                                            <ul class="art-vmenu">
                                                            	<li>
                                                            		<a href="menu_principal.html?i1"><span class="l"></span><span class="r"></span><span class="t">Inicio</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a  title="Agregar, editar,estado de cuenta,declaración, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=passw%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Estado de Cuenta</a></li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i2"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Top 10</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	<li class="active">
                                                            		<a class="active" href="page.html?i3"><span class="l"></span><span class="r"></span><span class="t">Menu Item</span></a>
                                                            		<ul class="active">
                                                            			<li><a href="page.html?i3s1">Subitem 1</a></li>
                                                            			<li><a href="page.html" class="active">Subitem 2</a></li>
                                                            			<li><a href="page.html?i3s3">Subitem 3</a></li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i4"><span class="l"></span><span class="r"></span><span class="t">Vehiculo</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i5"><span class="l"></span><span class="r"></span><span class="t">Archive</span></a>
                                                            		<ul>
                                                            			<li><a href="page.html?i5s1">2008</a>
                                                            				<ul>
                                                            					<li><a href="page.html?i5s1s1">January</a></li>
                                                            					<li><a href="page.html?i5s1s2">February</a></li>
                                                            					<li><a href="page.html?i5s1s3">March</a></li>
                                                            				</ul>
                                                            			</li>
                                                            			<li><a href="page.html?i5s2">2007</a>
                                                            				<ul>
                                                            					<li><a href="page.html?i5s2s1">January</a></li>
                                                            					<li><a href="page.html?i5s2s2">February</a></li>
                                                            					<li><a href="page.html?i5s2s3">March</a></li>
                                                            				</ul>
                                                            			</li>
                                                            			<li><a href="page.html?i5s3">2006</a>
                                                            				<ul>
                                                            					<li><a href="page.html?i5s3s1">January</a></li>
                                                            					<li><a href="page.html?i5s3s2">February</a></li>
                                                            					<li><a href="page.html?i5s3s3">March</a></li>
                                                            				</ul>
                                                            			</li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i6"><span class="l"></span><span class="r"></span><span class="t">Forum</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i7"><span class="l"></span><span class="r"></span><span class="t">About</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i8"><span class="l"></span><span class="r"></span><span class="t">Contact</span></a>
                                                            	</li>
                                                            </ul>
                                            <!-- /block-content -->
                                            
                                            		<div class="cleared"></div>
                                                </div>
                                            </div>
                            		<div class="cleared"></div>
                                </div>
                            </div>
                            <div class="art-block">
                                <div class="art-block-body">
                                            <div class="art-blockheader">
                                                <div class="l"></div>
                                                <div class="r"></div>
                                                 <div class="t"></div>
                                            </div>
                                            <div class="art-blockcontent">
                                                <div class="art-blockcontent-body">
                                            <!-- block-content -->
                                                            
                                            <!-- /block-content -->
                                            
                                            		<div class="cleared"></div>
                                                </div>
                                            </div>
                            		<div class="cleared"></div>
                                </div>
                            </div>
                            <div class="art-block">
                                <div class="art-block-body">
                                            <div class="art-blockheader">
                                                <div class="l"></div>
                                                <div class="r"></div>
                                                 <div class="t"></div>
                                            </div>
                                            <div class="art-blockcontent">
                                                <div class="art-blockcontent-body">
                                            <!-- block-content -->
                                                            <div>
                                                                              <ul>
                                                                               <li><a href="#">Home</a></li>
                                                                               <li><a href="#">Patente de Industria y Comercio</a></li>
                                                                               <li><a href="#">Inmuebles Urbanos</a></li>
                                                                               <li><a href="#">Publicidad Comercial</a></li>
                                                                               <li><a href="#">Patente de Veh&iacuteculo</a></li>
                                                                               <li><a href="#">Tasas y Otros Tributos</a></li>
                                                                               <li><a href="#" class="visited">Visited link</a></li>
                                                                               <li></li>
                                                                              </ul>
                                                                              
                                                                              <p>
																				&nbsp;</p>
                                                            
                                                                              <p>
																				&nbsp;</p>
                                                                              </div>
                                            <!-- /block-content -->
                                            
                                            		<div class="cleared"></div>
                                                </div>
                                            </div>
                            		<div class="cleared"></div>
                                </div>
                            </div>
                            <div class="art-block">
                                <div class="art-block-body">
                                            <div class="art-blockheader">
                                                <div class="l"></div>
                                                <div class="r"></div>
                                                 <div class="t">&nbsp;Info<span lang="es">rmaci&oacuten 
													de Contacto</span></div>
                                            </div>
                                            <div class="art-blockcontent">
                                                <div class="art-blockcontent-body">
                                            <!-- block-content -->
                                                            <div>
                                                                  <img src="../../../../../../wamp/www/alcalsis/images/contact.jpg" alt="an image" style="margin: 0 auto;display:block;width:95%" />
                                                            <br />
                                                            		<b>C<span lang="es">aracas</span>.</b><br />
                                                            		<b>
																	<span lang="es">
																	Alcasis</span> C<span lang="es">.A.</span></b><br />
                                                            		<span lang="es">
																	Presidente: 
																	Ing. Nelson 
																	Pino</span><br />
                                                            Email: <a href="mailto:info@company.com">info@company.com</a><br />
                                                            		<span lang="es">
																	Analista de 
																	Sistema : 
																	Lcdo. 
																	Francisco 
																	Alvarez</span><br />
                                                            Phone: (<span lang="es">0414</span>) 
																	<span lang="es">
																	824</span>-<span lang="es">2002</span> <br />
                                                            Email: 
																	<a href="mailto:info@company.com">
																	<span lang="es">
																	faove</span>@<span lang="es">hotmail</span>.com</a><br />
                                                            <br />
                                                            </div>
                                            <!-- /block-content -->
                                            
                                            		<div class="cleared"></div>
                                                </div>
                                            </div>
                            		<div class="cleared"></div>
                                </div>
                            </div>
                        </div>
                        <div class="art-layout-cell art-content">
                            <div class="art-post">
                                <div class="art-post-body">
                            <div class="art-post-inner art-article">
                                            <hr>

							<%@ include file="search_pic.jsp" %>    
							 
						
							
							<%
							
							//-----------------------------------------------------------------------
							// Verificamos si tiene algun valor pulsar_buscar, para asi desplegar los
							// valores asociados al codigo de catastro deseada
							//-----------------------------------------------------------------------
							
							if (buscar_txt == null){ // inicio if 1
							%>
							<div class="cleared"></div>
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">


			<div class="art-layout-cell">
			<div class="overview-table-inner">
			<ul>

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
										<font face="Arial" size="2">Raz&oacuten 
							    Social:</font></td>
							          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
							          <td width="10%" bgcolor="#B7DBFF" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
							    <font face="Arial" size="2">N&uacutemero de Bolet&iacuten (BIF) :</font></td>
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
										<font face="Arial" size="2">C&eacutedula:</font></td>
							          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
							          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
										<font face="Arial" size="2">Propietario/Rep. Legal:</font></td>
							          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;</td>
							          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
										<font face="Arial" size="2">Direcci&oacuten:</font></td>
							          <td width="10%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">&nbsp;
							          </td>
							          <td width="16%" bgcolor="#E2E2E2" align="center" bordercolor="#C0C0C0" style="border-top-style: solid; border-top-width: 1px; border-bottom-style: solid; border-bottom-width: 1px">
										<font face="Arial" size="2">Direcci&oacuten Propietario:</font></td>
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
							    <font face="Arial" size="2">Fecha Inscripci&oacuten:</font></td>
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
							    <font face="Arial" size="2">&Aacuterea:</font></td>
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
							
							        stmt = null;
							        Statement stmt_sector = null;
							        rcd = null;
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
								<b><font face="Tahoma" size="2"><a title="Liquidar un Establecimiento" href="../pic_liq_simul.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Liquidaci&oacuten 
								Simultanea</a></font></b>&nbsp;&nbsp;
							        <b><font face="Tahoma" size="2"><a title="Visualizar las Actividades" href="../pic_act_dec.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Actividades Declaradas 
								</a></font></b>&nbsp;&nbsp;
							        <b><font face="Tahoma" size="2"><a title="Agregar,Cambiar de Status de las Actividades" href="../pic_act_def.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Actividades Definidas 
								</a></font></b>&nbsp;&nbsp;
							   	    <b><font face="Tahoma" size="2">&nbsp;<a title="Permite Recaudar una Planilla" href="../recaudacion.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&callback=pic_liq_simul.jsp&cedula=<%=cedula%>&pass=<%=pass%>&direccion=<%=direcc%>">Recaudaci&oacuten</a></font></b>&nbsp;&nbsp;
								<p align="left">
								<b><font face="Tahoma" size="2"><a title="Editar el Establecimiento" href="../pic_editar_est.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Editar Establecimiento 
								</a></font></b> &nbsp;&nbsp;
							        <b><font face="Tahoma" size="2"><a title="Agregar un Establecimiento Nuevo" href="../pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Agregar Establecimiento 
								</a></font></b> &nbsp;&nbsp;
								    <b><font face="Tahoma" size="2"><a title="Solvencia a un establecimiento que no tenga Deuda(s)" href="../pic_certf_solv.jsp?id_usuarios=<%=id_user%>&cod_cata=<%=codigo%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Certificado de Solvencia
								</a></font></b> &nbsp;&nbsp;
								 <b><font face="Tahoma" size="2"><a title="Genera las Declaraciones de Ingresos Brutos del Establecimiento" href="../pic_declara_jurada.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Declaraci&oacuten 
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
							    <p align="center"><b><font face="Arial" size="2">Raz&oacuten 
							    Social:</font></b></td>
							    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
							    <font face="Arial" size="2"><%
							    if (razon != null){
							        out.print(razon);
							    }%></font>
							    </td>
							    <td width="10%" bordercolor="#C0C0C0" bgcolor="#B7DBFF" height="57" align="center" style="border-style: none; border-width: medium">
							    <b>
							    <font face="Arial" size="2">N&uacutemero de Bolet&iacuten (BIF):</font></b></td>
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
							    <p align="center"><b><font face="Arial" size="2">C&eacutedula:</font></b></td>
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
							    <p align="center"><b><font face="Arial" size="2">Direcci&oacuten:</font></b></td>
							    <td width="10%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
							    <font face="Arial" size="2"><%
							    if (direcc != null){
							        out.print(direcc);
							    }%></font>
							    &nbsp;</td>
							    <td width="18%" bgcolor="#E2E2E2" height="38" align="center" style="border-style: none; border-width: medium" bordercolor="#C0C0C0">
							    <p align="center"><b><font face="Arial" size="2">Direcci&oacuten Propietario:</font></b></td>
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
							    <font face="Arial" size="2">&Aacuterea:</font></b></td>
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

                            
                            		<div class="cleared"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="cleared"></div><div class="art-footer">
                    <div class="art-footer-t"></div>
                    <div class="art-footer-l"></div>
                    <div class="art-footer-b"></div>
                    <div class="art-footer-r"></div>
                    <div class="art-footer-body">
                         <a href="#" class="art-rss-tag-icon" title="RSS"></a>
                        <div class="art-footer-text">
                            <p><a href="#">Contacto</a> | <a href="#">Terminos de Uso</a> <br />
                                Copyright &copy; 2011 ---. All Rights Reserved.</p>
                        </div>
                		<div class="cleared"></div>
                    </div>
                </div>
        		<div class="cleared"></div>
            </div>
        </div>
        <div class="cleared"></div>
        <p class="art-page-footer"><a href="http://www.dissoft.com.ve</a> creado por disSoft C.A.</p>
    </div>
    
</body>
</html>
