<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.math.*" %>
<%! String Canc; %>

<html>
<head>
<meta http-equiv="Content-Language" content="es">
<title>Liquidación INM
<%
Connection con = null;
%>

<%@ include file="conexion.jsp" %>
<%
String login = request.getParameter("login");
%>
<%@ include file="title_usuario.jsp" %>
</title>
<link rel="stylesheet" href="../alcalsis/style.css" type="text/css" media="screen" />
    <!--[if IE 6]>
    
	<link rel="stylesheet" href="../alcalsis/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]>
    
	<link rel="stylesheet" href="../alcalsis/style.ie7.css" type="text/css" media="screen" /><![endif]-->
	
	<link rel="stylesheet" type="text/css" href="patente.css">
	
    <script type="text/javascript" src="../alcalsis/script.js"></script>
    
    <script type="text/javascript" src="inmueble.js"></script>

</head>

<body  bgcolor="#FFFFFF" align="center">
<%-- <jsp:useBean id="beanInstanceName" scope="session" class="package.class" /> --%>
<%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>
<div class="cleared"></div>
			<div>
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t">
			<span class="l"></span><span class="r"></span><span class="t">
			<strong></strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Liquidación Simultanea</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
			</ul>
			
			</div>
        	</div>
        	</div>
        	</div>


<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Liquidaciòn Simultanea de - INM -

    1 - Permite emitir aviso de cobro y liquidar cuotas a un contribuyente.


