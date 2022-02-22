<%-- 
    Document   : actor.jsp
    Created on : 6/jan/2022, 2:43:43
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.modelo.Actor"%>
<%@page import="com.ucan.dao.ActorDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Actor</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/actor-realizador.css" /> 
        <script src="../Javascript/comum.js"></script>
        <style>
            .btn{
                    background-color: green;
                    border: none; padding: 0.5rem; color: white; border-radius: 0.5rem; 
                    font-weight: 1.2rem;
                    text-decoration: none;
                    cursor: pointer;
            }
            .btn-eliminar{
                background-color: red;
            }
        </style>
    </head>
    <body>
    
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link"><a href="pessoa.jsp">Pessoa</a></li>
                <li class="link"><a class="active" href="#">Actor</a>
                </li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="email.jsp">Email</a></li>
                <li class="link"><a href="formDefesa.jsp">Defesa</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                <h1 class="h1-title">Todos os Actores do Clube</h1>
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
                            <td class="addBorder"><strong>Operação</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                            <%
                                ArrayList<Actor> actores = new ActorDao().findAll();
                                String nome=null;
                                for(Actor actor : actores){
                                    
                                    nome = new ActorDao().getPessoaNome(actor.getPessoa());
                                    %>
                                    <tr>
                                        <td class="addBorder"><%=nome%></td>
                                        <td class="addBorder"><%=actor.getDataCadastro()%></td>
                                        <td>
                                            <a class="btn btn-editar" href="./crud/editarActor.jsp?nome=<%=nome%>&data=<%=actor.getDataCadastro()%>">Editar</a>
                                            <a class="btn btn-eliminar" href="./crud/eliminarActor.jsp?nome=<%=nome%>&data=<%=actor.getDataCadastro()%>">Eliminar</a>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>         
                    </tbody>
                </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Actor</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="../CadastrarActor" method="POST" >
                    
                        <label class="label-texto" for="nomePessoa">Escolhe o Actor</label>
                        <select name="nomePessoa">
                            <%
                            for(Pessoa pessoa : new PessoaDao().findAllPersonNotActors()){
                            %>
                            <option ><%=pessoa.getNomeCompleto()%></option>
                            <%
                            }
                            %>
                            
                        </select>                     
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <a class="btn btn-eliminar" href="actor.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </body>
</html>
