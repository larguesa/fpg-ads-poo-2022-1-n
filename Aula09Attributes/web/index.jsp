<%-- 
    Document   : index
    Created on : 11 de abr. de 2022, 20:02:24
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(request.getParameter("app-count-inc")!=null){
    if(application.getAttribute("counter")==null){
        application.setAttribute("counter", 0);
    }
    int counter = (int)application.getAttribute("counter");
    if(counter==12) counter++; //porque 13 dá azar
    application.setAttribute("counter", counter+1);
    response.sendRedirect(request.getRequestURI());
}
if(request.getParameter("session-count-inc")!=null){
    if(session.getAttribute("counter")==null){
        session.setAttribute("counter", 0);
    }
    int counter = (int)session.getAttribute("counter");
    if(counter==12) counter++; //porque 13 dá azar
    session.setAttribute("counter", counter+1);
    response.sendRedirect(request.getRequestURI());
}
if(request.getParameter("req-count-inc")!=null){
    if(request.getAttribute("counter")==null){
        request.setAttribute("counter", 0);
    }
    int counter = (int)request.getAttribute("counter");
    if(counter==12) counter++; //porque 13 dá azar
    request.setAttribute("counter", counter+1);
    //response.sendRedirect(request.getRequestURI());
}
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Atributos - JavaEE</title>
    </head>
    <body>
        <h1>JavaEE</h1>
        <h2>Atributos</h2>
        <h3>De aplicação</h3>
        <form>
            <%= application.getAttribute("counter") %>
            <input type="submit" 
                   name="app-count-inc" 
                   value="Incrementar"/>
        </form>
        <hr/>
        <h3>De sessão</h3>
        <form>
            <%= session.getAttribute("counter") %>
            <input type="submit" 
                   name="session-count-inc" 
                   value="Incrementar"/>
            <%= session.getId() %>
        </form>
        <hr/>
        <h3>De requisição</h3>
        <form>
            <%= request.getAttribute("counter") %>
            <input type="submit" 
                   name="req-count-inc" 
                   value="Incrementar"/>
        </form>
    </body>
</html>
