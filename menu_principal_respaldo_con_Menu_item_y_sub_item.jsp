<%@page import="java.util.*" session="true"%>
<%@page contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>


<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Menu Principal de Sistema Automatizado de Gestion Publica

    1 - Se valida la entrada del usuario verificando el password y login suministrado
        desde index.html, los parametros que envia index.html son login y pass.
    2 - Si el usuario intenta inicializar alcalsis.jsp si suministrar el login
        y password el sistema no se lo permite, siendo esta la primera validacion
        que se realiza.
    3 - Este modulo indica al usuario las diversas operaciones que puede realizar:
        3.1 - PIC.
        3.2 - PUB.
        3.3 - VEH.
        3.4 - INM.
        3.5 - Procesos.
        3.6 - Informes.

---------------------
Date Desarrollador
: 27/10/03 FAOVE
Modificado
: 24/07/11 faove
---------------------

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US" xml:lang="en">
<head>
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    
    <title>Menu Prinicpal de Alcalsis </title>

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
<%@ include file="title_usuario.jsp" %>

<body>
<%
String user = login;

//String user = request.getParameter("id");

//String passw = request.getParameter("pa");

int id_user=0;
        
%>
<%

	//out.print(login);
	
	//String  query = "select id_usuarios,Nombre_Completo from usuarios_alcalsis where nombre_usuario= '" + user + "' and clave_usuario = PASSWORD('"+ passw +"') and statu = 1";
	
	String  query = "select id_usuarios,Nombre_Completo from usuarios_alcalsis where nombre_usuario= '" + login + "' and clave_usuario = '"+ passw +"' and statu = 1";
	
	out.print(query);
	
	ps = con.createStatement();
	
	rs = ps.executeQuery(query);


