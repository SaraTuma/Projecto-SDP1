<%-- 
    Document   : email
    Created on : 6/jan/2022, 18:49:23
    Author     : saratuma
--%>

<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.dao.EmailDao"%>
<%@page import="com.ucan.modelo.Email"%>
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
                <li class="link"><a class="active" href="actor.jsp">Actor</a>
                </li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="#">Email</a></li>
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
                            <td class="addBorder"><strong>Nome da Pessoa</strong></td>
                            <td class="addBorder"><strong>Email</strong></td>
                            <td class="addBorder"><strong>Operação</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                            <%
                                Pessoa pessoa=null;
                                for(Email email : new EmailDao().findAll()){
                                    
                                    pessoa = new PessoaDao().findId(email.getPessoa());
                                    %>
                                    <tr>
                                        <td class="addBorder"><%=pessoa.getNomeCompleto()%></td>
                                        <td class="addBorder"><%=email.getDescricao()%></td>
                                        <td>
                                            <a class="btn btn-editar" href="./crud/editarEmail.jsp?id=<%=pessoa.getId()%>&email=<%=email.getDescricao()%>">Editar</a>
                                            <a class="btn btn-eliminar" href="./crud/eliminarEmail.jsp?id=<%=pessoa.getId()%>&pessoa=<%=pessoa.getNomeCompleto()%>&email=<%=email.getDescricao()%>">Eliminar</a>
                                        </td>
                                    </tr>
                            <%
                                }
                            %>         
                    </tbody>
                </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Email</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="../CadastrarEmail" method="POST" >
                        <label class="label-texto" for="pessoa">Escolhe a Pessoa</label>
                        <select name="pessoa">
                            <%
                            for(Pessoa pessoas : new PessoaDao().findAll()){
                            %>
                            <option ><%=pessoas.getNomeCompleto()%></option>
                            <%
                                }
                            %>
                        </select>   
                         <label class="label-texto" for="email">Digite o email : </label>
                          <input type="email" name="email" required>
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()">Cancelar</button>
                    
                </form>
            </section>
        </section>
    </body>
</html>
