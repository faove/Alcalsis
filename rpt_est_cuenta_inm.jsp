<%@ page import="net.sf.jasperreports.engine.*" %> 

<%@ page import="net.sf.jasperreports.engine.design.*" %> 

<%@ page import="net.sf.jasperreports.engine.data.*"%> 

<%@ page import="net.sf.jasperreports.engine.export.*"%> 

<%@ page import="net.sf.jasperreports.engine.util.*"%> 

<%@ page import="net.sf.jasperreports.view.*"%> 

<%@ page import="net.sf.jasperreports.view.save.*"%> 

<%@ page import="java.sql.*"%> 

<%@ page import="java.util.*" %> 

<%@ page import="java.io.*" %> 

<HTML>
        <HEAD>
        <TITLE> Estado de Cuenta de INM
         <%
        Connection con = null;
        %>

        <%@ include file="conexion.jsp" %>        
        </TITLE>
<%

            System.out.println("Comienza el Reporte----------------------------");

 

 %> 

  

<script language="JavaScript"> 

function regresar(){ 

            history.back(); 

}

function error(){

            alert("Error encontrando procesando el periodo: " + periodo);

            history.back(); 

} 

</script> 

<head> 

<% 
		//---------------------------------------------------------------
        // Obtenemos el valor de boton estado de cuenta de patente.jsp
        //---------------------------------------------------------------
        String bif = request.getParameter("bif");
        out.print(bif);
        String abono = request.getParameter("abono");
        String cargo = request.getParameter("cargo");
        //----------------------------------------------------------------------------
        // Obtenemos el usuario y su password o del boton de patente (alcalsis.jsp)
        //----------------------------------------------------------------------------
        String saldo = request.getParameter("saldo");
        /*String pass = request.getParameter("pass");
        String id_user = request.getParameter("id_usuarios");*/
try{ 


//            String driver = "oracle.jdbc.driver.OracleDriver"; 

//            String connectString = "********"; 

//            String user = "***************** "; 

//            String password = "*********"; 

//            Class.forName(driver); 

//            Connection conn = DriverManager.getConnection(connectString, user, password); 

            /////////////////////////////////////////////

            System.out.println("********Compilamos estado de cuenta.jrxml OK********");

            System.setProperty( 

                        "jasper.reports.compile.class.path", 

                        application.getRealPath("/WEB-INF/lib/jasperreports-0.6.8.jar") + 

                        System.getProperty("path.separator") + 

                        application.getRealPath("/WEB-INF/classes/") 

                        );

            //out.println("*****Cargamos el jasperreports-0.6.0.jar OK*********");

            System.setProperty( 

                        "jasper.reports.compile.temp", 

                        application.getRealPath("/reports/") 

                        );
/* -------------------------------------------------------------------------------------------
            System.setProperty( 

                        "jasper.reports.compile.class.path", 

                        application.getRealPath("/WEB-INF/lib/jasperreports-0.6.8.jar") + 

                        System.getProperty("path.separator") + 

                        application.getRealPath("/WEB-INF/classes/") 

                        );

            System.out.println("*****Cargamos el jasperreports-0.6.0.jar OK*********");

            System.setProperty( 

                        "jasper.reports.compile.temp", 

                        application.getRealPath("/reports/") 

                        );
  
---------------------------------------------------------------------------------------------*/
            JasperCompileManager.compileReportToFile(application.getRealPath("/reports/rpt_est_cuenta_inm.jrxml")); 
            //JasperCompileManager.compileReportToFile(application.getRealPath("/reports/rpt_est_cuenta_pic.jrxml")); 
            //JasperCompileManager.compileReportToFile(application.getRealPath("\reports\Estado_Cta002.jrxml")); 
            

            out.println("******Fin de la Compilamos el archivos***********");

            ///////////////////////////////////////////// \WEB-INF\reports

  

            File reportFile = new File(application.getRealPath("/reports/rpt_est_cuenta_inm.jasper")); 
            //File reportFile = new File(application.getRealPath("/reports/rpt_alc_rec_tiq_inm.jasper")); 
            //rpt_alc_rec_tiq_pic

            Map parameters = new HashMap();
 
		parameters.put("saldo",saldo);

		parameters.put("abono",abono);

		parameters.put("cargo",cargo);

            parameters.put("patente",bif);
			
            out.print(parameters);

            byte[] bytes =  JasperRunManager.runReportToPdf(reportFile.getPath(),parameters,con); 

            response.setContentType("application/pdf"); 

            response.setContentLength(bytes.length); 

            ServletOutputStream ouputStream = response.getOutputStream(); 

            ouputStream.write(bytes, 0, bytes.length); 

            ouputStream.flush();

            ouputStream.close();

}catch (JRException e) 

{out.println("Error:" +e.getMessage());} 

catch (Exception e) 

{ 

e.printStackTrace(); 

out.println("Error2:" +e.getMessage()); 

}      

%> 
<!--			<form method="GET" action="patente_edo_cuenta.jsp">
            	<input type="HIDDEN" value="<%//=nro_patente%>" name="buscar_txt">	
				<input type="HIDDEN" value=1 name="opt_patente">                        
				<input type="HIDDEN" value="<%//=nro_patente%>" name="nro_pat">
				<input type="HIDDEN" value="<%//=razon%>" name="razon">
				<button name="atras" type="submit">Atrás</button>
				<input type="HIDDEN" value="<%//=direccion%>" name="direccion">
				<input type="HIDDEN" value="<%//=login%>" name="login">
				<input type="HIDDEN" value="<%//=pass%>" name="pass">
				<input type="HIDDEN" value="<%//=id_user%>" name="id_usuarios">
			</form>
			-->
       </BODY>
</HTML>