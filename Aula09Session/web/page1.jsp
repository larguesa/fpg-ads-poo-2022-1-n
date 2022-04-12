<%-- 
    Document   : index
    Created on : 11 de abr. de 2022, 21:19:42
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página 1 - SessionApp</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%if(session.getAttribute("username")!=null){%>
            <h2>Página 1</h2>
            <p>Conteúdo da página um...</p>
        <%}%>
    </body>
</html>
