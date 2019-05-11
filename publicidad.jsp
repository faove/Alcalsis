<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" session="true" %>

<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<head>
	
	<title>Servicios y Trámites de Publicidad Comercial.
	<% Connection con = null; %>
	<%@ include file="conexion.jsp" %>
	<%
	String login = request.getParameter("login");
	%>
	<%

	//Declaraciones:
	String campo="NRO_PAT";
	
	String buscar_txt = request.getParameter("buscar_txt");
	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
	%>
	</title>
	
	<link rel="stylesheet" href="../alcalsis/style.css" type="text/css" media="screen" />
    <!--[if IE 6]>
    
	<link rel="stylesheet" href="../alcalsis/style.ie6.css" type="text/css" media="screen" /><![endif]-->
    <!--[if IE 7]>
    
	<link rel="stylesheet" href="../alcalsis/style.ie7.css" type="text/css" media="screen" /><![endif]-->
	
	<link rel="stylesheet" type="text/css" href="patente.css">
	
    <script type="text/javascript" src="../alcalsis/script.js"></script>
    
    <script type="text/javascript" src="publicidad.js"></script>

</head>
<body onLoad="asignaVariables();">

<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Publicidad Comercial

    1 - Perfil basico del Contribuyente.
    2 - Permite buscar un contribuyente y realizar diferentes operaciones de sus 
        publicidad.
    
---------------------
Date Desarrollador
: 03/11/03 FAOVE
: 07/09/11 faove
---------------------

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>


    
  
