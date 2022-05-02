<%-- 
    Document   : index
    Created on : 2 de mai. de 2022, 19:18:38
    Author     : rlarg
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pessoa"%>
<%
    Pessoa ramiro = new Pessoa("Ramiro");
    Pessoa maria = new Pessoa("Maria");
    Pessoa josé = new Pessoa("José");
    josé.setPai(ramiro); josé.setMãe(maria);
    Pessoa paulo = new Pessoa("Paulo");
    Pessoa albina = new Pessoa("Albina");
    Pessoa mariaHelena = new Pessoa("Maria Helena");
    mariaHelena.setPai(paulo); mariaHelena.setMãe(albina);
    Pessoa eu = new Pessoa("Ricardo");
    eu.setPai(josé); eu.setMãe(mariaHelena);
    Pessoa joséRicardo = new Pessoa("José Ricardo");
    Pessoa mariaEduarda = new Pessoa("Maria Eduarda");
    joséRicardo.setPai(eu); mariaEduarda.setPai(eu);
    ArrayList<Pessoa> lista = new ArrayList<>();
    lista.add(ramiro); lista.add(maria); lista.add(josé);
    lista.add(paulo); lista.add(albina); lista.add(mariaHelena);
    lista.add(eu); lista.add(joséRicardo); lista.add(mariaEduarda);
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Associação recursiva - POO</title>
    </head>
    <body>
        <h1>POO</h1>
        <h2>Associação recursiva</h2>
        <div>
            Meu nome é <%= eu.getNome() %>
            <%if(eu.getIdade()!=null){%>
            e tenho <%= eu.getIdade() %> anos
            <%}%>.
        </div>
        <h2>Lista de pessoas</h2>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Pai</th>
                <th>Avô paterno</th>
                <th>Avó paterna</th>
                <th>Mãe</th>
                <th>Avô materno</th>
                <th>Avó materna</th>
            </tr>
            <%for(Pessoa p: lista){%>
            <tr>
                <td><%= p.getNome() %></td>
                <td><%= (p.getPai()!=null)?p.getPai().getNome():"" %></td>
                <td><%= (p.getAvôPaterno()!=null)?p.getAvôPaterno().getNome():"" %></td>
                <td><%= (p.getAvóPaterna()!=null)?p.getAvóPaterna().getNome():"" %></td>
                <td><%= (p.getMãe()!=null)?p.getMãe().getNome():"" %></td>
                <td><%= (p.getAvôMaterno()!=null)?p.getAvôMaterno().getNome():"" %></td>
                <td><%= (p.getAvóMaterna()!=null)?p.getAvóMaterna().getNome():"" %></td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
