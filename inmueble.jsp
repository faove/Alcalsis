<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Inmueble Urbanos

    1 - Perfil basico del Contribuyente.
    2 - Permite buscar un contribuyente y realizar diferentes operaciones de sus 
        inmuebles.
    
---------------------
Date Desarrollador
: 10/11/03 FAOVE
: 13/07/05 FAOVE
: 08/09/11 faove
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>


<html>
<head>
<title>Inmuebles Urbanos
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
<body onLoad="asignaVariables();">


<%-- <jsp:useBean id="beanInstanceName" scope="session" class="package.class" /> --%>
<%-- <jsp:getProperty name="beanInstanceName"  property="propertyName" /> --%>
<%

try{
//Declaraciones:
String campo="NRO_PAT";

String buscar_txt = request.getParameter("buscar_txt");

SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");

String varnull = null;
    //------------------------------------------------------------------
    // Validación de entrada, todo usuario del sistema necesita un login
    //------------------------------------------------------------------
  
if ((request.getParameter("login") == null) || (request.getParameter("login")=="")) {

%>
    <p align="left" > Entrada no permitida, por favor verifique su login. <a href="index.html">presione aquí</a></P>
<%
}else{
        //----------------------------------------------------------------------------
        // Obtenemos el valor de boton buscar o del boton de inmueble   (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String BUSCAR = null;
        
        String pulsar_buscar = request.getParameter("Inm");
        
        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de publicidad (alcalsis.jsp)
        //----------------------------------------------------------------------------
        
        String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");

        //-------------------------------
        // Variable de perfil de inmueble
        //-------------------------------

        String propie = null;

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
                        <div class="art-layout-cell art-content">
                            <div class="art-post">
                                <div class="art-post-body">
                            <div class="art-post-inner art-article">
                            
 <div class="cleared"></div>
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			
			
			<div class="art-layout-cell">
			<div class="overview-table-inner">
			<ul>

		    <form method="POST" action="inmueble.jsp">
		    <font face="Arial Narrow">
		    <input type="hidden" value="search" name="Inm">
		    <input type="HIDDEN" value="<%=login%>" name="login">
		    <input type="HIDDEN" value="<%=pass%>" name="pass">	
                    <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
		    <input type="HIDDEN" value="0" name="suminicio">
	 	    <input type="HIDDEN" value="20" name="sumfin">			
			</font>	
			<ul>		
			<font face="Arial Narrow"><input type="radio" value="1" checked name="opt_patente"><font size="2">Nº de Boletín</font></font>
			</ul>
			<ul>
			<font face="Arial Narrow">
			<input type="radio" value="2" name="opt_patente"><font size="2">Código de Catastro</font></font>
			</ul>
			</div>
			</div>
			<div class="art-layout-cell">
			<div class="overview-table-inner">			
				<div id="demo" style="width:269px; height:24px">
					<div id="demoDer"  style="width: 194px; height: 24px">
					  <input name="buscar_txt" type="text" id="input_2" class="input"
						onfocus="if(document.getElementById('lista').childNodes[0]!=null && this.value!='') { filtraLista(this.value); formateaLista(this.value); 
							reiniciaSeleccion(); document.getElementById('lista').style.display='block'; }" 
						onblur="if(v==1) document.getElementById('lista').style.display='none';" 
						onkeyup="if(navegaTeclado(event)==1) {
							clearTimeout(ultimoIdentificador); 
							ultimoIdentificador=setTimeout('rellenaLista()', 1000); }">
					  <div id="lista" onmouseout="v=1;" onmouseover="v=0;" style="position: absolute; left: 76px; top: 25px"></div>
					</div>      
	                <div class="mensaje" id="error"></div>
				</div>
				<ul>
				<font size="2" face="Arial Narrow"><input type="checkbox" name="check_mostrar" value="on">Mostrar 
				Coincidencias</font>
				</ul>
				</div>
				</div>
				<div class="art-layout-cell">
				<div class="overview-table-inner">		
							<span class="art-button-wrapper">
				        	<span class="l"></span>
				        	<span class="r"></span>
				        	<input class="art-button" type="submit" name="Buscar" value="Buscar">
				        	</span>
				        	</form>
				</div>
				</div>

				<div class="art-layout-cell">
				<div class="overview-table-inner">
						<form method="POST" action="menu_principal.jsp">
						<span class="art-button-wrapper">
				    	<span class="l"></span>
				    	<span class="r"></span>
				    	<input class="art-button" type="submit" name="cerrar" value="Cerrar">
				    	</span>
						<input type="HIDDEN" value="<%=login%>" name="login">
						<input type="HIDDEN" value="<%=pass%>" name="pass">  
						<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
						</form>
																	
																	
											                	
				    	</div>
				    	</div>
				    	</div>
				    	</div>
