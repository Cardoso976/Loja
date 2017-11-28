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
        <h1>Produtos cadastrados na loja!</h1>
        <%
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "SELECT * FROM produtos ORDER BY titulo";

            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet res = comando.executeQuery();

            out.println("<table border=1>");
            out.println("<tr>"+
                            "<th>CÓDIGO</th>"+
                            "<th>TÍTULO</th>"+
                            "<th>AUTOR</th>"+
                            "<th>URL</th>"+
                            "<th>PREÇO</th>"+
                            "<th>QUANTIDADE-ESTOQUE</th>"+
                            "<th>AÇÕES</th>"+
                        "</tr>");

            while (res.next()) {
                out.println("<tr>");
                out.println("<td>" + res.getInt("codigo") + "</td>");
                out.println("<td>" + res.getString("titulo") + "</td>");
                out.println("<td>" + res.getString("autor") + "</td>");
                out.println("<td>" + res.getString("url") + "</td>");
                out.println("<td> R$" + res.getString("preco") + "</td>");
                out.println("<td>" + res.getString("quantidade_estoque") + "</td>");
                out.println("<td><a href=excluirproduto.jsp?codigo="
                        +res.getInt("codigo")+">EXCLUIR</a> |"
                        + "<a href=form_alterar_produto.jsp?codigo="
                        + res.getInt("codigo")+">Alterar</a></td>");
                out.println("<tr>");
            }
            out.println("</table>");
            conexao.close();
        %>  
        <hr>
        <a href="index.html">Voltar ao início</a>      
    </body>
</html>