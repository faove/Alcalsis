<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%
//-------------------------------------------
//Funcion encargada de obtener el saldo de un
//Objeto dado.
//Utilizaremos de entrada la variable id_obj 
//que indica el rubro a procesar y debe estar
//definida en el programa que realiza la lla-
//mada de igual manera las siguientes varia-
// bles: Id_instancia cargos y abonos
//-------------------------------------------

java.util.Date fech = new java.util.Date();
SimpleDateFormat fech_ingles = new SimpleDateFormat("yyyy-MM-dd");
java.sql.Date fecha_vig = null;
String status = null;
double monto = 0;
//---------------------------------------------------------------------
// Declaraciones de la pricipales variables utilizadas para manipular 
// las conexiones JDBC.
//---------------------------------------------------------------------
Statement  s = null;
ResultSet  r = null;

//Sentencia SQL
String sqlstr = "SELECT CUOTA,CONCEPTO,STATU,MONTO,RECARGO,MORA,FEC_VIG" +
    " FROM facturas Where ID_OBJ ='" + id_obj_saldo + "' And ID_INSTANCIA='" + id_instancia_saldo + "'" +
    " AND (facturas.STATU <>'AN' Or facturas.STATU Is Null) AND (facturas.FEC_VIG Is Null OR " +
    "  facturas.FEC_VIG <= '" + fech_ingles.format(fech) + "')";

        //out.print(sqlstr);

        s = con.createStatement();
        
        r = s.executeQuery(sqlstr);
//out.print("AQUI");
        while (r.next()){
            
            //--------------------------------------------
            // Asignacion de los resultados de la consulta
            //--------------------------------------------
            monto = r.getDouble("MONTO");

            fecha_vig  = r.getDate("FEC_VIG");

            status = r.getString("STATU");
           
            //out.print(fecha_vig);  //fech_ingles.format(fech)
            
            //if (fech.after(fecha_vig) || fecha_vig.equals(null)){
                cargos = cargos + monto;
                //out.print("Cargo:");
                //out.print(cargos);
                //out.print("Monto:");
                //out.print(monto);
                
                if (status.equals("CA")){
                    abonos = abonos + monto;
                    //out.print("Abono:");
                    //out.print(abonos);
                }
            //}
            
        }

//out.print(sqlstr);
%>