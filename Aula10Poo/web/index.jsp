<%-- 
    Document   : index
    Created on : 25 de abr. de 2022, 19:22:51
    Author     : rlarg
--%>

<%@page import="demo.Database"%>
<%@page import="demo.Contato"%>
<%@page import="demo.Data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Data hoje;
    hoje = new Data();
    hoje.setAno(2022);
    hoje.setMês(4);
    hoje.setDia(25);
    
    Data amanhã = new Data();
    amanhã.setData(26, 4, 2022);
    
    Data nascimento = new Data(1, 7, 1979);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index - POO</title>
    </head>
    <body>
        <h1>POO</h1>
        <h2>Index</h2>
        <h3>Exemplos com Datas:</h3>
        <div>Hoje é dia <%= hoje.getDia()%></div>
        <div>Amanhã será <%= amanhã.getData() %></div>
        <div>Meu aniversário é <%= nascimento.getAniversário() %></div>
        <hr/>
        <h3>Exemplos de listagem de contatos:</h3>
        <table border="1">
            <tr><th>Nome</th><th>Telefone</th><th>Aniversário</th></tr>
            <%for(Contato c: Database.getContatos()){%>
            <tr>
                <td><%= c.getNome() %></td>
                <td><%= c.getTelefone() %></td>
                <td><%= c.getNascimento().getAniversário() %></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>