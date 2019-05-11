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
: 22/01/05 FAOVE
---------------------

    ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''--%>

<html>

<head><title>Menu Principal de -Alcalsis- (Seleccione que operación desea realizar)</title>

</head>
<body>

<%
String login = request.getParameter("login");
String pass = request.getParameter("pass");
try{
if ((login == null) || (login == "")) {

%>
<!--<jsp:forward page="error.jsp"/>-->
<%
}else{
%>
<jsp:forward page="menu_principal.jsp">
 <jsp:param name="id" value="<%=login %>" />        
 <jsp:param name="pa" value="<%= pass %>" />
 </jsp:forward>
<%

}
}catch (Exception e) {
    out.print("<p><b>");
    out.print("A ocurrido el siguiente error: ");
    out.println(e.toString());
    out.print(" notifiquelo al Administrador");
    out.print("</b></p>");
}
%>

</body>
</html>


