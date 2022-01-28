<%-- 
    Document   : filme-actor
    Created on : 6/jan/2022, 2:53:41
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actores de filmes</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/actor-realizador.css" /> 
        <script src="../Javascript/comum.js"></script>
    </head>
    <body>
        <header>header

        
    </header>
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link"><a href="pessoa.jsp">Pessoa</a>
                   
                </li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link link-novo"><a class="active" href="#">Filme de Actores</a>
                    <ul id="lista-interior" class="lista-esquerda-interior">
                        <li onclick="mostrarSeccaoVisualizar()">Visualizar</li>
                        <li onclick="mostrarSeccaoCadastrar()">Cadastrar</li>
                        <li onclick="mostrarSeccaoEditar()">Editar</li>
                        <li onclick="mostrarSeccaoEliminar()">Eliminar</li>
                    </ul>
                </li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
            <section  class="seccao-esquerda-2">
                <h1 class="h1-title">Todos os filmes de Actores do clube</h1>
                <table>
                    <thead>
                        
                        <tr>
                            <td class="addBorder"> <strong>Nome do Actor</strong></td>
                            <td class="addBorder"><strong>Filme</strong></td>
                            <td class="addBorder"><strong>Data de cadastro</strong></td>
                        </tr>
                    </thead>
                    <tbody>

                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr> <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr> <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">Spider Man</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>

                    </tbody>
                </table>
            </section>

            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Actor</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="" method="post" >
                    
                        <label class="label-texto" for="actor">Escolhe o Actor</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>                     
                        <input type="submit" class="button-enviar" value="Cadastrar">
                    
                </form>
            </section>
            <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar dados de um Actor</h1>
                <form id="formEditar" class="form-Style formEditar" action="" method="post" >
                    
                    <label class="label-texto" for="actor">Escolhe o Actor</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <label class="label-texto" for="data_cadastro">Data de Cadastro</label>
                        <input type="date" name="data_cadastro" id="data_cadastro">                      
                       
                        <input type="submit" class="button-enviar" value="Editar">
                    
                </form>
            </section>
            <section id="seccao-4" class="seccao-eliminar">
                <h1 class="h1-title">Eliminar um Actor</h1>
                <form id="formEditar" class="form-Style form-eliminar" action="" method="post" >
                    <label class="label-texto" for="pessoa">Escolhe o Actor</label>
                    <select name="actor">
                        <option value="">Sara Tuma</option>
                        <option value="">Isaura Manico</option>
                        <option value="">Marilda Sungu</option>
                        <option value="">Creuma Kuzola</option>
                    </select>
                    <input type="submit" class="button-enviar" value="Eliminar">
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