<%
        
        
        
        //String buscar_nro = null;
        
        //out.println(buscar_txt);
	
	    if (buscar_txt != null){
	            
	
	        //---------------------------------------------------------------------
	        // Declaraciones de la pricipales variables utilizadas para manipular 
	        // las conexiones JDBC.
	        //---------------------------------------------------------------------
	        Statement ps = null;
	        ResultSet rs = null;
			//Integer count = null
                //Integer count 
	
	        //con = DriverManager.getConnection(url);
			
                        //String inicio = "0";
                        //String fin = "20";
			//Opción button
						
			int opt_patente = Integer.parseInt(request.getParameter("opt_patente"));
//			boolean flag = Boolean.getBoolean(request.getParameter("flag"));

			String check_mostrar = request.getParameter("check_mostrar");
			
			//out.println(opt_patente);
			
			if (opt_patente == 2) {
				
                            campo = "COD_CATA";

			}else{
				
                            campo = "bif";
		
			}
			
			//out.println(campo);
			
		if (check_mostrar != null){
                        
                        int suminicio = Integer.parseInt(request.getParameter("suminicio"));
                        int rowstot =0;    

                        String  querycount = "select COUNT(bif) from inmuebles WHERE " + campo + " like '" + buscar_txt + "'"; 
		        
		        ps = con.createStatement();
	        
		        //out.println(query1);
	        
                        rs    = ps.executeQuery(querycount);
                        if(rs.next()) {
                            rowstot = rs.getInt(1);
                            //out.println(rowstot);
                        }
			String  query = "select bif,COD_CATA,DIR_INM from inmuebles WHERE " + campo + " like '" + buscar_txt + "' LIMIT " + suminicio + ",20"; 

	        
		        ps = con.createStatement();
	        
		        //out.println(query1);
	        
                        rs    = ps.executeQuery(query);
		        %>

		<table border="0" width="100%" id="table1">
			<tr>
				<td>&nbsp;</td>
				<td>
<%

		        while (rs.next()) { 
			                   

                            String nro_patente = rs.getString("bif");	                
                            String razon_social = rs.getString("COD_CATA");
			    String direc_inm = rs.getString("DIR_INM");				                
                            if (opt_patente == 2) {

                                String resul_busq = "<p><font face=Arial size=2><a href=inmueble.jsp?id_usuarios="+ id_user +"&INM=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + razon_social + " " + nro_patente + " " + direc_inm + "";
		                out.println(resul_busq);
			        out.println("</a></font></p>");

                            }else{

                                String resul_busq = "<p><font face=Arial size=2><a href=inmueble.jsp?id_usuarios="+ id_user +"&INM=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + nro_patente + " " + razon_social + " " + direc_inm + "";
		                out.println(resul_busq);
			        out.println("</a></font></p>");

                            }			

	            }
                    if (rowstot>20){
                        if (suminicio < rowstot){
                            suminicio=suminicio+20;
                            String resul_busq = "<p><font face=Arial size=2><a href=inmueble.jsp?id_usuarios="+ id_user +"&INM=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los siguientes 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }else{
                            suminicio=suminicio-20;
                            String resul_busq = "<p><font face=Arial size=2><a href=inmueble.jsp?id_usuarios="+ id_user +"&INM=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los anteriores 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }
                   }
                            String resul_busq = "<p><font face=Arial size=2><a href=inmueble.jsp?id_usuarios="+ id_user +"&INM=search&login="+ login +"&pass="+ pass +"&opt_patente=1>Regresar Inmueble Urbanos";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
	        %>
	    				
				</td>
				
				<td>&nbsp;
	        <% 
	        //} else { 

		      	//buscar_nro=buscar_txt;
		      	//out.println(buscar_nro);
	      
			}// fin del if del buscar
                 // }//fin de la bandera      
	      } // FIN DEL IF DE CHECK_MOSTRAR  

	      %>				
				</td>
			</tr>
</table>

        <%

//-----------------------------------------------------------------------
// Verificamos si tiene algun valor pulsar_buscar, para asi desplegar los
// valores asociados al codigo de catastro deseada
//-----------------------------------------------------------------------

if (buscar_txt == null){ // inicio if 1
%>
        
        <div class="cleared"></div>
			<div>

        <font face="Tahoma" size="2"><a title="Agregar un Inmueble Nuevo" href="inm_agregar.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=request.getParameter("pass")%>">Agregar un Inmueble</a></font>&nbsp;&nbsp;
        <font face="Tahoma" size="2"><a title="Cerrar Perfil de Inmueble" href="menu_principal.jsp?id_usuarios=<%=id_user%>&login=<%=request.getParameter("login")%>&pass=<%=request.getParameter("pass")%>">Cerrar</a></font>
        </div>         
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t">
			<span class="l"></span><span class="r"></span><span class="t">
			<strong>Bif:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Código Catastro:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Dirección Civil:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Propietario:</strong></span>
			&nbsp;&nbsp;
			</ul>
			
			</div>
        	</div>
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<span class="t"></span></ul>
			
        	</div>
			</div>
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>Fecha Bif:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Exento:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Exonerado:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Cédula:</strong></span>
			&nbsp;&nbsp;
			</ul>
			
			</div>
        	</div>
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Dirección:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Fecha Protocolo:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Fecha Ult Avaluó:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Valor declarado:</strong></span>
			&nbsp;&nbsp;
			<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
        	
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Valor Avaluó:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Impuesto Anual:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Tipo Suelo:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Edificado:</strong></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Uso:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Sub-Uso:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
			<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>


        	</div>
        	</div>

          
       
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
        // Obtenemos el valor del combox (NRO_PAT)
        //----------------------------------------
        String patent = buscar_txt;  

        String  strquery = "SELECT bif,COD_CATA,DIR_INM," +
                "APE_NOM_PRO1,CED_PRO1,FEC_BIF,EXE,EXO,DIRPRO1,FEC_PROTO," +                
                "FEC_ULT_AVA,VALOR_DEC,VALOR_AVALUO,ANUAL,VALOR_BASE,TIP_SUELO,EDIF,USO,SUBUSO " +
               "FROM inmuebles WHERE " + campo + " ='" + patent + "'"; 
        //out.print(strquery);
        stmt = con.createStatement();
        
        rcd = stmt.executeQuery(strquery);

        if (rcd.next()) { // inicio if 2

        //--------------------------------------------
        // Asignacion de los resultados de la consulta
        //--------------------------------------------
        
        String bif              = rcd.getString("bif");
        String cod_cata         = rcd.getString("COD_CATA");
        String dir_inm          = rcd.getString("DIR_INM"); 
        propie           = rcd.getString("APE_NOM_PRO1");        
        String cedula           = rcd.getString("CED_PRO1");        
        java.sql.Date fecha_bif = rcd.getDate("FEC_BIF");        
        String exe              = rcd.getString("EXE");
        String exo              = rcd.getString("EXO");
        String dirpro1          = rcd.getString("DIRPRO1");
        java.sql.Date fecha_pro = rcd.getDate("FEC_PROTO");
        java.sql.Date fecha_ava = rcd.getDate("FEC_ULT_AVA");
        double valor_dec        = rcd.getDouble("VALOR_DEC");
        double valor_ava        = rcd.getDouble("VALOR_AVALUO");
        double valor_base       = rcd.getDouble("ANUAL");
        String tipo_suelo       = rcd.getString("TIP_SUELO");
        String edif       = rcd.getString("EDIF");        
        String uso  = rcd.getString("USO");
        String subuso  = rcd.getString("SUBUSO");
        //out.print(dir_inm);
%>      

        <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2">
                   
        <tr>
        <b><font face="Tahoma" size="2"><a title="Visualizar e Imprimir el Estado de Cuenta de un Inmueble Urbano" href="inmueble_edo_cuenta.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&dir_inm=<%=dir_inm%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>">Estado 
        de Cuenta</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Liquidar un Inmueble Urbano" href="inm_liq_simul.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Liquidación 
        Simultanea</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Crear las Cuotas del Inmueble Urbano a Liquidar" href="inm_liq_anual.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Liquidación Anual</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Solvencia a un Inmueble que no tenga Deuda(s)" href="inm_certf_solv.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Certificado de Solvencia</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2">&nbsp;<a title="Permite Recaudar una Planilla" href="recaudacion.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&nro_pat=<%=bif%>&razon=<%=cod_cata%>&callback=inm_liq_simul.jsp&cedula=<%=cedula%>&pass=<%=pass%>&direccion=<%=dir_inm%>">Recaudación</a></font></b>&nbsp;&nbsp;
        <p><b><font face="Tahoma" size="2"><a title="Agregar un Inmueble Nuevo" href="inm_agregar.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Agregar un Inmueble</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Editar el Inmueble" href="inm_editar.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Editar 
        Inmueble</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Generar Boletín de Información Fiscal" href="inm_boletin.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&bif=<%=bif%>&cod_cata=<%=cod_cata%>&propie=<%=propie%>&cedula=<%=cedula%>&pass=<%=pass%>&dir_inm=<%=dir_inm%>">Boletin Fiscal</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Cerrar Perfil de Inmueble" href="menu_principal.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>">Cerrar</a></font></b></p>
        </tr>
    	</table>
		<div class="cleared"></div>
							        
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Bif:</strong></span>
			<%
            //if (!bif.equals("null")){
            if (bif != null){
          	out.print(bif);
            }
            %>							    
			
			<span class="t"><strong>Código Catastro:</strong></span>
			<%
            //if (!cod_cata.equals("null")){
            if (cod_cata != null){
          	out.print(cod_cata);
            }
            %> 			
            <span class="t"><strong>Dirección Civil:</strong></span>
			<%
            //if (!dir_inm.equals("null")){
            if (dir_inm != null){
          	out.print(dir_inm);
            }%>
            <span class="t"><strong>Propietario:</strong></span>
			<%
            if (propie != null){
                out.print(propie);
            }
            %> 			</ul>
			
			</div>
        	</div>
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			
			<span class="t"></span></ul>
			
        	</div>
			</div>
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Fecha Bif:</strong></span>
			<font face="Arial" size="2">
			 <%
                if (fecha_bif != null){
                    out.print(sdf.format(fecha_bif));
                }
            %></font>
			<span class="t"><strong>Exento:</strong></span>
			<%
                if (exe != null){
                    out.print(exe);
                }%>
            <span class="t"><strong>Exonerado:</strong></span>
			<%
                if (exo != null){
                    out.print(exo);
                }%> 
			<span class="t"><strong>Cédula:</strong></span>
			<%
                if (cedula != null){
                    out.print(cedula);
                }%>
			</ul>
			
			</div>
        	</div>
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Dirección:</strong></span>
			<%
                if (dirpro1 != null){
                    out.print(dirpro1);
                }%>
            <span class="t"><strong>Fecha Protocolo:</strong></span>
			<%
	          if (fecha_pro != null){
	              out.print(sdf.format(fecha_pro));
	          }
            %> 			
            <span class="t"><strong>Fecha Ult. Avaluó:</strong></span>
			<%
	          if (fecha_ava != null){
	              out.print(sdf.format(fecha_ava));
	          }
            %>
            <span class="t"><strong>Valor declarado:</strong></span>
			<%=valor_dec%>
			<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
        	
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Valor Avaluó:</strong></span>
			<%=valor_ava%>
			<span class="t"><strong>Impuesto Anual:</strong></span>
			<%=valor_base%>
			<span class="t"><strong>Tipo Suelo:</strong></span>
			<%
                if (tipo_suelo != null){
                    out.print(tipo_suelo);
                }
        	%>
        	<span class="t"><strong>Edificado:</strong></span>
			<%
            if (edif != null){
                    out.print(edif);
            }%>
			</ul>			
			</div>
        	</div>
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Uso:</strong></span>
			<%
            if (uso != null){
                    out.print(uso);
                }%>
			<span class="t"><strong>Sub-Uso:</strong></span>
			<%
            if (subuso != null){
                    out.print(subuso);
                }%>
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
						<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
        	</div>
        	</div>
      
 
<%
            } //fin if 2
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
        <p class="art-page-footer"><a href="http://www.dissoft.com.ve</a> creado por disSoft C.A.</p></div>

</body>
</html>
