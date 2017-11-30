

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar Clientes</title>
    </head>
    <body>
        <h1>Alteração de Produto</h1>
        <%
        String codigo = request.getParameter("codigo");

        InitialContext contexto = new InitialContext();
        DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
        Connection conexao = ds.getConnection();
        String sql = "SELECT * FROM produtos WHERE codigo = ?";
        PreparedStatement comando = conexao.prepareStatement(sql);
        comando.setInt(1, Integer.parseInt(codigo));
        ResultSet res = comando.executeQuery();
        res.next();
        %>
        <form method="POST" action="alterarproduto.jsp">
            <table border="1">
                <tr>
                    <td>Código</td>
                    <td><%= res.getInt("codigo")%>
                        <input type="hidden" name="codigo" 
                        value="<%= res.getInt("codigo")%>">
                    </td>
                </tr>
                <tr>
                    <td>Título</td>
                    <td><%= res.getString("titulo")%>
                        <input type="text" name="titulo" size="50" maxlength="50" 
                        value="<%= res.getString("titulo")%>">
                    </td>
                </tr> 
                <tr>
                    <td>Autor</td>
                    <td><%= res.getString("autor")%>
                        <input type="text" name="autor" size="50" maxlength="50" 
                        value="<%= res.getString("autor")%>">
                    </td>
                </tr>  
                <tr>
                    <td>Url</td>
                    <td><%= res.getString("url")%>
                        <input type="text" name="url" size="50" maxlength="50" 
                        value="<%= res.getString("url")%>">
                    </td>
                </tr>
                <tr>
                    <td>Preço</td>
                    <td><%= res.getString("preco")%>
                        <input type="text" name="preco" size="50" maxlength="50" 
                        value="<%= res.getString("preco")%>">
                    </td>
                </tr>  
                <tr>
                    <td>Quantidade Estoque</td>
                    <td><%= res.getString("quantidade_estoque")%>
                        <input type="text" name="quantidade_estoque" size="50" maxlength="50" 
                        value="<%= res.getString("quantidade_estoque")%>">
                    </td>
                </tr>  
                <tr>
                    <td colspan="2"><input type="submit"></td>
                </tr>
                <%conexao.close();%>            
            </table>
        </form>
        <br><a href="listarprodutos.jsp">Voltar ao início</a>            
    </body>
</html>
