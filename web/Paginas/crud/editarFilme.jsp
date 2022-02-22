<%-- 
    Document   : editarFilme
    Created on : 16/jan/2022, 15:20:53
    Author     : saratuma
--%>

<%@page import="com.ucan.modelo.Genero"%>
<%@page import="com.ucan.dao.GeneroDao"%>
<%@page import="com.ucan.modelo.Classificacao"%>
<%@page import="com.ucan.dao.ClassificacaoDao"%>
<%@page import="com.ucan.dao.RealizadorDao"%>
<%@page import="com.ucan.modelo.Realizador"%>
<%@page import="com.ucan.dao.FilmeDao"%>
<%@page import="com.ucan.modelo.Filme"%>
<%@page import="com.ucan.dao.ProvinciaDao"%>
<%@page import="com.ucan.modelo.Municipio"%>
<%@page import="com.ucan.dao.MunicipioDao"%>
<%@page import="com.ucan.modelo.Comuna"%>
<%@page import="com.ucan.dao.ComunaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Pessoa</title>
        <link rel="stylesheet" href="../../Css/comum.css">
        <link rel="stylesheet" href="../../Css/pessoa.css">
        <link rel="stylesheet" href="../../Css/editar.css">
        <style>
            .btn{
                    background-color: green;
                    border: none; padding: 0.5rem; color: white; border-radius: 0.5rem;      
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
                <li class="link "><a class="active" href="#">Pessoa</a>
                    
                </li>
                <li class="link"><a href="../actor.jsp">Actor</a></li>
                <li class="link"><a href="../realizador.jsp">Realizador</a></li>
                <li class="link"><a href="../socio.jsp">Socio</a></li>
                <li class="link"><a href="../filme.jsp">Filme</a></li>
                <li class="link"><a href="../filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="../alugar.jsp">Alugar</a></li>
                <li class="link"><a href="../telefone.jsp">Telefone</a></li>
                <li class="link"><a href="../email.jsp">Email</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar Filmes </h1>
                <% Integer filmeId = Integer.parseInt(request.getParameter("id").trim());%>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarFilme?id=<%=filmeId%>" method="post" >
                    <% Filme filme =  new FilmeDao().findById(filmeId);%>
                      
                        <label class="label-texto" for="tOriginal">Titulo Original</label>
                        <input type="text" name="tOriginal" minlength="2" value="<%=filme.getTituloOrig()%>">
                       
                        <label class="label-texto" for="tPortugues">Titulo Portugues</label>
                        <input type="" name="tPortugues"  minlength="2" value="<%=filme.getTituloPort()%>">
                        
                        <label class="label-texto" for="sinopse">Sinopse</label>
                        <textarea rows="10" cols="40" name="sinopse" ><%=filme.getSinopse()%></textarea>
                        
                        <label class="label-texto" for="duracao">Duracao</label>
                        <input type="time" name="duracao" step="1" value="<%=filme.getDuracao()%>">
                        
                        <label class="label-texto" for="anoPublicado">Ano publicado</label>
                        <input type="number" name="anoPublicado" value="<%=filme.getAnoPublicado()%>">
                        
                        <label class="label-texto" for="nomeRealizador">Realizador</label>
                        
                        <% String nomeRealizador = new RealizadorDao().getRealizadorName(filme.getRealizador());%>
                        <select name="nomeRealizador" required>
                            <option selected="true"><%=nomeRealizador%></option>
                            <%
                               String nomeR;
                               for(Realizador realizador : new RealizadorDao().findAll()){
                                   nomeR = new RealizadorDao().getRealizadorName(realizador.getId());
                                   if(!nomeR.equals(nomeRealizador)){
                                   %><option><%=new RealizadorDao().getRealizadorName(realizador.getId())%> </option><%
                                   }
                                }
                            %>
                            
                        </select>
                            
                        <label class="label-texto" for="classificacao">Classificaco </label>
                        <% String nomeClassificacao = new ClassificacaoDao().getDescricao(filme.getClassificacao()); %>
                        <select name="classificacao" required="true">
                            <option selected="true"><%=nomeClassificacao%></option>
                            <%
                                for(Classificacao cla : new ClassificacaoDao().findAll()){
                                    if(!cla.getDescricao().equals(nomeClassificacao)){
                                   %><option><%=cla.getDescricao()%> </option><%
                                    }
                                }
                            %>
                            
                        </select>
                                                    
                        <label class="label-texto" for="genero">Genero </label>
                        <%String nomeGenero = new GeneroDao().getDescricao(filme.getGenero());%>
                        <select name="genero" required="true">
                            <option selected="true"><%=nomeGenero%></option>
                            <%
                                for(Genero genero : new GeneroDao().findAll()){
                                    if(!nomeGenero.equals(genero.getDescricao())){
                                   %><option><%=genero.getDescricao()%> </option><%
                                     }
                                }
                            %>
                        </select>
                        
                        <label class="label-texto" for="dataCadastro">Data de Cadastro</label>
                        <input type="date" name="dataCadastro" value="<%=filme.getDataCadastro()%>">
                        
                        <input type="submit" class="btn" value="Editar">
                        <a class="btn btn-eliminar" href="../filme.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
