<%-- 
    Document   : index
    Created on : 16 de mai. de 2022, 19:21:37
    Author     : rlarg
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Exception usersException = null;
    ArrayList<User> userList = new ArrayList<>();
    try{
        userList = User.getAllUsers();
        if(request.getParameter("user-insert")!=null){
            String username = request.getParameter("username");
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            User.insert(
                new User( username,name,(username+password).hashCode())
            );
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("user-delete")!=null){
            String username = request.getParameter("username");
            User.delete(username);
            response.sendRedirect(request.getRequestURI());
        }else if(request.getParameter("user-change-password")!=null){
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            User.changePassword(username, password);
            response.sendRedirect(request.getRequestURI());
        }
    }catch(Exception ex){
        usersException = ex;
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
        <h2>Usuários</h2>
        <%if(usersException != null){%>
        <div style="color: red"><%= usersException.getMessage() %></div>
        <%}%>
        <%if(sessionUser == null){%>
            <div>Faça login para ver o conteúdo desta página.</div>
        <%}else{%>
            <fieldset>
                <legend>Novo usuário</legend>
                <form>
                    Username: <input type='text' name='username'/>
                    Nome: <input type='text' name='name'/>
                    Senha: <input type='password' name='password'/>
                    <br><br>
                    <input type='submit' name='user-insert' value='Inserir'/>
                </form>
            </fieldset>
            <hr/>
            <table border='1'>
                <tr><th>Username</th><th>Name</th><th>Exclusão</th><th>Senha</th></tr>
                <%for(User user: userList){%>
                <tr>
                    <td><%= user.getUsername() %></td>
                    <td><%= user.getName() %></td>
                    <td>
                        <form>
                            <input type='hidden' name='username' 
                                   value='<%= user.getUsername() %>'/>
                            <input type='submit' name='user-delete'
                                   value='Remover'/>
                        </form>
                    </td>
                    <td>
                        <form>
                            <input type='hidden' name='username' 
                                   value='<%= user.getUsername() %>'/>
                            <input type='password' name='password'/>
                            <input type='submit' name='user-change-password'
                                   value='Alterar'/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>