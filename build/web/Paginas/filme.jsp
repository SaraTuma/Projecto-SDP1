<%-- 
    Document   : filme
    Created on : 6/jan/2022, 2:39:37
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.FilmeDao"%>
<%@page import="com.ucan.modelo.Filme"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Filmes</title>
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
                <li class="link "><a href="pessoa.jsp">Pessoa</a></li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"> <a  class="active" href="#">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita">
                <section id="seccao-1" class="seccao-esquerda-2">
                    <h1 class="h1-title">Todos os Filmes do Clube</h1>
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
                                <td class="addBorder"> <strong>Titulo Original</strong></td>
                                <td class="addBorder"> <strong>Titulo Português</strong></td>
                                <td class="addBorder"><strong>Sinopse</strong></td>
                                <td class="addBorder"> <strong>Duração</strong></td>
                                <td class="addBorder"> <strong>Realizador</strong></td>
                                <td class="addBorder"> <strong>Classificação</strong></td>
                                <td class="addBorder"> <strong>Genero</strong></td>
                                <td class="addBorder"><strong>Data cadastro</strong></td>
                                <td class="addBorder"><strong>Acção</strong></td>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<Filme> filmes = new FilmeDao().findAll();
                                for(Filme filme : filmes) {
                                    %>
                            <tr>
                                <td class="addBorder"><%=filme.getTituloOrig()%></td>
                                <td class="addBorder"><%=filme.getTituloPort()%></td>
                                <td class="addBorder"><%=filme.getSinopse()%></td>
                                <td class="addBorder"><%=filme.getDuracao()%></td>
                                <td class="addBorder"><%=filme.getRealizador()%></td>
                                <td class="addBorder"><%=filme.getClassificacao()%></td>
                                <td class="addBorder"><%=filme.getGenero()%></td>
                                <td class="addBorder"><%=filme.getDataCadastro()%></td>
                                <td class="addBorder">
                                
                                    <a class="btn btn-editar addBorder" href="./crud/editarFilme.jsp?tituloorig=<%=filme.getTituloOrig()%>">Editar</a>
                                    
                                    <a class="btn btn-eliminar addBorder" href="./crud/eliminarFilme.jsp?tituloorig=<%=filme.getTituloOrig()%>">Eliminar</a>
                                
                                </td>
                            </tr>
                            <%
                                  }
                            %>
                              
                        </tbody>
                    </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Filme</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="" method="post" >
                    
                        <label class="label-texto" for="nome_completo">Titulo Original</label>
                        <input type="text" name="nome_completo" id="nome_completo" required>
                        <label class="label-texto" for="nome_completo">Titulo Português</label>
                        <input type="text" name="nome_completo" id="nome_completo">
                        <label class="label-texto" for="nome_completo">Sinopse</label>
                        <textarea name="" id="" cols="30" rows="5" required></textarea>
                        <label class="label-texto" for="nome_completo">Duração</label>
                        <input type="time" name="nome_completo" id="nome_completo">                        
                        <label class="label-texto" for="actor">Realizador</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <label class="label-texto" for="actor">Classificação</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <label class="label-texto" for="actor">Genero</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()()">Cancelar</button>
                    
                </form>
            </section> 
            
    </section>
    </body>
</html>
