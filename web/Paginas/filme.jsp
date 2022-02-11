<%-- 
    Document   : filme
    Created on : 8/fev/2022, 16:07:37
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.modelo.Filme"%>
<%@page import="com.ucan.dao.FilmeDao"%>
<%@page import="com.ucan.modelo.Genero"%>
<%@page import="com.ucan.dao.GeneroDao"%>
<%@page import="com.ucan.modelo.Classificacao"%>
<%@page import="com.ucan.dao.ClassificacaoDao"%>
<%@page import="com.ucan.modelo.Realizador"%>
<%@page import="com.ucan.dao.RealizadorDao"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filme</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/pessoa.css" /> 
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
                <li class="link "><a class="active" href="pessoa.jsp">Pessoa</a>
                    
                </li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="#">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="email.jsp">Email</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
                    <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um filme</h1>
                    <form id="formCadastro" class="form-Style formCadastro" action="../PessoaServlet?opcao=1" method="POST" >
                    
                        <label class="label-texto" for="tOriginal">Titulo Original</label>
                        <input type="text" name="tOriginal" minlength="4" required>
                        
                        <label class="label-texto" for="tPortugues">Titulo Portugues</label>
                        <input type="text" name="tPortugues"  minlength="11" required>
                        
                        <label class="label-texto" for="sinopse">sinopse</label>
                        <input type="text" name="sinopse" required="true">
                        
                        <label class="label-texto" for="duracao">duracao</label>
                        <input type="time" name="duracao"required>
                        
                        <label class="label-texto" for="anoPublicado">Ano publicado</label>
                        <input type="number" name="anoPublicado" required>
                        
                        <label class="label-texto" for="realizador">Realizador</label>
                        <select name="realizador" required>
                            <%
                                RealizadorDao dao = new RealizadorDao();
                                ArrayList<Realizador> array = dao.findAll();

                                for(Realizador realizador : array){
                                   %><option><%=new PessoaDao().findId(realizador.getPessoa()).getNomeCompleto()%> </option><%
                                }
                            %>
                            
                        </select>
                        <label class="label-texto" for="classificacao">Classificaco </label>
                        <select name="classificacao" required="true">
                            <%
                                ClassificacaoDao classi = new ClassificacaoDao();
                                ArrayList<Classificacao> arraye;
                                arraye = classi.findAll();

                                for(Classificacao cla : arraye){
                                   %><option><%=cla.getDescricao()%> </option><%
                                }
                            %>
                            
                        </select>
                        
                            
                        <label class="label-texto" for="genero">Genero </label>
                        <select name="genero" required="true">
                            <%
                                GeneroDao genero = new GeneroDao();
                                ArrayList<Genero> arrayg;
                                arrayg = genero.findAll();

                                for(Genero genero1 : arrayg){
                                   %><option><%=genero1.getDescricao()%> </option><%
                                }
                            %>
                        </select>
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()">Cancelar</button>
                </form>
            </section>
            <section id="seccao-1" class="seccao-esquerda-2">
                <h2 class="h1-title">Todas os filmes do Clube</h2>
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
                <br>
                <table>
                    <thead>
                        
                        <tr>
                            <td class="addBorder"><strong>Titulo Original</strong></td>
                            <td class="addBorder"><strong>Titulo Portugues</strong></td>
                            <td class="addBorder"><strong>Sinopse</strong></td>
                            <td class="addBorder"><strong>Duracao</strong></td>
                            <td class="addBorder"><strong>Ano Publicado</strong></td>
                            <td class="addBorder"><strong>Editar</strong></td>
                            <td class="addBorder"><strong>Eliminar</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                            <%
                                FilmeDao filmes = new FilmeDao();
                                ArrayList<Filme> arrayfilme = new ArrayList<>();
                                arrayfilme = filmes.findAll();

                                for(Filme filme : arrayfilme){
                                   %>
                                <tr>
                                   <td><%=filme.getTituloOrig()%> </td>
                                   <td><%=filme.getTituloPort()%> </td>
                                   <td><%=filme.getSinopse()%> </td>
                                   <td><%=filme.getDuracao()%> </td>
                                   <td><%=filme.getAnoPublicado()%> </td>
                                                                       
                                    <td class="addBorder">
                                        <a class="btn btn-editar" href="./crud/editarFilme.jsp?id=<%=filme.getId()%>">Editar</a>
                                    </td>
                                    <td class="addBorder">
                                        <a class="btn btn-eliminar" href="./crud/editarFilme.jsp?id=<%=filme.getId()%>">Eliminar</a>
                                    </td>
                                </tr><%
                                }
                                %>  
                    </tbody>
                </table>
            </section>
    
        </section>
    </section>

    </body>
</html>
