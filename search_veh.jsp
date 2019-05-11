<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Módulo de Busquedad para Vehículos
    
---------------------
Date Desarrollador
: 04/05/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%> 
 <table border="0" width="100%">
			<td></td>
			<td>
                        <form method="POST" action="vehiculo.jsp">
                        <font face="Arial Narrow">
                        <input type="hidden" value="search" name="veh">
                        <input type="HIDDEN" value="<%=login%>" name="login">
                        <input type="HIDDEN" value="<%=pass%>" name="pass">	
                        <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
                        <input type="HIDDEN" value="0" name="suminicio">
                        <input type="HIDDEN" value="20" name="sumfin">			
			</font>			
			<p><font face="Arial Narrow"><input type="radio" value="1" checked name="opt_patente"><font size="2">Nº de Placa</font></font></p></td>
			<td>
			<table border="0" width="100%" cellspacing="1" id="table2">
				<tr>
					<td><font face="Arial Narrow">
					<input type="radio" value="2" name="opt_patente"><font size="2">Nombre del Propietario</font></font></td>
				</tr>
				<tr>
					<td>
				<p><font size="2" face="Arial Narrow"><input type="checkbox" name="check_mostrar" value="on">Mostrar 
				Coincidencias</font></p>
					</td>
				</tr>
			</table>
			</td>
			<td width="148">
				<input type="text" name="buscar_txt" size="20">			
				
			</td>
			<td><table border="0" width="100%" cellspacing="1" id="table3">
				<tr>
					<td width="67">
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
			 	
			</td>
			<td width="148">
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
	       