if (rs.next()==false){
    
            %>

  <tr>
    <td width="35%">
    <p align="center"><font face="Arial" size="2">Verifique el login y Password suministrado </font><a href="index.html">presione aqu&iacute</a> 
      <font size="2" face="Arial, Helvetica, sans-serif">
    </font>    </td>
    <td width="31%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="35%">&nbsp;</td>
    <td width="31%">&nbsp;</td>
    <td width="34%">&nbsp;</td>
  </tr>
  <tr>
    <td width="35%">&nbsp;</td>
    <td width="31%"></td>
    <td width="34%"></td>
  </tr>
<%
}else{
    id_user = rs.getInt("id_usuarios");
    //int id_user = rs.getInt(
    //session.getId();

   Integer isesion =
    (Integer)session.getAttribute("isesion");

    String msj = null;

    if (isesion == null){
        isesion = new Integer(1);
        msj = " Inicio de Sesion: ";
    } else{
        isesion = new Integer(isesion.intValue() + 1);
        msj = "Esta es su visita Nº " + isesion + " usuario: ";
    }
    session.setAttribute("isesion",isesion);

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
                			<a href="#" class="active"><span class="l"></span><span class="r"></span><span class="t">Home</span></a>
                		</li>
                		<li>
                			<a href="#"><span class="l"></span><span class="r"></span><span class="t">Tributos</span></a>
                			<ul>
                				<li><a href="#">Menu Subitem 1</a>
                					<ul>
                						<li><a href="#">Menu Subitem 1.1</a></li>
                						<li><a href="#">Menu Subitem 1.2</a></li>
                						<li><a href="#">Menu Subitem 1.3</a></li>
                					</ul>
                				</li>
                				<li><a href="#">Menu Subitem 2</a></li>
                				<li><a href="#">Menu Subitem 3</a></li>
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
                                                            		<a  title="Agregar, editar,estado de cuenta,declaración, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>&Pic=Patente"><span class="l"></span><span class="r"></span><span class="t">Patente de Industria y Comercio</span></a>
                                                            				<ul>
                                                            			<li><a title="Agregar un Establecimiento Nuevo" href="../pic_agregar_est.jsp?id_usuarios=<%=id_user%>&agregar_est=1&pass=<%=passw%>&login=<%=user%>">Agregar Establecimiento</a></li>
                                                            		</ul>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i2"><span class="l"></span><span class="r"></span><span class="t">Publicidad Comercial</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Agregar nueva Publicidad</a></li>
                                                            		</ul>
                                                            	</li>

                                                            	 
                                                            	<li>
                                                            		<a title="Agregar, editar,estado de cuenta,boletín de información, liquidar, recaudar inmuebles" href="../inmueble.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>&Inm=Inmueble"><span class="l"></span><span class="r"></span><span class="t">Inmuebles Urbanos</span></a>
                                                            				<ul>
                                                            			<li><a href="page.html?">Agregar Inmueble</a></li>
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
                                                            		<a href="page.html?i4"><span class="l"></span><span class="r"></span><span class="t">Patente de Veh&iacuteculo</span></a>
                                                            	</li>
                                                            	<li>
                                                            		<a href="page.html?i5"><span class="l"></span><span class="r"></span><span class="t">Tasas y Otros Tributos</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación genérica de cualquier tributo" href="../liquidacion_general.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten Gen&eacuterica</span></a>
                                                            		
                                                            	</li>
                                                            	<li>
                                                            		<a title="Realizar una liquidación genérica de cualquier tributo" href="../liquidacion_general_sumat.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>&Gen=generica"><span class="l"></span><span class="r"></span><span class="t">Liquidaci&oacuten SUMAT</span></a>
                                                            		
                                                            	<li>
                                                            		<a title="Cuadro Diario de Caja, Reimpresión de Factura, Liquidación previa según Género,Liquidación de Oficio PIC " href="../procesos.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>"><span class="l"></span><span class="r"></span><span class="t">Procesos</span></a>
                                                            	</li>
                                                            	<li>
                                                            	<a title="Existen Liquidaciones en Recaudación" href="../recaudacion.jsp?callback=alcalsis.jsp&id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>"><span class="l"></span><span class="r"></span><span class="t">Recaudaci&oacuten</span></a>
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
                                                                               <li><a href="#">Menu Principal</a></li>
                                                                               <li><a  title="Agregar, editar,estado de cuenta,declaración, liquidar, recaudar establecimientos" href="patente.jsp?id_usuarios=<%=id_user%>&login=<%=user%>&pass=<%=passw%>&Pic=Patente">Patente de Industria y Comercio</a></li>
                                                                               <li><a href="#">Inmuebles Urbanos</a></li>
                                                                               <li><a href="#">Publicidad Comercial</a></li>
                                                                               <li><a href="#">Patente de Veh&iacuteculo</a></li>
                                                                               <li><a href="#">Tasas y Otros Tributos</a></li>                                                                               
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
                                            <h2 class="art-postheader">
                                                <span lang="es">Bienvenidos al 
												Sistema Alcalsis</span></h2>
                                            <div class="art-postcontent">
                                                <!-- article-content -->
                                                
                                                
                                                <p>
												<span style="font-size:8.5pt;font-family:&quot;Arial&quot;,&quot;sans-serif&quot;;
mso-fareast-font-family:&quot;Times New Roman&quot;;color:#676767;mso-font-kerning:14.0pt;
mso-ansi-language:ES;mso-fareast-language:EN-US;mso-bidi-language:AR-SA">Sistema 
												de Recaudaci&oacuten de Impuestos 
												Municipales (Alcalsis) es un 
												sistema integrado de gesti&oacuten 
												administrativa y financiera, 
												tributaria y recaudaci&oacuten 
												municipal</span>. </p>
                                               
                                                <div class="cleared"></div>
                                                <div class="art-content-layout overview-table">
                                                	<div class="art-content-layout-row">
                                                		<div class="art-layout-cell">
                                                      <div class="overview-table-inner">
                                                	      <h4><span lang="es">Alcalsis</span></h4>
                                                						  <img src="../alcalsis/images/01.png" width="55px" height="55px" alt="an image" class="image" />

															<p class="MsoNormal">
															<span style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
															Adiestramiento y 
															Capacitaci&oacuten de los 
															usuarios del sistema: 
															operadores, 
															administradores.<o:p>&nbsp;</o:p></span></p>
															<p class="MsoNormal">
															<span style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
															Arranque y puesta en 
															marcha del sistema.</span></p>
															<p class="MsoNormal">
															<span style="font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">
															Servicios de Soporte: 
															t&eacutecnico, operacional 
															y asesor&iacutea y consultoria que 
															garanticen la buena 
															puesta en marcha.<o:p></o:p></span></p>
                                                						  <p>&nbsp;</p>
                                                       </div>
                                                		</div><!-- end cell -->
                                                		<div class="art-layout-cell">
                                                    <div class="overview-table-inner">
                                                		  <h4>Gesti&oacuten</h4>
                                                						  <img src="../alcalsis/images/02.png" width="55px" height="55px" alt="an image" class="image" />
                                                						  <p>El M&oacutedulo de Gesti&oacuten de Cobranzas, Recaudaci&oacuten y Tr&aacutemites, tiene como objetivo dar soporte al siguiente conjunto de actividades y tareas:Notificaci&oacuten,
                                                						  Cobranza,Recaudaci&oacuten,Operativos de Fiscalizaci&oacuten, Cobranza, Recaudaci&oacuten en  campo. Tramites electr&oacutenicos.Este m&oacutedulo puede operar bajo  Intranet/Internet. 
																		  </p>
                                                				</div>
                                                		</div><!-- end cell -->
                                                		<div class="art-layout-cell">
                                                    <div class="overview-table-inner">
                                               		  <h4>Software</h4>
                                                
                                                						  <img src="../alcalsis/images/03.png" width="55px" height="55px" alt="an image" class="image" />
                                                						  <p>El sistema permite de f&aacutecil manera, la gesti&oacuten tributaria y el registro, seguimiento, 
                                                						  evaluaci&oacuten y control de la gesti&oacuten de  cobranza y recaudaci&oacuten  en los diferentes rubros / g&eacuteneros tributarios
                                                						   </p>
                                                              </div>
                                                		</div><!-- end cell -->
                                                	</div><!-- end row -->
                                                </div><!-- end table -->
                                                    
                                                <!-- /article-content -->
                                            </div>
                                            <div class="cleared"></div>
                            </div>
                            
                            		<div class="cleared"></div>
                                </div>
                            </div>
                            <div class="art-post">
                                <div class="art-post-body">
                            <div class="art-post-inner art-article">
                                            <div class="art-postcontent">
                                                
                                                  <br />
                                                
                                                	<p>
                                                		<span class="art-button-wrapper">
                                                			<span class="l"> </span>
                                                			<span class="r"> </span>
                                                			
                                                		</span>
                                                	</p>
                                                    
                                                
                                            </div>
                                            <div class="cleared"></div>
                            </div>
                            
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
<%
 }
%>
    
</body>
</html>
