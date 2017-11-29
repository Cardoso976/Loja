
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@page import="javax.naming.InitialContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="Rodrigo Caio Vinicius Jhonatan" content="">
        <title>Fatec Shop</title> 
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>        
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.css" type="text/css">     
    </head>

    <body>
        <%
            String login;

            if (session.getAttribute("login") != null) {
                login = (String) session.getAttribute("login");
            } else {
                login = null;
            }
        %>

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
                            <li><a href="sobre.jsp">Sobre</a></li>
                            <li><a href="contato.jsp">Contato</a></li>
                                <%
                                    if (login != null && login.equals("Admin")) {
                                %>
                            <li><a href="admin/index.html">ADM</a></li>
                                <%
                                    }
                                %>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">                            
                            <%
                                if (login == null) {
                            %>
                            <li>
                                <a class="btn btn-large" href="#" id="logar" data-toggle="modal" data-target="#login">Login</a>                        
                            </li>
                            <%
                            } else {
                            %>
                            <li>
                                <a class="btn btn-large" href="#">Olá <%=session.getAttribute("login")%></a>
                            </li>
                            <li>
                                <a class="btn btn-large" href="logout.jsp">Sair</a>
                            </li>
                            <%
                                }
                            %>
                        </ul>                        
                    </div>     
                </div>
            </nav>
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

        </div>
        <div>
        </div>
        <div class="container">   
            <!-- Modal -->
            <div class="modal fade" id="login" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:35px 50px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
                        </div>
                        <div class="modal-body" style="padding:40px 50px;">
                            <form role="form" action="validar.jsp" method= "POST">
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Usuário</label>
                                    <input type="text" class="form-control" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Senha</label>
                                    <input type="password" class="form-control" name="senha" placeholder="Senha">
                                </div>
                                <div class="checkbox">
                                    <label><input type="checkbox" value="" checked>Lembrar-me</label>
                                </div>
                                <button type="submit" id="confimar-login" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancelar</button>
                            <p>Não é inscrito? <a href="#" id="registrar" data-toggle="modal" data-target="#registro">Registre-se</a></p>

                        </div>
                    </div>
                </div>
            </div> 
        </div>

        <!--Modal Registro-->
        <div class="container">   
            <!-- Modal -->
            <div class="modal fade" id="registro" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header" style="padding:35px 50px;">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4><span class="glyphicon glyphicon-plus-sign"></span> Registre-se</h4>
                        </div>
                        <div class="modal-body" style="padding:40px 50px;">
                            <form role="form" action="incluir_cliente.jsp" method= "POST">
                                <div class="form-group">
                                    <label for="usrname"><span class="glyphicon glyphicon-user"></span> Nome</label>
                                    <input type="text" class="form-control" name="nome" placeholder="Nome">
                                </div>
                                <div class="form-group">
                                    <label for="ender"><span class="glyphicon glyphicon-home"></span> Endereço </label>
                                    <input type="text" class="form-control" name="endereco" placeholder="Endereço">
                                </div>
                                <div class="form-group">
                                    <label for="cidade"><span class="glyphicon glyphicon-home"></span> Cidade </label>
                                    <input type="text" class="form-control" name="cidade" placeholder="Cidade">
                                </div>
                                <div class="form-group">
                                    <label for="cidade"><span class="glyphicon glyphicon-home"></span> Estado </label>
                                    <input type="text" class="form-control" name="estado" placeholder="Estado">
                                </div>
                                <div class="form-group">
                                    <label for="email"><span class="glyphicon glyphicon-envelope"></span> E-mail </label>
                                    <input type="text" class="form-control" name="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Digite a Senha</label>
                                    <input type="password" class="form-control" name="senha" placeholder="Senha">
                                </div> 
                                <button type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-off"></span> 
                                    Registre-se
                                </button>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button id="btn_cancelar" type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> 
                                Cancelar
                            </button>                                
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <!--Modal Registro-->

        <script src="js/jQuery.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/bootbox.min.js"></script>
        <script src="js/site.js"></script>
    </div>
</body>
</html>