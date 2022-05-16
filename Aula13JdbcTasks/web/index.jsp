<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:21:37
    Author     : rlarg
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Início</h2>
        <h3>Usuários</h3>
        <table>
            <tr><th>Username</th><th>Name</th></tr>
            <%for(User user: User.getAllUsers()){%>
            <tr>
                <td><%= user.getUsername() %></td>
                <td><%= user.getName() %></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
