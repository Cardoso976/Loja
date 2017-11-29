
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pedidos por clientes</h1>
        <%
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "SELECT * FROM pedidos ORDER BY codigo DESC";

            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet res = comando.executeQuery();

            out.println("<table border=1>");
            out.println("<tr>"+
                            "<th>CÓDIGO</th>"+
                            "<th>NOME CLIENTE</th>"+
                            "<th>NOME PRODUTO</th>"+
                            "<th>QUANTIDADE COMPRADA</th>"+
                            "<th>PREÇO UNITÁRIO</th>"+
                        "</tr>");

            while (res.next()) {
                out.println("<tr>");
                out.println("<td>" + res.getInt("codigo") + "</td>");
                out.println("<td>" + res.getString("nome_cliente") + "</td>");
                out.println("<td>" + res.getString("nome_produto") + "</td>");
                out.println("<td>" + res.getString("quantidade_comprada") + "</td>");
                out.println("<td>" + res.getString("preco_unitario") + "</td>");                             
                out.println("<tr>");
            }
            out.println("</table>");
            conexao.close();
        %> 
        <hr>
        <a href="index.html">Voltar ao início</a>         
    </body>
</html>