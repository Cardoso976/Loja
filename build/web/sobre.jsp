

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
            <h1>Sobre nós</h1>
            <p align="justify">
            Há mais de 14 anos no mercado, a Fatec-Shop é integrante de uma das maiores distribuidoras de livros do Brasil: a BOOKPartners. Com um catálogo amplo e diversificado composto por mais de 200 mil títulos, a empresa possui as melhores opções em livros de diferentes áreas do conhecimento, como Direito, Medicina, Engenharia e Piscologia, entre outras. E ainda é certificada pelo selo Ebit, que representa a excelência dessa loja virtual.</p>

            <br>

            <img src="img/estoque.png">



            <p align="justify"><br>Nossa empresa surgiu com o intuito de ser tornar referência no mercado em nossa área de atuação. Temos uma equipe qualificada e eficiente comprometida em superar as expectativas dos nossos clientes. Atuamos com seriedade, transparência e, sobretudo, respeito. Prezamos sempre pela qualidade do atendimento, estando prontos para atender e satisfazer as necessidades dos clientes.</p>

            <br>

            <img src="img/estoque2.jpg" width="740" height="370">

            <p align="justify"><br>A missão da empresa Fatec-Shop é fornecer soluções para empresas de e-commerce e Internet. Nossos principais clientes são leitores apaixonados por classicos. Fundada em 2003 pelos Senhores Caio, Jonathan, Rodrigo e Vinicius, na cidade Garça, onde, atualmente contamos com 500 mil funcionários.
            <br><br> Além da forte atuação no comércio eletrônico, a Fatec-Shop também está presente no meio físico, com várias lojas espalhadas por todo o país O desempenho da companhia é tão positivo que, em 2016 – pelo segundo ano consecutivo –, a rede ganhou o prêmio “Melhores Prestadores de Serviços do Brasil”, realizado pelo jornal o Estado de São Paulo, em que foi avaliado o índice de satisfação dos clientes ao utilizarem os nossos veículos de atendimento e de prestação de serviço. Conte com as nossas lojas para investir em seu desenvolvimento pessoal e encontrar os melhores títulos para você!</p>    

            <hr>

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
                                    <input type="text" class="form-control" id="txt_nome" name="email" placeholder="Email">
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