<%-- 
    Document   : alugar
    Created on : 6/jan/2022, 2:53:19
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alugar</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/pessoa.css" /> 
        <script src="../Javascript/comum.js"></script>
    </head>
    <body>
         <header>header

        
    </header>
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link"><a href="pessoa.jsp">Pessoa</a></li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a  href="filme-actor.jsp">Actores e Filmes</a></li>
                <li class="link"><a class="active" href="#">Alugados</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                
                <h1 class="h1-title">Todos os Alugados do Clube</h1>
                <button class="btn btn-editar" onclick="mostrarSeccaoCadastrar()">Cadastrar</button>
                <br>
                 <p class="p-erro">
                         <%
                             String r=request.getParameter("erro") ;
                             String b=r+"ab";
                             if(! b.equals("nullab")){
                                out.println(r);
                             }
                            
                         
                         %>
                </p> 
                <table>
                    <thead>
                        <tr>
                            <td class="addBorder"><strong>Nome</strong></td>
                            <td class="addBorder"><strong>Data de cadastro</strong></td>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="addBorder">Sara Tuma</td>
                            <td class="addBorder">29-04-2010</td>
                        </tr>
                        <tr>
                            <td class="addBorder">Isaura Manico</td>
                            <td class="addBorder">29-04-2010</td>
                            
                        </tr>

                        <tr>
                            <td class="addBorder">Creuma Kuzola</td>
                            <td class="addBorder">29-04-2010</td>
                            
                        </tr>
                        <tr>
                            <td class="addBorder">Eufranio Diogo</td>
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
            
        </section>
    </body>
</html>
