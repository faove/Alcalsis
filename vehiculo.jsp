<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" session="true" %>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head><title>Servicios y Trámites de Vehículo.
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
    <script type="text/javascript" src="index.js"></script>
</head>

<body onLoad="asignaVariables();">

<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Vehículo

    1 - Perfil basico del Vehiculo.
    2 - Permite buscar un vehiculo a través de la placa y realizar diferentes
        operaciones.


---------------------
Date Desarrollador
: 14/11/03 FAOVE
: 02/06/05 FAOVE
: 04/09/11 FAOVE
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
	                				<li><a title="Agregar, editar,estado de cuenta,boletín de informaci&oacuten, liquidar, recaudar inmuebles" href="../inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a></li>
	                				<li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="../publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a></li>
	                				<li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="../vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a></li>
                				</ul>
                			
                		</li>		
                		<li>
                			<a href="contacto.html"><span class="l"></span><span class="r"></span><span class="t">Acerca de..</span></a>
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
                                                            		<a href="menu_principal.html?i1"><span class="l"></span><span class="r"></span><span class="t">Inicio</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a  title="Agregar, editar,estado de cuenta,declaraci&oacuten, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a>
                                                            				<ul>
                                                            			<li><a title="Agregar un Establecimiento Nuevo" href="../alcalsis/pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Establecimiento</a></li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="../alcalsis/publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Agregar nueva Publicidad</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	 
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta,bolet&iacuten de informaci&oacuten, liquidar, recaudar inmuebles" href="../alcalsis/inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Agregar Inmueble</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="../alcalsis/vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a>
                                                            	<ul>
                                                            			<li><a title="Agregar un Vehiculo" href="../alcalsis/veh_nuevo.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=pass%>&login=<%=login%>">Agregar Vehiculo</a></li>
                                                            		</ul>

                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i5"><span class="l"></span><span class="r"></span><span class="t">Tasas y Otros Tributos</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación gen&eacuterica de cualquier tributo" href="../liquidacion_general.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten Gen&eacuterica</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación gen&eacuterica de cualquier tributo" href="../liquidacion_general_sumat.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten SUMAT</span></a>
                                                            		
                                                            	<li>
                                                            		<a title="Cuadro Diario de Caja, Reimpresi&oacuten de Factura, Liquidaci&oacuten previa seg&uacuten G&eacutenero,Liquidaci&oacuten de Oficio PIC " href="../procesos.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Procesos</span></a>
                                                            	</li>
                                                            	<li>
                                                            	<a title="Existen Liquidaciones en Recaudaci&oacuten" href="../recaudacion.jsp?callback=alcalsis.jsp&id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Recaudaci&oacuten</span></a>
                                                            	</li>
                                                            	<%
                
													                //out.print(user);
													            	if (login.equals("administrador")) {
													            %>
													            <li>
                                                            		<a title="Agregar, modificar a los usuarios del sistema" href="../usuarios.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Usuarios</span></a>
                                                            				
                                                            	</li>
                                                            	<li>
                                                            		<a href="../modificar_eliminar_cuotas.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Modificar eliminar cuotas</span></a>
                                                            				
                                                            	</li>
                                                            	<li>
                                                            		<a href="../liberar_planilla_pago.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>"><span class="l"></span><span class="r"></span><span class="t">Liberar Planillas</span></a>
                                                            				
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
                                            <div class="art-blockcontent">
                                                <div class="art-blockcontent-body">
                                            <!-- block-content -->
                                                            <div>
                                                                              <ul>
                                                                               <li><a href="#">Inicio</a></li>
                                                                               <li><a  title="Agregar, editar,estado de cuenta,declaraci&oacuten, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta,bolet&iacuten de informaci&oacuten, liquidar, recaudar inmuebles" href="../inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar publicidades de los establecimientos" href="../publicidad.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Pub=Publicidad"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a></li>
                                                                               <li><a title="Agregar, editar,estado de cuenta, liquidar, recaudar veh&iacuteculos" href="../vehiculo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Veh=Vehículo"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a></li>
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
                           <div class="art-layout-cell art-content">
                            <div class="art-post">
                                <div class="art-post-body">
                            <div class="art-post-inner art-article">
							<%/*-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
							    Módulo de Busquedad para Vehículos
							    
							---------------------
							Date Desarrollador
							: 04/05/05 FAOVE
							: 05/09/11 FAOVE
							---------------------
							    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--*/%> 
					<div class="cleared"></div>
							<div class="art-content-layout overview-table">
							<div class="art-content-layout-row">
				
				
							<div class="art-layout-cell">
							<div class="overview-table-inner">
							<ul>
						    <form method="POST" action="vehiculo.jsp">
	                        <font face="Arial Narrow">
	                        <input type="hidden" value="search" name="veh">
	                        <input type="HIDDEN" value="<%=login%>" name="login">
	                        <input type="HIDDEN" value="<%=pass%>" name="pass">	
	                        <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
	                        <input type="HIDDEN" value="0" name="suminicio">
	                        <input type="HIDDEN" value="20" name="sumfin">			
							</font>	
							<ul>		
							<font face="Arial Narrow"><input type="radio" value="1" checked name="opt_patente"><font size="2">Nº de Placa</font></font>
							</ul>
							<ul>
							<font face="Arial Narrow">
							<input type="radio" value="2" name="opt_patente"><font size="2">Nombre del Propietario</font></font>
							</ul>
							</div>
	  		</div>
			<div class="art-layout-cell">
			<div class="overview-table-inner">

            <div id="demo" style="width:269px;height:24px">
				<div id="demoDer" style="width: 194px; height: 24px">
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
					<div class="cleared"></div>
					<div class="art-content-layout overview-table">
					<div class="art-content-layout-row">
		
		
					<div class="art-layout-cell">
					<div class="overview-table-inner">
					<ul>
								
<%
        
        
        
        //String buscar_nro = null;
        
        //out.println(buscar_txt);
	
	    if (buscar_txt != null){
	        
	        //---------------------------------------------------------------------
	        // Declaraciones de la pricipales variables utilizadas para manipular 
	        // las conexiones JDBC.
	        //---------------------------------------------------------------------
	        //Connection con = null;
	        Statement ps = null;
	        ResultSet rs = null;
                Integer count = null;
                
                //Opción button

                int opt_patente = Integer.parseInt(request.getParameter("opt_patente"));
//			boolean flag = Boolean.getBoolean(request.getParameter("flag"));

                String check_mostrar = request.getParameter("check_mostrar");

                //out.println(opt_patente);

                if (opt_patente == 2) {

                    campo = "NOMBRE";

                }else{

                    campo = "PLACA";

                }

                //out.println(campo);
			
		if (check_mostrar != null){
                        
                        int suminicio = Integer.parseInt(request.getParameter("suminicio"));
                        int rowstot =0;    
                        //int sumfin = Integer.parseInt(request.getParameter("sumfin"));
                        //boolean flag = true;
                /*}else{
                    if (flag != true) {*/
                        String  querycount = "select COUNT(PLACA) from vehiculos WHERE " + campo + " like '" + buscar_txt + "'"; 
		        
		        ps = con.createStatement();
	        
		        //out.println(query1);
	        
                        rs    = ps.executeQuery(querycount);
                        if(rs.next()) {
                            rowstot = rs.getInt(1);
                            //out.println(rowstot);
                        }
			String  query = "select PLACA,NOMBRE,COD_MARCA,COD_MODELO from vehiculos WHERE " + campo + " like '" + buscar_txt + "' LIMIT " + suminicio + ",20"; 
                        //String  query = "select NRO_PAT,RAZON_SOCIAL from ESTABLECIMIENTOS WHERE " + campo + " like '" + buscar_txt + "'"; 
		        //String  query = "select NRO_PAT,RAZON_SOCIAL from ESTABLECIMIENTOS WHERE " + campo + " like '" + buscar_txt + "' TOP 10"; 
		        // WHERE NRO_PAT <> 'NULL'
	        
		        ps = con.createStatement();
	        
		        //out.println(query1);
	        
                        rs    = ps.executeQuery(query);

                        //count    = ps.getFetchSize(query);
                        //count = rs.getRow(query);
                        
                        //out.println(count);
		        %>
			
		
		<table border="0" width="100%" id="table1">
			<tr>
				<td>&nbsp;</td>
				<td>
<%
		        while (rs.next()) { 
			                   

                            String nro_patente = rs.getString("PLACA");	                
                            String razon_social = rs.getString("NOMBRE");
/*							int marca   = rs.getInt("COD_MARCA");
                        	int modelo  = rs.getInt("COD_MODELO");*/
                
                            if (opt_patente == 2) {
                                    String resul_busq = "<p><font face=Arial size=2><a href=vehiculo.jsp?id_usuarios="+ id_user +"&Pic=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + razon_social + " " + nro_patente + "";
		                out.println(resul_busq);
			             
		            	out.println("</a></font></p>");
		            	
                            }else{
                                    String resul_busq = "<p><font face=Arial size=2><a href=vehiculo.jsp?id_usuarios="+ id_user +"&Pic=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + nro_patente + " " + razon_social + "";
		                out.println(resul_busq);
			             
		 
		            	out.println("</a></font></p>");

                            }			
	                
	            }
                    if (rowstot>20){
                        if (suminicio < rowstot){
                            suminicio=suminicio+20;
                            String resul_busq = "<p><font face=Arial size=2><a href=vehiculo.jsp?id_usuarios="+ id_user +"&Pic=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los siguientes 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }else{
                            suminicio=suminicio-20;
                            String resul_busq = "<p><font face=Arial size=2><a href=vehiculo.jsp?id_usuarios="+ id_user +"&Pic=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los anteriores 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }
                   }
                            String resul_busq = "<p><font face=Arial size=2><a href=vehiculo.jsp?id_usuarios="+ id_user +"&Pic=search&login="+ login +"&pass="+ pass +"&opt_patente=1>Regresar Patente de Vehículo";
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
<div class="cleared"></div>
	<div>
	
	<a href="../alcalsis/veh_nuevo.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>">Agregar un Vehículo Nuevo
	</a>
	<a href="../alcalsis.jsp?id_usuarios=<%=id_user%>&login=<%=request.getParameter("login")%>&pass=<%=request.getParameter("pass")%>">Cerrar</a>
	
	</div>
	
	<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>Datos del Vehículo</strong></span>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			
			<span class="t"></span></ul>
			
        	</div>
			</div>

			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>Placa:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Marca:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Modelo:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Año del Vehículo:</strong></span>
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
				<strong>Fecha de Inscripción:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Tipo de Uso:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Costo:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Año de Registro:</strong></span>
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
			<span class="t"><strong>Valor Fiscal:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Fecha de Registro:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
			<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
        	
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"><strong>Datos del Propietario</strong></span>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Nombre:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>CI:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Dirección:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Teléfono:</strong></span>
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
			<span class="t"><strong>No Patente:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>RIF:</strong></span>
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
        String anio_veh          = rcd.getString("ANIO_VEH");
        String anio_ult          = rcd.getString("ANIO_ULT_LIQ");
        java.sql.Date fecha_ult = rcd.getDate("FEC_ULT_PAGO");
        java.sql.Date fecha_adq = rcd.getDate("FEC_ADQ");                		
	java.sql.Date fecha_reg = rcd.getDate("FEC_REG");
        java.sql.Date fecha_ins = rcd.getDate("FEC_INS");                                
        short tipo_uso          = rcd.getShort("TIP_USO");
        java.math.BigDecimal costo  = rcd.getBigDecimal("COSTO");
        String anio_reg          = rcd.getString("ANIO_REG");        
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
			<b><font face="Tahoma" size="2"><a href="../vehiculo_edo_cuenta.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&placa=<%=placa%>&marca=<%=cod_marca%>&modelo=<%=cod_modelo%>&nombre=<%=nombre%>&pass=<%=pass%>">Estado 
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
 	</table>

<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>Datos del Vehículo</strong></span>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>
			
			<span class="t"></span></ul>
			
        	</div>
			</div>

			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>Placa:</strong></span>
				<%
				    if (placa != null){
				        out.print(placa);
				    }
				    %>
			<span class="t"><strong>Marca:</strong></span>
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
            %></font>
    			<span class="t"><strong>Modelo:</strong></span>
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
    		%></font>
			<span class="t"><strong>Año del Vehículo:</strong></span>
			<font face="Arial" size="2"><%=anio_veh%> </font>
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
				<strong>Fecha de Inscripción:</strong></span>
			<font face="Arial" size="2"><%
		    if (fecha_ins != null){
		        out.print(sdf.format(fecha_ins));
		    }
		    %></font>
			<span class="t"><strong>Tipo de Uso:</strong></span>
			 <font face="Arial" size="2"><%
    
    						String  strquery_tipo = "SELECT TIPO_VEHICULO,DESCRIPCION " +
                                   "FROM tab_veh_tipo_uso where TIPO_VEHICULO = " + tipo_uso + ""; 
                            
                            stmt_tipo = con.createStatement();

                            rcd_tipo = stmt_tipo.executeQuery(strquery_tipo);
                            
                            
                            while (rcd_tipo.next()) {
							
                                String descripcion = rcd_tipo.getString("DESCRIPCION");
                                
                                out.print(descripcion);

                            }
    
    %></font>
			<span class="t"><strong>Costo:</strong></span>
			<font face="Arial" size="2"><%=costo%></font>
			<span class="t"><strong>Año de Registro:</strong></span>
			<font face="Arial" size="2"><%=anio_reg%></font>
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
			<span class="t"><strong>Valor Fiscal:</strong></span>
			<font face="Arial" size="2"><%=valor_fiscal%></font>
			
			<span class="t"><strong>Fecha de Registro:</strong></span>
			<font face="Arial" size="2"><%
		    if (fecha_reg != null){
		        out.print(sdf.format(fecha_reg));
		    }
		    %></font>
			<span class="t"><strong></strong></span>
			&nbsp;&nbsp;
			<span class="t"></span>
			&nbsp;&nbsp;
			</ul>			
			</div>
        	</div>
        	
        	<div class="art-content-layout-row">
        	<div class="art-layout-cell">
			<ul class="t"><span class="l"></span><span class="r">
			</span><span class="t"><strong>Datos del Propietario</strong></span>
			<span class="t"></span>
			<font face="Arial" size="2"></font>
			<span class="t"></span>			
			<span class="t"></span></ul>			
        	</div>
			</div>
			
			<div class="art-layout-cell3">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Nombre:</strong></span>
			<font face="Arial" size="2"><%=nombre%></font>
			<span class="t"><strong>CI:</strong></span>
			<font face="Arial" size="2"><%=ci_rif%></font>
			<span class="t"><strong>Dirección:</strong></span>
			<font face="Arial" size="2"><%=direccion%></font>
			<span class="t"><strong>Teléfono:</strong></span>
			<font face="Arial" size="2"><%=tel%></font>
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
			<span class="t"><strong>No Patente:</strong></span>
			<font face="Arial" size="2"><%=nro_pat%></font>
			<span class="t"><strong>RIF:</strong></span>
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
          } //fin if 3
    }      
}// fin if 1
%>
    
</body>
</html>
<MAP NAME="vehiculo">
 <AREA SHAPE=RECT NOHREF  ALT="Información de contacto"  COORDS="658,126,661,138">
 <AREA SHAPE=RECT HREF="index.html"  ALT="www.alcalsis.com"  COORDS="601,126,636,136">
 <AREA SHAPE=RECT HREF="ayuda.html"  ALT="Ayuda del site"  COORDS="683,126,720,138">
</MAP>