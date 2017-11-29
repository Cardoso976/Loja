<%@page import="java.sql.ResultSet"%>
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

            String codigo = request.getParameter("id");
            int codigo_cliente = Integer.parseInt(codigo); 
            
            if (codigo_cliente != 0) {               
                int codigo_produto = Integer.parseInt(request.getParameter("codigo"));
                int quantidade = 1;
                int quantidade_estoque = Integer.parseInt(request.getParameter("estoque"));
                Double preco = Double.parseDouble(request.getParameter("preco"));
                
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
                Connection conexao = ds.getConnection();
                    
                if (quantidade <= quantidade_estoque) {
                    
                String sql = "INSERT INTO pedidos (codigo_do_cliente, codigo_do_produto, quantidade_comprada, preco_unitario) VALUES (?,?,?,?)";
                PreparedStatement comandoInsert = conexao.prepareStatement(sql);
                    
                out.println("<h1>"+codigo_cliente+"</h1>");
                   comandoInsert.setInt(1, codigo_cliente);
                   comandoInsert.setInt(2, codigo_produto);
                   comandoInsert.setInt(3, quantidade);
                   comandoInsert.setDouble(4, preco);
                   
                if (comandoInsert.executeUpdate() > 0) {
                         /*//int saldoNovo = quantidade_estoque - quantidade;
                        /*String sqlUpdate = "UPDATE produtos SET quantidade_estoque=" + saldoNovo + " WHERE codigo=" + codigo_produto + "";
                        PreparedStatement comandoUpdate = conexao.prepareStatement(sql);

                        if (comandoUpdate.executeUpdate() > 0) {
                            out.println("<h2>CADASTRO REALIZADO COM SUCESSO!</h2>");
                        } else {
                            out.println("<h2>FALHA NO PEDIDO!</h2>");
                        }
                    } else {
                        out.println("<h2>FALHA NO PEDIDO!</h2>");*/
                    }
                } else {
                    out.println("<h2>SEM ESTOQUE!</h2>");
                }
                conexao.close();                
            } else {
            out.println("<h1>Efetue o Login!!</h1><br><a href=\"produtos.jsp\">Voltar a Produtos</a>");
            }
        %>

    </body>
</html>