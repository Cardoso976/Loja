<%-- 
    Document   : produtos
    Created on : 27/11/2017, 11:27:10
    Author     : Rodrigo Cardoso
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="Rodrigo Caio Vinicius Jhow" content="">
        <title>Fatec Shop</title> 
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css">     
    </head>
    <body class="container">        

        <div class="container">
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.jsp">Fatec Shop</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="produtos.jsp">Produtos</a></li>                            
                            <li><a href="sobre.html">Sobre</a></li>
                            <li><a href="servicos.html">Serviços</a></li>
                            <li><a href="contato.html">Contato</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#" id="cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><span class="badge">3</span></a>
                            </li>
                            <%
                                if (session.getAttribute("login") == null) {
                            %>
                            <li>
                                <a class="btn btn-large" href="#" id="logar" data-toggle="modal" data-target="#login">Login</a>                        
                            </li>
                            <%
                            } else {
                                String login = (String) session.getAttribute("login");
                            %>
                            <li>
                               <a class="btn btn-large" href="#">Olá <%=session.getAttribute("login")%></a>
                           </li>
                            <%
                                }
                            %>

                        </ul>
                    </div>     
                </div>
            </nav>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <h3>Mais de 100 Milhões de Vendas</h3>
                <hr>
            </div>
        </div>                   
        <div class="row text-center">  
            <%
                InitialContext contexto = new InitialContext();
                DataSource ds = (DataSource) contexto.lookup("jdbc/loja");
                Connection conexao = ds.getConnection();

                String sql = "SELECT * FROM produtos";

                PreparedStatement comando = conexao.prepareStatement(sql);
                ResultSet res = comando.executeQuery();

                while (res.next()) {
                    out.println("<div class=\"col-md-3 col-sm-6 hero-feature\">");
                    out.println("<div class=\"thumbnail\">");
                    out.println("<img id=\"container_img\" src=" + res.getString("url") + " />");
                    out.println("<div class=\"caption\">");
                    out.println("<h5><b>" + res.getString("titulo") + "</b></h5>");
                    out.println("<h6>" + res.getString("autor") + "</h6>");
                    out.println("<p>R$ " + res.getDouble("preco") + "</p>");
                    out.println("<p><a href=\"#\" class=\"btn btn-primary\" >Compre!</a> <a href=\"#\" class=\"btn btn-default\" >Mais</a></p>");
                    out.println("</div>");
                    out.println("</div>");
                    out.println("</div>");
                }
                conexao.close();
            %>            
        </div>

        <footer class="rodape collapse navbar-collapse">
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Fatec Shop 2017</p>
                </div>
            </div>
        </footer>
    </body>
</html>
