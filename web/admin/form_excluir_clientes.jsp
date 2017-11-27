<%-- 
    Document   : form_excluir_clientes
    Created on : 14/11/2017, 22:03:33
    Author     : Alunos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Exclusão de Clientes</h1>
        <form method="GET" action ="excluircliente.jsp">
            <input type="number" name="codigo">
            <input type="submit" name="Excluir">           
        </form>
    </body>
</html>
