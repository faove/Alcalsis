<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@page contentType="text/html"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<html>
<head><title>Estado de Cuenta <%
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
<body bgcolor="#FFFFFF" align="center">

<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Estado de cuenta de Inmueble Urbanos
    
---------------------
Date Desarrollador
09/11/2005: FAOVE
modif: 14/09/11
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>
    

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
			<span class="t"><strong>Estado de Cuenta</strong></span>
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
        
      	SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        NumberFormat nf1 = NumberFormat.getCurrencyInstance();
        //--------------------------------------------------------------
        // Obtenemos el valor de boton estado de cuenta de inmueble.jsp
        //--------------------------------------------------------------
               
        String bif = request.getParameter("bif");
        String cod_cata = request.getParameter("cod_cata");
        String dir_inm = request.getParameter("dir_inm");
        String propie = request.getParameter("propie");
        String cedula = request.getParameter("cedula");

        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de inmueble (alcalsis.jsp)
        //----------------------------------------------------------------------------
        //String login = request.getParameter("login");
        String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");
        
		//--------------------------------
		//Variable que se pasa a saldo_obj
		//--------------------------------		
        String id_obj_saldo = "INM";
        String id_instancia_saldo = null;
        double abonos = 0;
        double cargos = 0;
        
        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular 
        // las conexiones JDBC.
        //---------------------------------------------------------------------
        //Connection con = null;
        Statement ps = null;
        ResultSet rs = null;


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
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Bif:</strong></span>										    
			<%
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
			<span class="t"><strong>Dirección:</strong></span>
			<%
           
            if (dir_inm != null){
          	out.print(dir_inm);
            }%>			</ul>
			

			<span class="t"><strong></strong></span>
			<span class="t"><strong></strong></span>
            <span class="t"><strong></strong></span>
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
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t">
			<span class="t"><strong>Propietario:</strong></span>
			<%
            if (propie != null){
                out.print(propie);
            }
            %>
			<span class="t"><strong>Cédula:</strong></span>
			<%
                if (cedula != null){
                    out.print(cedula);
                }%>

             			</ul>
			
			</div>
        	</div>




			<div class="cleared"></div>				        
			<div class="art-content-layout overview-table">
			<div class="art-content-layout-row">
			<div class="art-layout-cell2">
			<div class="overview-table-inner">
			

			<ul class="t"><span class="l"></span><span class="r"></span>
			<span class="t"><strong>Cuotas    </strong></span>
			<span class="t"><strong>Concepto    </strong></span>										    
			<span class="t"><strong>Status    </strong></span>
			<span class="t"><strong>Fecha de Emisión    </strong></span>
			<span class="t"><strong>Fecha de Cancelación</strong></span>
			<span class="t"><strong>Monto   </strong></span>
			<span class="t"><strong>Planilla de Pago</strong></span>
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
        
            
<%
        String  strquery = "select CUOTA,CONCEPTO,STATU,FEC_EMI,FEC_CANCEL," +
                "MONTO,RECARGO,MORA,NRO_PLANI_PAGO " +
                "from facturas WHERE ID_OBJ= 'INM' AND ID_INSTANCIA = '" + bif + "' ORDER BY CUOTA"; 
        
        ps = con.createStatement();

        rs = ps.executeQuery(strquery);
        
        String color = "#C0C0C0";
        
        //---------------------------------
        //Asignacion del Codigo de Catastro
        //---------------------------------
        id_instancia_saldo = bif;
        
        while (rs.next()){ //inicio del while 1
%>
          
                <div class="art-layout-cell5">
				<div class="overview-table-inner">

                <span class="t"><strong>
				<font face="Arial Narrow" size="3">
                <%
                String cuot = rs.getString("CUOTA");
                if (!cuot.equals("null")){
                    out.print(cuot);
                }
                %>
                </strong></span>           

                <span class="t"><strong>                <%
                String concept = rs.getString("CONCEPTO");
                if (!concept.equals("null")){
                    out.print(concept);
                }%></strong></span>

                <span class="t"><strong>                <%
                String sta=rs.getString("STATU");
                if (!sta.equals("null")){
                    out.print(sta);
                }%></strong></span>

                <span class="t"><strong>                
                 <%

                java.sql.Date fecha_emision =rs.getDate("FEC_EMI");

                if (fecha_emision != null){
                    out.print(sdf.format(fecha_emision));
                }

                %>
                
                </strong></span>

                <span class="t"><strong>
                               <%
                java.sql.Date fecha_cancel =rs.getDate("FEC_CANCEL");
                if (fecha_cancel != null){
                    out.print(sdf.format(fecha_cancel));
                }
                %>
                </strong></span>
                <span class="t"><strong>
                <%=rs.getDouble("MONTO")%></strong></span>
                <span class="t"><strong>
                <%
                String numero_planilla = rs.getString("NRO_PLANI_PAGO");
                if (numero_planilla != null){
                    out.print(numero_planilla);
                }
                %>
                </font></strong></span>
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



          
<%
} //fin del; while 1
%>
      
