
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Produto</title>
    </head>
    <body>
        <h1>Alteração Cliente</h1>
        <%
            String codigo = request.getParameter("codigo");
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String url = request.getParameter("url");
            String preco = request.getParameter("preco");
            String quantidade_estoque = request.getParameter("quantidade_estoque");           

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "UPDATE produtos SET titulo=?, autor=?, url=?, preco=?, quantidade_estoque=? WHERE codigo = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, titulo);
            comando.setString(2, autor);
            comando.setString(3, url);
            comando.setString(4, preco);
            comando.setString(5, quantidade_estoque);
            comando.setInt(6, Integer.parseInt(codigo));

            if (comando.executeUpdate() > 0) {
                request.getRequestDispatcher("index.html").forward(request, response);
            } else {
                out.println("<h3>FALHA NA ALTERAÇÃO</h3>");
            }
            conexao.close();
        %>
        <a href="index.html">Voltar ao início</a>
    </body>
</html>