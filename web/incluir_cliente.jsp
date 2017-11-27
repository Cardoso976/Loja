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
            String nome = request.getParameter("nome");
            String endereco = request.getParameter("endereco");
            String cidade = request.getParameter("cidade");
            String estado = request.getParameter("estado");
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "INSERT INTO clientes (nome, endereco, cidade, estado, email, senha) VALUES (?,?,?,?,?,?)";
            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, nome);
            comando.setString(2, endereco);
            comando.setString(3, cidade);
            comando.setString(4, estado);
            comando.setString(5, email);
            comando.setString(6, senha);
            if (comando.executeUpdate() > 0){
               out.println("<h2>CADASTRO REALIZADO COM SUCESSO!</h2>");
           }else{
            out.println("<h2>FALHA NO CADASTRO!</h2>");
        }
           conexao.close();
        %>

    </body>
</html>
