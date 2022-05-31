<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:21:37
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Task"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("user");
    Exception tasksException = null;
    ArrayList<Task> taskList = new ArrayList<>();
    try{
        if(user!=null){
            taskList = Task.getUserTasks(user.getUsername());
        }
        if(request.getParameter("task-insert")!=null){
            String username = user.getUsername();
            String title = request.getParameter("title");
            String dueDate = request.getParameter("due_date");
            Task.insert(username, title, dueDate);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("task-delete")!=null){
            int id = Integer.parseInt(request.getParameter("id"));
            Task.delete(id);
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception ex){
        tasksException = ex;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tarefas - MyTasks</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <h2>Tarefas</h2>
        <%if(tasksException != null){%>
        <div style="color: red"><%= tasksException.getMessage() %></div>
        <%}%>
        <%if(sessionUser == null){%>
            <div>Faça login para ver o conteúdo desta página.</div>
        <%}else{%>
            <form>
                <input type='text' name='title'/>
                <input type='date' name='due_date'/>
                <input type='submit' name='task-insert' value='+'/>
            </form>
            <hr/>
            <table border='1'>
                <tr><th>Tarefa</th><th>Prazo</th><th>Exclusão</th></tr>
                <%for(Task task: taskList){%>
                <tr>
                    <td><%= task.getTitle() %></td>
                    <td><%= task.getDueDate() %></td>
                    <td>
                        <form>
                            <input type='hidden' name='id' 
                                   value='<%= task.getId() %>'/>
                            <input type='submit' name='task-delete'
                                   value='-'/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>