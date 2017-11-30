
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");

            InitialContext contexto = new InitialContext();
            DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
            Connection conexao = ds.getConnection();

            String sql = "SELECT * FROM clientes WHERE email = ? AND senha = ?";

            PreparedStatement comando = conexao.prepareStatement(sql);
            comando.setString(1, email);
            comando.setString(2, senha);

            ResultSet res = comando.executeQuery();

            if (res.next()) {
                session.setAttribute("login", res.getString("nome"));
                session.setAttribute("codigo", res.getInt("codigo"));
                request.getRequestDispatcher("produtos.jsp").forward(request, response);                
            } else {
        %>  
        <h2 style="color:red">
            ACESSO NEGADO!
        </h2>
        <a href="index.jsp">Voltar ao início</a>
        <%
            }
            conexao.close();
        %> 

    </h1>
</body>
</html>
