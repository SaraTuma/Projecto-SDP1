<%-- 
    Document   : filme-actor
    Created on : 6/jan/2022, 2:53:41
    Author     : saratuma
--%>

<%@page import="com.ucan.modelo.Filme"%>
<%@page import="com.ucan.dao.FilmeDao"%>
<%@page import="com.ucan.modelo.Actor"%>
<%@page import="com.ucan.dao.ActorDao"%>
<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.dao.FilmeActorDao"%>
<%@page import="com.ucan.modelo.FilmeActor"%>
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
                <li class="link"><a class="active" href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a href="#">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="email">Email</a></li>
                <li class="link"><a href="formDefesa.jsp">Defesa</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                <h1 class="h1-title">Todos os Emails do Clube</h1>
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
                            <td class="addBorder"><strong>Nome do Actor</strong></td>
                             <td class="addBorder"><strong>Titulo do Filme</strong></td>
                            <td class="addBorder"><strong>Data de Cadastro</strong></td>
                            <td class="addBorder"><strong>Operação</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                            <%
                                Pessoa pessoa=null;
                                String nomeActor=null;
                                Integer idPessoa=null;
                                String titulosFilme =null;
                                for(FilmeActor filme : new FilmeActorDao().findAll()){
                                    idPessoa = new ActorDao().getPessoaId(filme.getActor());
                                    nomeActor = new ActorDao().getPessoaNome(idPessoa);
                                    titulosFilme = new FilmeDao().findByTitles(filme.getFilme());
                                    %>
                                    <tr>
                                        <td class="addBorder"><%=nomeActor%></td>
                                        <td class="addBorder"><%=titulosFilme%></td>
                                        <td class="addBorder"><%=filme.getDataCadastro()%></td>
                                        <td>
                                            <a class="btn btn-editar" href="./crud/editarFilmeActor.jsp?idFilme=<%=filme.getFilme()%>&idActor=<%=filme.getActor()%>">Editar</a>
                                            <a class="btn btn-eliminar" href="./crud/eliminarFilmeActor.jsp?idFilme=<%=filme.getFilme()%>&idActor=<%=filme.getActor()%>">Eliminar</a>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>         
                    </tbody>
                </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Actor em um filme</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="../CadastrarEmail" method="POST" >
                        <label class="label-texto" for="nomeActor">Escolhe a Pessoa</label>
                        <select name="nomeActor">
                            <%
                               
                                String nome=null;

                                for(Actor actor :  new ActorDao().findAll()){
                                    
                                    nome = new ActorDao().getPessoaNome(actor.getPessoa());
                                    %>
                                    <option><%=nome%></option>
                                    <%
                                    }%>
                        </select>   
                        <label class="label-texto" for="tituloFilme">Escolhe a Pessoa</label>
                        <select name="tituloFilme">
                            <%

                                for(Filme filme : new FilmeDao().findAll()){
                            %>
                            <option><%=filme.getTituloOrig()%> <%=filme.getTituloPort()%></option>
                            <%}%>
                        </select> 
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()">Cancelar</button>
                    
                </form>
            </section>
        </section>
    </body>
</html>
