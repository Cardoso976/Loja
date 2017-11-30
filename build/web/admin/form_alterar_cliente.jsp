<%-- 
    Document   : form_alterar_cliente
    Created on : 21/11/2017, 22:09:50
    Author     : rodrigo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
        <h1>Alteração de Cliente</h1>
        <%
        String codigo = request.getParameter("codigo");

        InitialContext contexto = new InitialContext();
        DataSource ds = (DataSource)contexto.lookup("jdbc/loja");
        Connection conexao = ds.getConnection();
        String sql = "SELECT * FROM clientes WHERE codigo = ?";
        PreparedStatement comando = conexao.prepareStatement(sql);
        comando.setInt(1, Integer.parseInt(codigo));
        ResultSet res = comando.executeQuery();
        res.next();
        %>
        <form method="POST" action="alterarcliente.jsp">
            <table border="1">
                <tr>
                    <td>Código</td>
                    <td><%= res.getInt("codigo")%>
                        <input type="hidden" name="codigo" 
                        value="<%= res.getInt("codigo")%>">
                    </td>
                </tr>
                <tr>
                    <td>Nome</td>
                    <td>
                        <input type="text" name="nome" size="50" maxlength="50" 
                        value="<%= res.getString("nome")%>">
                    </td>
                </tr> 
                <tr>
                    <td>Endereço</td>
                    <td>
                        <input type="text" name="enderecos" size="50" maxlength="50" 
                        value="<%= res.getString("endereco")%>">
                    </td>
                </tr>  
                <tr>
                    <td>Cidade</td>
                    <td>
                        <input type="text" name="cidade" size="30" maxlength="30" 
                        value="<%= res.getString("cidade")%>">
                    </td>
                </tr>  
                <tr>
                    <td>Estado</td>
                    <td>
                        <input type="text" name="estado" size="50" maxlength="50" 
                        value="<%= res.getString("estado")%>">
                    </td>
                </tr> 
                <tr>
                    <td>Email</td>
                    <td>
                        <input type="text" name="email" size="50" maxlength="50" 
                        value="<%= res.getString("email")%>">
                    </td>
                </tr>  
                <tr>
                    <td>Senha</td>
                    <td>
                        <input type="text" name="senha" size="50" maxlength="50" 
                        value="<%= res.getString("senha")%>">
                    </td>
                </tr>  
                <tr>
                    <td colspan="2"><input type="submit"></td>
                </tr>
                <%conexao.close();%>            
            </table>
        </form>       
        
    </body>
</html>