---------------------
Date Desarrollador
13/07/05:  FAOVE
modificacion: 19-11-11 faove@hotmail.com
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
<%
try{ 

//----------------------------------------------------------------------------
// Obtenemos el usuario y su password o del boton de publicidad (alcalsis.jsp)
//----------------------------------------------------------------------------

String pass  = request.getParameter("pass");
String id_user  = request.getParameter("id_usuarios");
//------------------------------------------------------------------
// Validación de entrada, todo usuario del sistema necesita un login
//------------------------------------------------------------------

if ((request.getParameter("login") == null) || (request.getParameter("login")=="")) { //inicio if 1
%>
    <p align="center" > Entrada no permitida, por favor verifique su login. <a href="index.html">presione aquí</a></P>

<%
}else{
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
                					<li><a  title="Agregar, editar,estado de cuenta,declaraci&oacuten, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a></li>
	                				<li><a title="Agregar, editar,estado de cuenta,boletín de informaci&oacuten, liquidar, recaudar inmuebles" href="inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a></li>
	                				<li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a></li>
	                				<li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a></li>
                				</ul>
                			
                		</li>		
                		<li>
                			<a href="contacto.html"><span class="l"></span>
							<span class="r" style="left: -302px; right: 0; top: 0"></span><span class="t">Acerca de..</span></a>
                		</li>
                	</ul>
                </div>
                <div class="art-content-layout">
                    <div class="art-content-layout-row">
                        <div class="art-layout-cell art-sidebar1">
                            <div class="art-vmenublock">
                                <div class="art-vmenublock-body">
                                            <div class="art-vmenublockheader" style="left: 0px; top: 0px">
                                                <div class="l"></div>
                                                <div class="r"></div>
                                                 <div class="t">Alcalsis</div>
                                            </div>
                                            <div class="art-vmenublockcontent">
                                                <div class="art-vmenublockcontent-body">
                                            
                                                                <ul class="art-vmenu">
                                                            	<li>
                                                            		<a href="menu_principal.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>""><span class="l"></span><span class="r"></span><span class="t">Inicio</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a  title="Agregar, editar,estado de cuenta,declaraci&oacuten, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a>
                                                            				<ul>
                                                            			<li><a title="Agregar un Establecimiento Nuevo" href="pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Establecimiento</a></li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a>
                                                            				
                                                            	</li>

                                                            	 
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta,bolet&iacuten de informaci&oacuten, liquidar, recaudar inmuebles" href="inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a>
                                                            				<ul>
                                                            			<li><a title="Agregar un Inmueble Nuevo" href="inm_agregar.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=request.getParameter("pass")%>">Agregar un Inmueble</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a>
                                                            		<ul>
                                                            			<li><a title="Agregar un Vehiculo" href="veh_nuevo.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Vehiculo</a></li>
                                                            		</ul>

                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i5"><span class="l"></span><span class="r"></span><span class="t">Tasas y Otros Tributos</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación gen&eacuterica de cualquier tributo" href="liquidacion_general.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten Gen&eacuterica</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación gen&eacuterica de cualquier tributo" href="liquidacion_general_sumat.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten SUMAT</span></a>
                                                            		
                                                            	<li>
                                                            		<a title="Cuadro Diario de Caja, Reimpresi&oacuten de Factura, Liquidaci&oacuten previa seg&uacuten G&eacutenero,Liquidaci&oacuten de Oficio PIC " href="procesos.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Procesos</span></a>
                                                            	</li>
                                                            	<li>
                                                            	<a title="Existen Liquidaciones en Recaudaci&oacuten" href="recaudacion.jsp?callback=alcalsis.jsp&id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Recaudaci&oacuten</span></a>
                                                            	</li>
                                                            	<%
                
													                //out.print(user);
													            	if (login.equals("administrador")) {
													            %>
													            <li>
                                                            		<a title="Agregar, modificar a los usuarios del sistema" href="usuarios.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Usuarios</span></a>
                                                            				
                                                            	</li>
                                                            	<li>
                                                            		<a href="modificar_eliminar_cuotas.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Modificar eliminar cuotas</span></a>
                                                            				
                                                            	</li>
                                                            	<li>
                                                            		<a href="liberar_planilla_pago.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Liberar Planillas</span></a>
                                                            				
                                                            	</li>

                                                            	<%
														          }
														        %>



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
                                            <div class="art-blockcontent" style="left: 0px; top: 0px">
                                                <div class="art-blockcontent-body">
                                            <!-- block-content -->
                                                            <div>
                                                                              <ul>
                                                                               <li><a href="#">Inicio</a></li>
                                                                               <li><a  title="Agregar, editar,estado de cuenta,declaraci&oacuten, liquidar, recaudar establecimientos" href="../alcalsis/patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta,bolet&iacuten de informaci&oacuten, liquidar, recaudar inmuebles" href="../alcalsis/inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="../alcalsis/publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="../alcalsis/vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a></li>
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
                                                                  <img src="../alcalsis/images/contact.jpg" alt="an image" style="margin: 0 auto;display:block;width:95%" />
                                                            <br />
                                                            		<b>C<span lang="es">aracas</span>.</b><br />
                                                            		<b>
																	<span lang="es">
																	Alcasis</span> C<span lang="es">.A.</span></b><br />
                                                            		<span lang="es">
																	Presidente: 
																	Ing. Nelson 
																	Pino</span><br />
                                                            Email: <a href="mailto:npino34@gmail.com">npino34@gmail.com</a><br />
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
																	<a href="mailto:faove@hotmail.com">
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
                        
			<div class="cleared"></div>				        
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			


    <%

        //---------------------------------------------------------------
        // Obtenemos el valor de boton liq simul de patente (patente.jsp)
        //---------------------------------------------------------------

        String bif = request.getParameter("bif");
        String cod_cata   = request.getParameter("cod_cata");
        String dir_inm  = request.getParameter("dir_inm");
        String propie  = request.getParameter("propie");
        String cedula  = request.getParameter("cedula");
        //------------------------------------------------------
        // Obtenemos los valores del boton cerrar de recaudacion
        //------------------------------------------------------

        if (bif == null){
            cod_cata   = request.getParameter("nro_pat");
            dir_inm  = request.getParameter("direccion");
            bif = request.getParameter("razon");
        }
%>
  <ul>   
   <!-- <td width="11%" bordercolor="#000080" height="81" align="center">
    
	<font size="2" face="Arial Narrow">Recaudadores:</font></b>-->
    <%  


        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular
        // las conexiones JDBC.
        //---------------------------------------------------------------------

/*        Statement ps = null;
        ResultSet rs = null;

        String  query = "SELECT Id_Recaudador, Nombre FROM tab_recaudador";

        ps = con.createStatement();

        rs = ps.executeQuery(query);*/

    %>
   <!-- <form method="POST" action="inm_liq_simul.jsp">
    <input type="hidden" value="search" name="Pic">
    <input type="HIDDEN" value="<%=login%>" name="login">
    <input type="HIDDEN" value="<%=pass%>" name="pass">
    <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">-->

        
        <!--<select size="3" name="recaudador">-->
        <%
/*            while (rs.next()) {
                String nombre = rs.getString("Nombre");
		String id_rec = rs.getString("Id_Recaudador");
                out.println("<option value=" + id_rec + ">" + nombre + "");
            }
            out.println("</option>");*/
        %>
        <!--</select>
        </form>
    </td>-->
    <font face="Arial" size="2">Nro de
    Catastro:</font>
    
    <span lang="es"><font face="AvantGarde Bk BT" size="2"><b><%
            if (cod_cata != null){
                out.print(cod_cata);
            }
            %></b></font></span>
    <font face="Arial" size="2">Boletín
    :</font>
    
    <p align="center"><b><span lang="es">
    <font face="AvantGarde Bk BT" size="2"><%
            if (bif != null){
                out.print(bif);
            }%></font></span></b></ul>
    
        
  
  <ul>
    
    
    <font face="Arial" size="2">Dirección:</font>
    <p align="center"><b><span lang="es">
    <font face="AvantGarde Bk BT" size="2"><%
            if (dir_inm != null){
                out.print(dir_inm);
            }%></font></span></b>
    
  
  
  </ul>
  <ul>  
  <%@ include file="inm_cuotas.jsp" %>
  </ul>	
  


<%
    }// fin if 1

   }catch (Exception e) {
        out.print("<p><b>");
        out.print("A ocurrido el siguiente error: ");
        out.println(e.toString());
        out.print(" notifiquelo al Administrador");
        out.print("</b></p>");
   }
%>

  
  

</body>
</html>