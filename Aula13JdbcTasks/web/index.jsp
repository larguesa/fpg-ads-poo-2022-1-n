<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:21:37
    Author     : rlarg
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Exception indexException = null;
    int userListCount = -1;
    try{
        userListCount = User.getAllUsers().size();
    }catch(Exception ex){
        indexException = ex;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Início - MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Início</h2>
        <%if(indexException != null){%>
        <div style="color: red"><%= indexException.getMessage() %></div>
        <%}%>
        <h3>
            Usuários
            <a href="users.jsp">
                <%= (userListCount==-1) ? '-': userListCount %>
            </a>
        </h3>
    </body>
</html>