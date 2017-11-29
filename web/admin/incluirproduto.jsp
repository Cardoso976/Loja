
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/jQuery.js" type="text/javascript"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            String url = request.getParameter("url");
            String preco = request.getParameter("preco");
            String quantidade_estoque = request.getParameter("quantidade_estoque");

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "INSERT INTO produtos (titulo, autor, url, preco, quantidade_estoque) VALUES (?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, titulo);
            comando.setString(2, autor);
            comando.setString(3, url);
            comando.setDouble(4, Double.parseDouble(preco));
            comando.setString(5, quantidade_estoque);
            if (comando.executeUpdate() > 0){
               out.println("<h2>CADASTRO REALIZADO COM SUCESSO!</h2>");
           }else{
            out.println("<h2>FALHA NO CADASTRO!</h2>");
        }
           conexao.close();
        %>
        <a href="index.html">Voltar ao início</a>
    </body>
</html>