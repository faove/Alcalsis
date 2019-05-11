<%@page import="java.util.*" session="true"%>
<%@page contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.text.*" %>
<%
Connection con = null;
Statement ps = null;
ResultSet rs = null;
int cantidad = 0;
%>


<%@ include file="conexion.jsp" %>

<%
		String busqueda = request.getParameter("busqueda");

        String  query = "select COUNT(BIF) AS CANT from inmuebles where BIF LIKE '" + busqueda + "%'  LIMIT 0, 22";
       // out.print(query);
        ps = con.createStatement();

        rs = ps.executeQuery(query);
		

		if (rs.next()!=false){
		
			cantidad = rs.getInt("CANT");
			
		}
		
		rs.close();
		
		if (cantidad == 0) {
			/* 0: no se vuelve por mas resultados
			vacio: cadena a mostrar, en este caso no se muestra nada */
			out.print("0&vacio");
		}
		else
		{
			if(cantidad>20) out.print("1&"); 
			else out.print("0&");
	
			cantidad=1;
			query = "select bif from inmuebles where bif LIKE '" + busqueda + "%'  LIMIT 0, 100";
			//ps = con.createStatement();
			rs = ps.executeQuery(query);
			
			//while(rs.next() && cantidad<=20)
			while(rs.next())
			{
				String bif =rs.getString("bif");
				
				//String rso =rs.getString("RAZON_SOCIAL");
				
				//out.print("<div onClick=\"clickLista(this);\" onMouseOver=\"mouseDentro(this);\">" + nro + "</div>");
				
				out.print("<div onClick=\"clickLista(this);\" onMouseOver=\"mouseDentro(this);\">" + bif + "</div>");
				// Muestro solo 20 resultados de los 22 obtenidosout.print("<div onClick=\"clickLista(this);\" onMouseOver=\"mouseDentro(this);\">" + nro + " " +rso + "</div>");
				
				cantidad=cantidad + 1;
				//out.print(rso);
			}
		}
		
%>

