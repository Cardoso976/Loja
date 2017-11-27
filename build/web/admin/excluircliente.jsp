<%-- 
    Document   : excluircliente
    Created on : 14/11/2017, 22:09:37
    Author     : Alunos
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
        <%
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();
            String sql = "DELETE FROM clientes WHERE codigo = ?";
            PreparedStatement comando = conexao.prepareStatement(sql);
            String codigo = request.getParameter("codigo");
            comando.setInt(1, Integer.parseInt(codigo));
            if (comando.executeUpdate() > 0){
                out.print("<h1>CLIENTE EXCLUÍDO</h1>");
            } else {
                out.print("<h1>FALHA NA EXCLUSÃO</h1>");
            }
            conexao.close();
        %>
        <a href="index.html">Voltar ao início</a>
    </body>
</html>
