<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:21:37
    Author     : rlarg
--%>

<%@page import="model.User"%>
<%@page import="model.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    Exception indexException = null;
    int userListCount = -1;
    int taskListCount = -1;
    int myTaskListCount = -1;
    try{
        userListCount = User.getAllUsers().size();
        taskListCount = Task.getAllTasks().size();
        if(user!=null){
            myTaskListCount = Task.getUserTasks(user.getUsername()).size();
        }
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
        <h3>
            Tarefas
            <a href="tasks.jsp">
                <%= (taskListCount==-1) ? '-': taskListCount %>
            </a>
        </h3>
        <%if(myTaskListCount!=-1){%>
        <h4>
            Minhas tarefas:
            <a href="my-tasks.jsp"><%= myTaskListCount %></a>
        </h4>
        <%}%>
    </body>
</html>