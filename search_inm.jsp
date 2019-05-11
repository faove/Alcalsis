<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Módulo de Busquedad para Inmueble
    
---------------------
Date Desarrollador
: 04/05/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%> 
 <table border="0" width="100%">
			<td></td>
			<td>
		    <form method="POST" action="inmueble.jsp">
		    <font face="Arial Narrow">
		    <input type="hidden" value="search" name="Inm">
		    <input type="HIDDEN" value="<%=login%>" name="login">
		    <input type="HIDDEN" value="<%=pass%>" name="pass">	
                    <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
		    <input type="HIDDEN" value="0" name="suminicio">
	 	    <input type="HIDDEN" value="20" name="sumfin">			
			</font>			
			<p><font face="Arial Narrow"><input type="radio" value="1" checked name="opt_patente"><font size="2">Nº de Boletín</font></font></p>
			</td>
			<td>
			<table border="0" width="100%" cellspacing="1" id="table3">
				<tr>
					<td><font face="Arial Narrow">
					<input type="radio" value="2" name="opt_patente"><font size="2">Código de Catastro</font></font></td>
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
			<td>&nbsp;<table border="0" width="100%" cellspacing="1" id="table2">
				<tr>
					<td width="74">
					<input type="submit" value="Buscar" name="Buscar" style="float: left"></form></td>
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
			<p>&nbsp;</p>

			</td>
			</tr>
			</table>
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
	       