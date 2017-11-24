<%-- 
    Document   : index
    Created on : 24/11/2017, 15:49:53
    Author     : Rodrigo Cardoso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt">
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

    <body>        

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
                            <li><a href="produtos.html">Produtos</a></li>                            
                            <li><a href="sobre.html">Sobre</a></li>
                            <li><a href="servicos.html">Serviços</a></li>
                            <li><a href="contato.html">Contato</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="#" id="cart"><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span><span class="badge">3</span></a>
                            </li>
                            <li>
                                <a class="btn btn-large" href="#" id="logar" data-toggle="modal" data-target="#login">Login</a>
                            </li>
                        </ul>
                    </div>     
                </div>
            </nav>
            <div class="container">
                <header class="jumbotron cabecalho">
                    <h1>Bem vindo!</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
                </header>                   

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
                                <form role="form">
                                    <div class="form-group">
                                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Usuário</label>
                                        <input type="text" class="form-control" id="usrname" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Senha</label>
                                        <input type="password" class="form-control" id="psw" placeholder="Senha">
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
                                <p>Esqueceu a <a href="#">Senha?</a></p>
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
                                <form role="form">
                                    <div class="form-group">
                                        <label for="usrname"><span class="glyphicon glyphicon-user"></span> Nome</label>
                                        <input type="text" class="form-control" id="usrname" placeholder="Nome">
                                    </div>
                                    <div class="form-group">
                                        <label for="ender"><span class="glyphicon glyphicon-home"></span> Endereço </label>
                                        <input type="text" class="form-control" id="endereco" placeholder="Endereço">
                                    </div>
                                    <div class="form-group">
                                        <label for="cidade"><span class="glyphicon glyphicon-home"></span> Cidade </label>
                                        <input type="text" class="form-control" id="cidade" placeholder="Cidade">
                                    </div>
                                    <div class="form-group">
                                        <label for="cidade"><span class="glyphicon glyphicon-home"></span> Estado </label>
                                        <input type="text" class="form-control" id="estado" placeholder="Estado">
                                    </div>
                                    <div class="form-group">
                                        <label for="email"><span class="glyphicon glyphicon-envelope"></span> E-mail </label>
                                        <input type="text" class="form-control" id="email" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Digite a Senha</label>
                                        <input type="password" class="form-control" id="senha" placeholder="Senha">
                                    </div>                                    
                                    <!--<div class="checkbox">
                                         <label><input type="checkbox" value="" checked>Lembrar-me</label>
                                     </div>-->
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
