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

        String  query = "select COUNT(placa) AS CANT from vehiculos where placa LIKE '" + busqueda + "%'  LIMIT 0, 22";
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
			query = "select placa from vehiculos where placa LIKE '" + busqueda + "%'  LIMIT 0, 100";
			//ps = con.createStatement();
			rs = ps.executeQuery(query);
			
			//while(rs.next() && cantidad<=20)
			while(rs.next())
			{
				String rso =rs.getString("placa");
				out.print("<div onClick=\"clickLista(this);\" onMouseOver=\"mouseDentro(this);\">" + rso + "</div>");
				// Muestro solo 20 resultados de los 22 obtenidos
				cantidad=cantidad + 1;
				//out.print(rso);
			}
		}
		
%>

