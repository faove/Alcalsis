<%@ include file="inm_liquidacion.jsp" %>
<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Módulo para Mostrar las Cuotas a Cancelar
    
---------------------
Date Desarrollador
: 13/07/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%> 
<%
        java.math.BigDecimal recargo = null;
        java.math.BigDecimal mora = null;
        java.math.BigDecimal descuento = null;
        java.math.BigDecimal mont = null;
        
        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular 
        // las conexiones JDBC.
        //---------------------------------------------------------------------

        Statement stmt = null;
        ResultSet rcd = null;
        //INICIALIZANDO MONTOTOT EN CERO PARA PODER SUMARLA
        java.math.BigDecimal montotot = new BigDecimal("0");
        String cuot = "";
        String Stat = "";
        java.sql.Date fec_can = null;
        java.sql.Date fec_vig = null;
        java.sql.Date fec_asig = null;
        String Canc = "";
        String newStat = "";
        int numStat = 0;
    
    String  strquery = "SELECT CUOTA,MONTO,STATU,FEC_CANCEL," +
    		 "NRO_PLANI_PAGO,NRO_PLANI_AVC,CONCEPTO,FEC_VIG, " +
    		 "RECARGO,MORA,DESCUENTO,FEC_ASIGNA,COD_RECAUDA,ID_ASO " +  		    		   
			 "FROM facturas WHERE ID_OBJ = 'INM' AND ID_INSTANCIA = '" + bif + "' AND STATU <> 'AN' order by CUOTA";
                         //out.print(strquery);
        stmt = con.createStatement();
        
        rcd = stmt.executeQuery(strquery);
%>    
</p>
<div class="art-layout-cell3">
<div class="overview-table-inner">
	  
		<ul><font face="Arial Narrow" size="2">Bimestre</font>
		
		<font size="2" face="Arial Narrow">Monto</font>
		<font size="2" face="Arial Narrow">Estado</font>
		<font size="2" face="Arial Narrow">F. de 
		Cancelación&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font size="2" face="Arial Narrow">Número de 
		Liquidación</font>
		<font size="2" face="Arial Narrow">Número de AVC</font>
		<font size="2" face="Arial Narrow">Concepto</font>
		<font size="2" face="Arial Narrow">Recargo</font>
		<font size="2" face="Arial Narrow">Mora</font>
		<font size="2" face="Arial Narrow">Descuento</font>
		<font size="2" face="Arial Narrow">Cod_Recauda</font>
		<font size="2" face="Arial Narrow">F. Vigencia&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font>
		<font size="2" face="Arial Narrow">F. Anula&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; </font>
		<font size="2" face="Arial Narrow">Id_ASO</font></ul>
		<!--<td bgcolor="#B7DBFF"><font size="2" face="Arial Narrow">F. Asig</font></ul>-->
	
