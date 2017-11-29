
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Inclusão de Produto</h1>
        <form method="POST" action="incluirproduto.jsp">
            <table border="1">
                <tr>
                    <td>Código</td>
                    <td>
                        <input type="hidden" name="codigo">
                    </td>
                </tr>
                <tr>
                    <td>Título</td>
                    <td>
                        <input type="text" name="titulo" size="50" maxlength="50">
                    </td>
                </tr> 
                <tr>
                    <td>Autor</td>
                    <td>
                        <input type="text" name="autor" size="50" maxlength="50">
                    </td>
                </tr>  
                <tr>
                    <td>Url</td>
                    <td>
                        <input type="text" name="url" size="50" maxlength="50">
                    </td>
                </tr>
                <tr>
                    <td>Preço</td>
                    <td>
                        <input type="text" name="preco" size="50" maxlength="50">
                    </td>
                </tr>  
                <tr>
                    <td>Quantidade Estoque</td>
                    <td>
                        <input type="text" name="quantidade_estoque" size="50" maxlength="50">
                    </td>
                </tr>  
                <tr>
                    <td colspan="2"><input type="submit"></td>
                </tr>                            
            </table>
        </form>       
        
    </body>
</html>
