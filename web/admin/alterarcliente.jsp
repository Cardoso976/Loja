<%-- 
    Document   : alterarcliente
    Created on : 22/11/2017, 19:32:45
    Author     : rodrigo
--%>

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
        <h1>Alteração Cliente</h1>
        <%
            String codigo = request.getParameter("codigo");
            String nome = request.getParameter("nome");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "UPDATE clientes SET nome=?, endereco=?, cidade=?, estado=?, email=?, senha=? WHERE codigo = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, nome);
            comando.setString(2, endereco);
            comando.setString(3, cidade);
            comando.setString(4, estado);
            comando.setString(5, email);
            comando.setString(6, senha);
            comando.setInt(7, Integer.parseInt(codigo));

            if (comando.executeUpdate() > 0) {
                out.println("<h3>Dados alterados com sucesso.</h3>");
            } else {
                out.println("<h3>FALHA NA ALTERAÇÃO</h3>");
            }
            conexao.close();
        %>
        <a href="index.html">Voltar ao início</a>
    </body>
</html>