<%
try{
    //------------------------------------------------------------------
    // Validación de entrada, todo usuario del sistema necesita un login
    //------------------------------------------------------------------
  
if ((request.getParameter("login") == null) || (request.getParameter("login")=="")) {

%>
    <p align="center" > Entrada no permitida, por favor verifique su login. <a href="index.html">presione aquí</a></P>
<%
}else{

        //----------------------------------------------------------------------------
        // Obtenemos el valor de boton buscar o del boton de publicidad (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String BUSCAR = null;
        String pulsar_buscar = request.getParameter("Pub");
        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de publicidad (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");
        String codigo = "";
        String patente = "";
        String direcc = "";
        String razon = ""; 

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
                                                            				<ul>
                                                            			<li><a title="Crear una Publicidad Comercial" href="pub_crear.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Crear una Publicidad</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	 
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta,bolet&iacuten de informaci&oacuten, liquidar, recaudar inmuebles" href="inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=login%>&pass=<%=pass%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Agregar Inmueble</a></li>
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
         
         
         


<%//@ include file="search_pub.jsp" %>
			<div class="cleared"></div>
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			
			
			<div class="art-layout-cell">
			<div class="overview-table-inner">
			<ul>
		    <form method="POST" action="publicidad.jsp">
		    <font face="Arial Narrow">
		    <input type="hidden" value="search" name="Pub">
		    <input type="HIDDEN" value="<%=login%>" name="login">
		    <input type="HIDDEN" value="<%=pass%>" name="pass">	
            <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
		    <input type="HIDDEN" value="0" name="suminicio">
	 	    <input type="HIDDEN" value="20" name="sumfin">			
			</font>	
			<ul>		
			<font face="Arial Narrow">
			<input type="radio" value="1"  name="opt_patente"><font size="2">Nº de Patente</font></font>
			</ul>
			<ul>
			<font face="Arial Narrow">
			<input type="radio" value="2" checked name="opt_patente"><font size="2">Razón Social</font></font>
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
	        // Conexion a la base de datos, a traves de ODBC, guardado como SIAGEP
	        //---------------------------------------------------------------------
	        
	        //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	
	        //---------------------------------------------------------------------
	        // Declaraciones de la pricipales variables utilizadas para manipular 
	        // las conexiones JDBC.
	        //---------------------------------------------------------------------
	        //Connection con = null;
	        Statement ps = null;
	        ResultSet rs = null;
                Integer count = null;
                
	        //String url = "jdbc:odbc:SIAGEPWEB";
	
	        //con = DriverManager.getConnection(url);
			
                        //String inicio = "0";
                        //String fin = "20";
			//Opción button
						
			int opt_patente = Integer.parseInt(request.getParameter("opt_patente"));
//			boolean flag = Boolean.getBoolean(request.getParameter("flag"));

			String check_mostrar = request.getParameter("check_mostrar");
			
			//out.println(opt_patente);
			
			if (opt_patente == 2) {
				
                            campo = "RAZON_SOCIAL";

			}else{
				
                            campo = "NRO_PAT";
		
			}
			
			//out.println(campo);
			
		if (check_mostrar != null){
                        
                        int suminicio = Integer.parseInt(request.getParameter("suminicio"));
                        int rowstot =0;    
                        //int sumfin = Integer.parseInt(request.getParameter("sumfin"));
                        //boolean flag = true;
                /*}else{
                    if (flag != true) {*/
                        String  querycount = "select COUNT(NRO_PAT) from establecimientos WHERE " + campo + " like '" + buscar_txt + "'"; 
		        
		        ps = con.createStatement();
	        
		        //out.println(query1);
	        
                        rs    = ps.executeQuery(querycount);
                        if(rs.next()) {
                            rowstot = rs.getInt(1);
                            //out.println(rowstot);
                        }
			String  query = "select NRO_PAT,RAZON_SOCIAL from establecimientos WHERE " + campo + " like '" + buscar_txt + "' LIMIT " + suminicio + ",20"; 
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
			                   

                            String nro_patente = rs.getString("NRO_PAT");	                
                            String razon_social = rs.getString("RAZON_SOCIAL");
							                
                            if (opt_patente == 2) {
                                    String resul_busq = "<p><font face=Arial size=2><a href=publicidad.jsp?id_usuarios="+ id_user +"&Pub=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + razon_social + " " + nro_patente + "";
		                out.println(resul_busq);
			             
		            	out.println("</a></font></p>");
		            	
                            }else{
                                    String resul_busq = "<p><font face=Arial size=2><a href=publicidad.jsp?id_usuarios="+ id_user +"&Pub=search&campo="+ campo +"&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + nro_patente + ">" + nro_patente + " " + razon_social + "";
		                out.println(resul_busq);
			             
		 
		            	out.println("</a></font></p>");

                            }			
	                
	            }
                    if (rowstot>20){
                        if (suminicio < rowstot){
                            suminicio=suminicio+20;
                            String resul_busq = "<p><font face=Arial size=2><a href=publicidad.jsp?id_usuarios="+ id_user +"&Pub=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los siguientes 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }else{
                            suminicio=suminicio-20;
                            String resul_busq = "<p><font face=Arial size=2><a href=publicidad.jsp?id_usuarios="+ id_user +"&Pub=search&suminicio=" + suminicio + "&login="+ login +"&pass="+ pass +"&opt_patente=1&buscar_txt=" + buscar_txt + "25&check_mostrar=on>Los anteriores 20";
                            out.println(resul_busq);
                            out.println("</a></font></p>");
                        }
                   }
                            String resul_busq = "<p><font face=Arial size=2><a href=publicidad.jsp?id_usuarios="+ id_user +"&Pub=search&login="+ login +"&pass="+ pass +"&opt_patente=1>Regresar Publicidad Comercial";
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
// valores asociados a tal nro de patente deseada
//-----------------------------------------------------------------------

if (buscar_txt == null){ // inicio if 1
%>
			<div class="cleared"></div>
			<div>
		
			<a title="Crear una Publicidad Comercial" href="pub_crear.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Crear una Publicidad
			</a>
			<a title="Cerrar Perfil de Publicidad" href="menu_principal.jsp?login=<%=request.getParameter("login")%>&pass=<%=request.getParameter("pass")%>">Cerrar</a>							
			</div>         
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			<ul class="t"><span class="l"></span><span class="r"></span><span class="t">
				<strong>No. Patente:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Raz&oacuten Social:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Cod. Catastro:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>RIF:</strong></span>
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
				<strong>C&eacutedula:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Propietario/Rep. Legal:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Direcci&oacuten:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Direcci&oacuten Propietario:</strong></span>
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
			<span class="t"><strong>Fecha Inicio:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Fecha Inscripci&oacuten:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Reg_Merca:</strong></span>
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
			<span class="t"><strong>Capital:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Sector:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Status:</strong></span>
			&nbsp;&nbsp;
			<span class="t"><strong>Org:</strong></span>
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
			<span class="t"><strong>Obreros:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>Empleados:</strong></span>
			<font face="Arial" size="2">&nbsp;&nbsp;</font>
			<span class="t"><strong>&Aacuterea:</strong></span>
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
        Statement stmt_sector = null;
        ResultSet rcd = null;
        ResultSet rcd_sector = null;
        //----------------------------------------
        // Obtenemos el valor del combox (NRO_PAT)
        //----------------------------------------
        //String nro_patente = buscar_nro;
        String patent = buscar_txt;  
        /*String  strquery = "SELECT * " +
               "FROM ESTABLECIMIENTOS WHERE NRO_PAT ='" + buscar_txt + "'"; */
               
        String  strquery = "SELECT NRO_PAT,RAZON_SOCIAL,COD_CATA,RIF_CID,CEDULA," +
                "DIRECCION_PRO,PROPIETARIO,DIRECCION,FECHA_INI,FECHA_INS," +                
                "REG_MER,CAPITAL,SECTOR,STATU,ORG,OBREROS,EMPLEADOS,AREA " +
               "FROM establecimientos WHERE " + campo + " ='" + patent + "'"; 
        
        stmt = con.createStatement();
        
       // out.println(strquery);
        
        rcd = stmt.executeQuery(strquery);

        if (rcd.next()) { // inicio if 2

        //--------------------------------------------
        // Asignacion de los resultados de la consulta
        //--------------------------------------------
        patente = rcd.getString("NRO_PAT");
        razon   = rcd.getString("RAZON_SOCIAL");
        codigo  = rcd.getString("COD_CATA");
        String rif     = rcd.getString("RIF_CID");
        String cedula  = rcd.getString("CEDULA");        
        String dire_p  = rcd.getString("DIRECCION_PRO");
        String propie  = rcd.getString("PROPIETARIO");
        direcc  = rcd.getString("DIRECCION");
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
	<b><font face="Tahoma" size="2"><a title="Visualizar e Imprimir el Estado de Cuenta de la Publicidad" href=".publicidad_edo_cuenta.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Estado 
	de Cuenta</a></font></b>&nbsp;&nbsp;
	<b><font face="Tahoma" size="2"><a title="Liquidar la Publicidad Comercial" href="pub_liq_simul.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Liquidación 
	simultanea</a></font></b>&nbsp;&nbsp;
        <b><font face="Tahoma" size="2"><a title="Crear una Publicidad Comercial" href="pub_crear.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Crear una Publicidad
	</a></font></b> &nbsp;&nbsp;
	<b><font face="Tahoma" size="2"><a title="Editar la Publicidad Comercial" href="pub_editar.jsp?id_usuarios=<%=id_user%>&pass=<%=pass%>&login=<%=login%>&nro_pat=<%=patente%>&razon=<%=razon%>&direccion=<%=direcc%>">Editar Publicidad
	</a></font></b> &nbsp;&nbsp;
        
	<p align="left"><b><font face="Tahoma" size="2"><a title="Cerrar Perfil de Publicidad" href="menu_principal.jsp?login=<%=login%>&pass=<%=pass%>">Cerrar</a></font></b></p>

    </tr>
    </table>
<div class="cleared"></div>
							        
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>No. Patente:</strong></span>
			<%
							    if (patente != null){
							        out.print(patente);
							    }%>
							    
			
			<span class="t"><strong>Raz&oacuten Social:</strong></span>
			<%
							    if (razon != null){
							        out.print(razon);
							    }%>
			<span class="t"><strong>N&uacutemero de Bolet&iacuten (BIF):</strong></span>
			<%
							    if (codigo != null){
							        out.print(codigo);
							    }%>
			<span class="t"><strong>RIF:</strong></span>
			<%
							    if (rif != null){
							        out.print(rif);
							    }%>
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
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>C&eacutedula:</strong></span>
			<font face="Arial" size="2"><%
							    if (cedula != null){
							        out.print(cedula);
							    }%></font>
			<span class="t"><strong>Propietario/Rep. Legal:</strong></span>
			<%
							    if (propie != null){
							        out.print(propie);
							    }%>
			<span class="t"><strong>Direcci&oacuten:</strong></span>
			<%
							    if (direcc != null){
							        out.print(direcc);
							    }%>
			<span class="t"><strong>Direcci&oacuten Propietario:</strong></span>
			<%
							    if (dire_p != null){
							        out.print(dire_p);
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
			<span class="t"><strong>Fecha Inicio:</strong></span>
			<%
							    if (fecha_in != null){
							        out.print(sdf.format(fecha_in));
							    }%>
			<span class="t"><strong>Fecha Inscripci&oacuten:</strong></span>
			<%
							    if (fecha_is != null){
							        out.print(sdf.format(fecha_is));
							    }%>
			<span class="t"><strong>Reg_Merca:</strong></span>
			&nbsp;&nbsp;<%
							    if (reg_mer != null){
							        out.print(reg_mer);
							    }%>
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
			<span class="t"><strong>Capital:</strong></span>
			<%=capital%>
			<span class="t"><strong>Sector:</strong></span>
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
							    %>
			<span class="t"><strong>Status:</strong></span>
			<%
							    if (status != null){
							        out.print(status);
							    }%>
			<span class="t"><strong>Org:</strong></span>
			<%
							    if (org != null){
							        out.print(org);
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
			<span class="t"><strong>Obreros:</strong></span>
			<%=obreros%>
			<span class="t"><strong>Empleados:</strong></span>
			<%=empleados%>
			<span class="t"><strong>&Aacuterea:</strong></span>
			&nbsp;&nbsp;<%=area%>
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
        <p class="art-page-footer"><a href="http://www.dissoft.com.ve</a> creado por disSoft C.A.</p>
    </div>

</body>
</html>
<MAP NAME="publicidad">
 <AREA SHAPE=RECT NOHREF  ALT="Información de contacto"  COORDS="658,126,661,138">
 <AREA SHAPE=RECT HREF="index.html"  ALT="www.alcalsis.com"  COORDS="601,126,636,136">
 <AREA SHAPE=RECT HREF="ayuda.html"  ALT="Ayuda del site"  COORDS="683,126,720,138">
</MAP>