<%-- ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    Módulo para Liquidar INM
    
---------------------
Date Desarrollador
: 13/07/05 FAOVE
---------------------
    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%> 
<%
        
//Boton de Liquidar		
String aceptar = request.getParameter("aceptar");
//Selecion de las cuotas
String[] checksel = request.getParameterValues("checksel");
//Pulso el boton de aceptar		
if (aceptar != null ) {
        if (checksel == null){

        out.println("<p><u><font color=#FF0000 size=2 face=Arial Narrow>No ha seleccionado ninguna cuota a liquidar, por favor verifique.</font></u></p>");
        
        }else{



        //---------------------------------------------------------------------
        // Declaraciones de la pricipales variables utilizadas para manipular 
        // las conexiones JDBC.
        //---------------------------------------------------------------------
        Statement stm = null;
        Statement stma = null;
        Statement stu = null;
        Statement stupdate = null;
        Statement stupdate2 = null;
        Statement stupdate_avc = null;
        Statement sti_alc = null;
        ResultSet rd = null;
        ResultSet rd1 = null;
        ResultSet rd2 = null;
        int nro_liq_t = 0;
        String cuotaself="";
        String nro_liq="";
        String nro_liq_6_14 = "";
        String Cod_Recaudador="99";
        String concepto_compara="";
        int ren = 0;
        java.math.BigDecimal monto = null;
        int cuotasprevias = 0; // no existe cuotas previas a liquidar
        String nro_plani_pago = "";
        String nro_plani_avc = "";
        String otrostring = "null";

        String  strquery = "SELECT CUOTA,MONTO,STATU,FEC_CANCEL," +
    		 "NRO_PLANI_PAGO,NRO_PLANI_AVC,CONCEPTO,FEC_VIG, " +
    		 "RECARGO,MORA,DESCUENTO,FEC_ASIGNA,COD_RECAUDA,ID_ASO " +  		    		   
			 "FROM facturas WHERE ID_OBJ = 'INM' AND STATU='VI' AND ID_INSTANCIA = '" + bif + "' order by CUOTA";

        stm = con.createStatement();
        
        rd = stm.executeQuery(strquery);
        
            if(rd.next()){
                int cuota = Integer.parseInt(rd.getString(1));

                int checks = Integer.parseInt(checksel[0]);

                //out.println(cuota);
                //out.println(checks);
                if (checks > cuota){
                  out.println("<p><u><font color=#FF0000 size=2 face=Arial Narrow>Existen cuotas previa a liquidar, por favor verifique.</font></u></p>");
                  out.println("<p><u><font color=#000080 size=2 face=Arial Narrow>El usuario: " + login + ", esta intentando liquidar la cuota " + checks + "</font></u></p>");
                  cuotasprevias = 1;
                  %>
                    <form method="GET" action="recaudacion.jsp">
                    <input type="HIDDEN" value="inm_liq_simul.jsp" name="callback">	
                    <input type="HIDDEN" value="<%=login%>" name="login">
                    <input type="HIDDEN" value="<%=pass%>" name="pass">
                    <input type="HIDDEN" value="<%=bif%>" name="nro_pat">
                    <input type="HIDDEN" value="<%=dir_inm%>" name="direccion">
                    <input type="HIDDEN" value="<%=cod_cata%>" name="razon">   
                    <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">            	
                    <input type="submit" value="Ir a Recaudar" name="recaudar" style="float: left">
                    </form>
					<form method="POST" action="rpt_alc_rec_tiq_inm_liq.jsp">
					<input type="HIDDEN" value="inm_liq_simul.jsp" name="callback">	
					<input type="HIDDEN" value="<%=login%>" name="login">
					<input type="HIDDEN" value="<%=pass%>" name="pass">
					<input type="HIDDEN" value="<%=bif%>" name="nro_pat">
					<input type="HIDDEN" value="<%=nro_liq%>" name="nro_liq">					
					<input type="HIDDEN" value="<%=cod_cata%>" name="razon">
					<input type="HIDDEN" value="<%=dir_inm%>" name="direccion">   
					<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
					<input type="submit" value="Imprimir" name="imprimir" style="float: left">
					</form>
                    <%
                }
            
            }
        //Se verifica si existen cuotas previas a liquidar
        if (cuotasprevias == 0) {
            //SE BUSCA EL ULTIMA PLANILLA DE PAGO 
            String  strquery1 = "SELECT Nro_Liquida_Ult" +
                   " FROM alcalsis_control_procesos";

            stm = con.createStatement();

            rd1 = stm.executeQuery(strquery1);

            if (rd1.next()){
                //Se obtine el numero de planilla
                nro_liq = rd1.getString(1);
                
                //Se toma los ultimos digitos
                nro_liq_6_14 = nro_liq.substring(6, 14);
                
                nro_liq_t = Integer.parseInt(nro_liq_6_14);
                //La planilla se incrementa en una
                nro_liq_t = nro_liq_t + 1;
                
                NumberFormat nro = NumberFormat.getInstance();
                
                nro.setMaximumFractionDigits(0);

                nro.setMinimumIntegerDigits(8);
                
                /*DecimalFormat nro = new DecimalFormat("#######");*/
                
                String new_nro_liq_t = nro.format(nro_liq_t);
                //Debido a que la función Number format agrega puntos
                //deben ser eliminados
                String nro_liq_0_2 = new_nro_liq_t.substring(0, 2);
                String nro_liq_3_6 = new_nro_liq_t.substring(3, 6);
                String nro_liq_7_10 = new_nro_liq_t.substring(7, 10);
                //String nro_liq_t_sin_puntos = new_nro_liq_t.replace('.',' ');
                
                //nro_liq_t_sin_puntos = nro_liq_t_sin_puntos.trim();
                /*out.print("<p>");
                out.println(new_nro_liq_t);
                out.println(nro_liq_0_2);
                out.println(nro_liq_3_6);
                out.print(nro_liq_7_10);
                out.print("</p>");*/
                //out.println(nro_liq);

                java.util.Date fecha = new java.util.Date();

                SimpleDateFormat yf = new SimpleDateFormat("yyyy");
                SimpleDateFormat mf = new SimpleDateFormat("MM");
                String year = yf.format(fecha);
                String month = mf.format(fecha);
                //Se concatena el nuevo numero de planilla
                nro_liq = year + month + nro_liq_0_2 + nro_liq_3_6 + nro_liq_7_10;
                //out.println(nro_liq);
                //Se guarda la planilla
                String  queryupdate = "UPDATE alcalsis_control_procesos set Nro_Liquida_Ult=" +
                   " '" + nro_liq + "' where Id_Alcaldia = 1";

                stu = con.createStatement();

                int n = stu.executeUpdate(queryupdate);
                //out.print(n);
            }
            //Construcción de cuotas selecionadas, con la variable checkset
            
            /* Entonces, para cada checkset seleccionado se tiene que recorrer 
                con un for*/
            for (int i = 0; i < checksel.length; ++i){
                String cuotasel = "CUOTA='" + checksel[i] + "'";
                if (i >= 1) {
                    cuotaself =  cuotaself + " or " + cuotasel + "";
                }else{
                    cuotaself=cuotasel;
                }    
                
            }
            cuotaself =  "(" + cuotaself + ")";
            //out.println(cuotaself);
            //Elaborar el string strquery2 para updates nro_planilla,cod_recauda, etc
            String  strquery2 = "SELECT CUOTA,NRO_PLANI_PAGO,COD_RECAUDA,CONCEPTO,MONTO,NRO_PLANI_AVC" +
               " FROM facturas where ID_OBJ = 'INM' and ID_INSTANCIA='" + bif + "' and " + cuotaself + "";

            stma = con.createStatement();

            rd2 = stma.executeQuery(strquery2);

           // String concepto_compara = rd2.getString("CONCEPTO");

            //out.println(strquery2);
            
            while (rd2.next()){
                
                //Sumatoria de los renglones
                ren = ren + 1;

                String Cod_Recaud = rd2.getString("COD_RECAUDA");
                String cuotas = rd2.getString("CUOTA");
                //double monto = rd2.getDouble("MONTO");
                monto = rd2.getBigDecimal("MONTO");
                //out.println(monto);
                if (monto==null){
                    monto =  new BigDecimal("0.00");
                }
                //out.println(monto);
                String concepto = rd2.getString("CONCEPTO");

                if (ren == 1) {
                    concepto_compara = concepto;
                }
                //Asigna el número de aviso de cobro
                nro_plani_avc = rd2.getString("NRO_PLANI_AVC");
                nro_plani_pago = rd2.getString("NRO_PLANI_PAGO");
                //out.println(nro_plani_pago);
                //out.println(Cod_Recaudador);

                //Cuota en proceso nro_plani_pago.equals(null) ||
                
                if ((nro_plani_pago != null) && (nro_plani_pago.compareTo("") != 0)){
                    out.println("<p><u><font color=#FF0000 size=2 face=Arial Narrow>Cuotas " + cuotas + " se encuentra en proceso, ya tienen asignado número de planilla: " + nro_plani_pago + "</font></u></p>");
                    break;    
                }
                
                //Concepto Iguales
                if (!concepto_compara.equals(concepto)){
                    out.println("<p><u><font color=#FF0000 size=2 face=Arial Narrow>La Cuota " + cuotas + ", tiene un concepto distinto a las anteriores cuotas seleccionadas </font></u></p>");
                    break;    
                }
                //Asigna a la oficina principal si no tiene cód. recaudador
                if ((Cod_Recaud != null) && (Cod_Recaud.compareTo("") != 0)) {
                    //out.println("Igual null");
                    Cod_Recaudador = Cod_Recaud;
                }
                //out.println(Cod_Recaudador);
                //Genera entradas en la Lista de Liquidaciones por Recaudar/Cobrar Cajero
                String cuotas_0_3 = cuotas.substring(0, 4);
                //out.println(cuotas_0_3);
                java.util.Date fecha_actual = new java.util.Date();
                SimpleDateFormat sdfe = new SimpleDateFormat("yyyy");
                String ft_fecha_actual = sdfe.format(fecha_actual);
                //rd2.updateString("CONCEPTO","301041000");
                if (Integer.parseInt(cuotas_0_3) < Integer.parseInt(ft_fecha_actual)){
                    //Actualizar concepto mediante cuotas morosas "301041000"
                   //out.println("Deuda Morosa");
                   
                   String  update_fact = "UPDATE facturas set CONCEPTO='301021200' " +
                   " where ID_OBJ = 'INM' AND ID_INSTANCIA='" + bif + "' and CUOTA='" + cuotas + "'";

                    stupdate = con.createStatement();

                    int nupdate = stupdate.executeUpdate(update_fact);
                }
                //Formateando fecha de pago
                java.util.Date fecha_pago = new java.util.Date();
                SimpleDateFormat sd_fecha_pago = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String ft_fecha_pago = sd_fecha_pago.format(fecha_pago);
                //out.println(ft_fecha_pago);
                
                //Enlaza las Cuotas por Nro. de Planilla de Liquidación
                //out.println(n_alc);
                String  update_fact2 = "UPDATE facturas set FEC_CANCEL='" + ft_fecha_pago + "', NRO_PLANI_PAGO='" + nro_liq + "',USUARIO_LIQ =" + id_user + " " +
                   " where ID_OBJ = 'INM' AND ID_INSTANCIA='" + bif + "' and CUOTA='" + cuotas + "'";

                stupdate2 = con.createStatement();

                int nupdate2 = stupdate2.executeUpdate(update_fact2);
                //Actualiza Alc_Obj_AVC a cancelado
                if (nro_plani_avc != ""){
                    //out.println("table AVC");
                    String  update_avc = "UPDATE alc_obj_avc set Statu = 'CA' " +
                       " where Nro_Plani_AVC='" + nro_plani_avc + "' AND Cuota='" + cuotas + "'";

                    stupdate_avc = con.createStatement();

                    int nupdate_avc = stupdate_avc.executeUpdate(update_avc);

                }
				//Agregar en Alc_obj_liq                
                String  insert_alc = "INSERT into alc_obj_liqs (usuario_liq,Nro_Plani_Pago,Renglon,Cuota,Id_Objeto,Id_Instancia, " +
                    "Monto_Origi,Rubro,Id_Contri,Xnombre,Fec_Pago,Tip_Liq)" +
                    " values(" + id_user + ",'" + nro_liq + "'," + ren + ",'" + cuotas + "','INM','" + bif + "'" +
                    "," + monto + ",'" + concepto + "','" + cod_cata + "','" + dir_inm + "','" + ft_fecha_pago + "','Esp')";
                 //out.println(insert_alc);  
                sti_alc = con.createStatement();

                int n_alc = sti_alc.executeUpdate(insert_alc);
				//if (n_alc == 1) {
					%>
					<%//@ include file="rpt_alc_rec_tiq_inm_liq.jsp" %>
					<%
				//}
            }//fin del mientras 
          %>
            <form method="GET" action="recaudacion.jsp">
            <input type="HIDDEN" value="inm_liq_simul.jsp" name="callback">	
            <input type="HIDDEN" value="<%=login%>" name="login">
            <input type="HIDDEN" value="<%=pass%>" name="pass">
            <input type="HIDDEN" value="<%=bif%>" name="nro_pat">
            <input type="HIDDEN" value="<%=dir_inm%>" name="direccion">
            <input type="HIDDEN" value="<%=cod_cata%>" name="razon">   
            <input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">            	
            <input type="submit" value="Ir a Recaudar" name="recaudar" style="float: left">
            </form>
			<form method="POST" action="rpt_alc_rec_tiq_inm_liq.jsp">
			<input type="HIDDEN" value="inm_liq_simul.jsp" name="callback">	
			<input type="HIDDEN" value="<%=login%>" name="login">
			<input type="HIDDEN" value="<%=pass%>" name="pass">
			<input type="HIDDEN" value="<%=bif%>" name="nro_pat">
			<input type="HIDDEN" value="<%=nro_liq%>" name="nro_liq">					
			<input type="HIDDEN" value="<%=cod_cata%>" name="razon">
			<input type="HIDDEN" value="<%=dir_inm%>" name="direccion">   
			<input type="HIDDEN" value="<%=id_user%>" name="id_usuarios">
			<input type="submit" value="Imprimir" name="imprimir" style="float: left">
			</form>
            <%
        }//fin del checksel
    }// fin del if Existen cuotas previas a liquidar
}

%>