</div>
</div>
  


  <center>
	<div class="art-layout-cell5">
	<div class="overview-table-inner">
	
			<ul class="t">
			<span class="t"><strong>
            <font face="Arial Narrow" size="2">Cargos</font>
            
            <%@ include file="saldo_obj.jsp" %>
            <%=nf1.format(cargos)%>
            
            
            <font face="Arial Narrow" size="2">Abonos</font>
            
            <%=nf1.format(abonos)%>
            
            
            <font face="Arial Narrow" size="2">Saldo</font>
            
            <%

		String saldos = nf1.format(cargos-abonos);
		out.print(saldos);
		%>
		</strong>
		</span>
		</ul>
		<ul class="t">
			<span class="t"><strong>	
          			
				<div class="art-layout-cell">
				<div class="overview-table-inner">		
							<span class="art-button-wrapper">
				        	<span class="l"></span>
				        	<span class="r"></span>
				        	<input class="art-button" type="submit" name="estado" value="Imprimir">
				        	
				        	<form method="POST" action="rpt_est_cuenta_inm.jsp">
							<input type="HIDDEN" value="<%=bif%>" name="buscar_txt">	
							<input type="HIDDEN" value="<%=dir_inm%>" name="dir_inm">                        
							<input type="HIDDEN" value="<%=bif%>" name="bif">
							<input type="HIDDEN" value="<%=cedula%>" name="cedula">
							<input type="HIDDEN" value="<%=abonos%>" name="abono">
							<input type="HIDDEN" value="<%=saldos%>" name="saldo">
							<input type="HIDDEN" value="<%=cargos%>" name="cargo">
							<input type="HIDDEN" value=1 name="opt_patente"> 
							<button name="estado" type="submit">Imprimir</button>
							<input type="HIDDEN" value="<%=propie%>" name="propie">
							<input type="HIDDEN" value="<%=login%>" name="login">
							<input type="HIDDEN" value="<%=pass%>" name="pass">
							<input type="HIDDEN" value="<%=cod_cata%>" name="cod_cata">
							<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
							</form>
							</span>
				</div>
				</div>
	
				<div class="art-layout-cell">
				<div class="overview-table-inner">
						<form method="POST" action="inmueble.jsp">
						<span class="art-button-wrapper">
				    	<span class="l"></span>
				    	<span class="r"></span>
				    	<input class="art-button" type="submit" name="estado" value="Cerrar">
				    	</span>
				    	<input type="HIDDEN" value="<%=bif%>" name="buscar_txt">	
					<input type="HIDDEN" value="<%=dir_inm%>" name="dir_inm">                        
					<input type="HIDDEN" value="<%=bif%>" name="bif">
					<input type="HIDDEN" value="<%=cedula%>" name="cedula">
					<input type="HIDDEN" value=1 name="opt_patente"> 

					<input type="HIDDEN" value="<%=propie%>" name="propie">
					<input type="HIDDEN" value="<%=login%>" name="login">
					<input type="HIDDEN" value="<%=pass%>" name="pass">
					<input type="HIDDEN" value="<%=cod_cata%>" name="cod_cata">
					<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
						</form>
																	
																	
											                	
				    	</div>
				    	</div>

									
			</strong>
			</span>
		</ul>
        </div>
      </div>
  </center>
</div>
<%
}//fin del if 1
   }catch (Exception e) {
        out.print("<p><b>");
        out.print("A ocurrido el siguiente error:");
        out.println(e.toString());
        out.print(" notifiquelo al administrador");
        out.print("</b></p>");
   }
%>
  

</body>
</html>
<MAP NAME="inmueble">
 <AREA SHAPE=RECT NOHREF  ALT="Información de contacto"  COORDS="658,126,661,138">
 <AREA SHAPE=RECT HREF="index.html"  ALT="www.dissoft.com.ve"  COORDS="601,126,636,136">
 <AREA SHAPE=RECT HREF="ayuda.html"  ALT="Ayuda del site"  COORDS="683,126,720,138">
</MAP>