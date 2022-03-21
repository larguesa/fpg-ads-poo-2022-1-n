<%-- 
    Document   : datahora
    Created on : 21 de mar. de 2022, 19:37:02
    Author     : rlarg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String errorMessage = null;
    boolean hasParameters = request.getParameter("gerar")!=null;
    int n=0;
    if(hasParameters){
        try{
            n = Integer.parseInt(request.getParameter("n"));
        }catch(Exception ex){
            errorMessage = "Erro ao tentar ler parâmetro";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aleatórios - JavaEE JSP</title>
    </head>
    <body>
        <h4><a href="index.jsp">Voltar</a></h4>
        <h1>JavaEE</h1>
        <h2>JSP</h2>
        <h3>Tabuada</h3>
        <form action="tabuada.jsp">
            <input type="number" name="n" value="<%=n%>"/>
            <input type="submit" name="gerar" value="Gerar"/>
        </form>
        <%if(errorMessage!=null){%>
            <div style="color: red"><%= errorMessage %></div>
        <%}else if(hasParameters){%>
            <hr/>
            <table>
                <%for(int i=1; i<=10; i++){%>
                <tr>
                    <td><%= n %></td>
                    <td>x</td>
                    <td><%= i %></td>
                    <td>=</td>
                    <td><%= n*i %></td>
                </tr>
                <%}%>
            </table>
        <%}%>
    </body>
</html>
