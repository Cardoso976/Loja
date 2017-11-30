
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
        <h1>Clientes cadastrados na loja.</h1>
        <%
            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "SELECT * FROM clientes ORDER BY nome";

            PreparedStatement comando = conexao.prepareStatement(sql);
            ResultSet res = comando.executeQuery();

            out.println("<table border=1>");
            out.println("<tr>"+
                            "<th>CÓDIGO</th>"+
                            "<th>NOME</th>"+
                            "<th>ENDEREÇO</th>"+
                            "<th>CIDADE</th>"+
                            "<th>ESTADO</th>"+
                            "<th>E-MAIL</th>"+
                            "<th>SENHA</th>"+
                            "<th>AÇÕES</th>"+
                        "</tr>");

            while (res.next()) {
                out.println("<tr>");
                out.println("<td>" + res.getInt("codigo") + "</td>");
                out.println("<td>" + res.getString("nome") + "</td>");
                out.println("<td>" + res.getString("endereco") + "</td>");
                out.println("<td>" + res.getString("cidade") + "</td>");
                out.println("<td>" + res.getString("estado") + "</td>");
                out.println("<td>" + res.getString("email") + "</td>");
                out.println("<td>" + res.getString("senha") + "</td>");
                out.println("<td><a href=excluircliente.jsp?codigo="
                        +res.getInt("codigo")+">EXCLUIR</a> |"
                        + "<a href=form_alterar_cliente.jsp?codigo="
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