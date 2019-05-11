<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Módulo Busqudad de Publicidad
    
---------------------
Date Desarrollador
: 04/04/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%> 
 <table border="0" width="100%">
			<td></td>
			<td>
		    <form method="POST" action="publicidad.jsp">
		    <font face="Arial Narrow">
		    <input type="hidden" value="search" name="Pub">
		    <input type="HIDDEN" value="<%=login%>" name="login">
		    <input type="HIDDEN" value="<%=pass%>" name="pass">	
                    <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
		    <input type="HIDDEN" value="0" name="suminicio">
	 	    <input type="HIDDEN" value="20" name="sumfin">			
			</font>			
			<p><font face="Arial Narrow"><input type="radio" value="1" checked name="opt_patente"><font size="2">Nº de Patente</font></font></p></td>
			<td>
			<table border="0" width="100%" cellspacing="1" id="table2">
				<tr>
					<td><font face="Arial Narrow">
					<input type="radio" value="2" name="opt_patente"><font size="2">Razón Social</font></font></td>
				</tr>
				<tr>
					<td><font size="2" face="Arial Narrow"><input type="checkbox" name="check_mostrar" value="on">Mostrar 
				Coincidencias</font></td>
				</tr>
			</table>
			</td>
			<td width="148">
				<input type="text" name="buscar_txt" size="20">			
			</td>
			<td><table border="0" width="100%" cellspacing="1" id="table3">
				<tr>
					<td width="68">
					<input type="submit" value="Buscar" name="Buscar" style="float: left">
					</form>
					</td>
					<td>
					<form method="POST" action="alcalsis.jsp">
					<input type="submit" value="Cerrar" name="cerrar" style="float: left">
					<input type="HIDDEN" value="<%=login%>" name="login">
					<input type="HIDDEN" value="<%=pass%>" name="pass">  
					<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
					</form>
					</td>
				</tr>
			</table>
			</td>
			</tr>
			<tr>
			<td></td>
			<td>
		    </td>
			<td>
				<p>&nbsp;</p>
			 
			</td>
			<td width="148">
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
			</td>
			<td>&nbsp;	        
			</td>
		</tr>
		</table>
		
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
	       