<form method="POST" action="inm_liq_simul.jsp">
<% SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    String fec_canf = null;
    String nro_plani = null;
 while (rcd.next()) { 
        cuot = rcd.getString("CUOTA");
        Stat = rcd.getString("STATU");
        mont = rcd.getBigDecimal("MONTO");
        if (mont==null){
            mont =  new BigDecimal("0.00");
        }
        fec_can = rcd.getDate("FEC_CANCEL");
        nro_plani = rcd.getString("NRO_PLANI_PAGO");
        String nro_plani_avc = rcd.getString("NRO_PLANI_AVC");
        String concept = rcd.getString("CONCEPTO");
        recargo = rcd.getBigDecimal("RECARGO");
        mora = rcd.getBigDecimal("MORA");
        descuento = rcd.getBigDecimal("DESCUENTO");
        String cod_recauda = rcd.getString("COD_RECAUDA");
        fec_vig = rcd.getDate("FEC_VIG");
        fec_asig = rcd.getDate("FEC_ASIGNA");
        String id_aso = rcd.getString("ID_ASO");

%>
<ul>
		
		<%
                //Si el monto es null asignamos 0.0
                
                Canc = "VI";
                newStat = Stat.trim();
                numStat = newStat.compareTo(Canc);
		if (numStat == 0){
                    
                    montotot = montotot.add(mont);
                    out.println("<p><input type=checkbox name=checksel value=" + cuot + "></p>"); 
                    
		}
		%>
		
		
		<font face="Arial Narrow"><%
				if (cuot != null) {
					out.print(cuot);
				}%></font>
		
		<font face="Arial Narrow"><%=mont%></font>
		 <%
			if (Stat.equals("CA")){
				out.print(" bgcolor=#FFFFCC ");
			}
		%> 
		<font face="Arial Narrow"><%=Stat%></font>
		
		<font face="Arial Narrow"><%
                        if (fec_can != null) {
                            if (!fec_can.equals("0000-00-00")) {
                                fec_canf = sdf.format(fec_can);
                                out.println(fec_canf);    
                            }    
                        }
                %></font>
		
		<font face="Arial Narrow"><%
				if (nro_plani != null) {
					out.print(nro_plani);
				}
                                %>&nbsp;</font>
		
		<font face="Arial Narrow"><%
				if (nro_plani_avc != null) {
					out.print(nro_plani_avc);
				}
		%></font>
		
		<font face="Arial Narrow"><%
                                if (concept != null) {
					out.print(concept);
				}%></font>
		
		<font face="Arial Narrow"><%
                                if (recargo != null) {
					out.print(recargo);
				}%></font>
		
		<font face="Arial Narrow"><%
                                if (mora != null) {
					out.print(mora);
				}%></font>
		
		<font face="Arial Narrow"><%
                                if (descuento != null) {
					out.print(descuento);
				}%></font>
		
		<font face="Arial Narrow"><%
                                if (cod_recauda != null) {
					out.print(cod_recauda);
				}
		%></font>
		
		<font face="Arial Narrow"><%
                                if (fec_vig != null) {
                                    String fec_vigf = sdf.format(fec_vig);
                                    out.println(fec_vigf);
                                }
                %></font>
		
		<font face="Arial Narrow"><%
                                if (fec_asig != null) {
                                    String fec_asigf = sdf.format(fec_asig);
                                    out.println(fec_asigf);
                                }    
                %></font> 
		
		<font face="Arial Narrow"><%
				if (id_aso != null) {
					out.print(id_aso);
				}
		%></font>
		<!--<td style="border-bottom-style: none; border-bottom-width: medium" bordercolor="#C0C0C0">&nbsp;</td>-->
</ul>		
<%		}
		%>
	
</div>
</div>
<div class="art-layout-cell2">
<div class="overview-table-inner">

	<ul>
	<font size="2" face="Arial Narrow">Deuda con el Municipio:</font>
	<font face="Arial Narrow">
	<% 
	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	out.println(nf.format(montotot));
	%></font>
							
</ul>
</div>
</div>
<div class="art-layout-cell2">
<div class="overview-table-inner">
<ul>
		<%//Boton para ir a recaudar %>
		

      <input type="HIDDEN" value="<%=login%>" name="login">
      <input type="HIDDEN" value="<%=pass%>" name="pass">
      <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
      <input type="HIDDEN" value="<%=cod_cata%>" name="cod_cata">
      <input type="HIDDEN" value="<%=bif%>" name="bif">
      <input type="HIDDEN" value="<%=dir_inm%>" name="dir_inm">   
          		    
<!--      <input type="submit" value="Aviso de Cobro" name="avc">-->
		
	  <input type="submit" value="Aceptar" name="aceptar">
	  </form>
		
		<form method="POST" action="inmueble.jsp">
			<input type="HIDDEN" value="<%=cod_cata%>" name="buscar_txt">	
                        <input type="HIDDEN" value=2 name="opt_patente">	
		      	<input type="HIDDEN" value="<%=cod_cata%>" name="cod_cata">
		      	<input type="HIDDEN" value="<%=bif%>" name="bif">
		      	<input type="HIDDEN" value="<%=dir_inm%>" name="dir_inm"> 
                        <p>
	        	<button name="estado" type="submit">Cerrar</button>
	        	</p>
                        <input type="HIDDEN" value="<%=login%>" name="login">
                        <input type="HIDDEN" value="<%=pass%>" name="pass">
                        <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
                </form>
                  
	</ul>
	</div>
</div>
