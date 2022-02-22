<%-- 
    Document   : eliminarFilme
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
                <h1 class="h1-title">Tem certeza que quer eliminar esses dados? </h1>
                <% Integer filmeId = Integer.parseInt(request.getParameter("id").trim());%>
                <form id="formEditar" class="form-Style formEditar" action="../../EliminarFilme?id=<%=filmeId%>" method="POST" >
                    <% Filme filme =  new FilmeDao().findById(filmeId);%>
                      
                        <label class="label-texto" for="tOriginal">Titulo Original</label>
                        <input type="text" name="tOriginal" disabled="disabled" value="<%=filme.getTituloOrig()%>">
                        <label class="label-texto" for="tPortugues">Titulo Portugues</label>
                        <input type="" name="tPortugues"  disabled="disabled" value="<%=filme.getTituloPort()%>">
                        <label class="label-texto" for="sinopse">Sinopse</label>
                        <textarea rows="15" cols="40" disabled="disabled" name="sinopse" ><%=filme.getSinopse()%></textarea>
                        <label class="label-texto" for="duracao">Duracao</label>
                        <input type="time" name="duracao" disabled="disabled" value="<%=filme.getDuracao()%>">
                        <label class="label-texto" for="anoPublicado">Ano publicado</label>
                        <input type="number" name="anoPublicado" disabled="disabled" value="<%=filme.getAnoPublicado()%>">
                        <label class="label-texto" for="realizador">Realizador</label>
                        <select name="realizador" required>
                            <option disabled="disabled" selected="true"><%=new RealizadorDao().getRealizadorName(filme.getRealizador())%></option>
                                                       
                        </select>
                        <label class="label-texto" for="classificacao">Classificaco </label>
                        <select name="classificacao" required="true">
                            <option disabled="disabled" selected="true"><%=new ClassificacaoDao().getDescricao(filme.getClassificacao())%></option>
                        </select>
                            
                        <label class="label-texto" for="genero">Genero </label>
                        <select name="genero" required="true">
                            <option  selected="true"><%=new GeneroDao().getDescricao(filme.getGenero())%></option>
                        </select>
                        <label class="label-texto" for="duracao">Data de Cadastro</label>
                        <input type="date" name="duracao" disabled="disabled" value="<%=filme.getDataCadastro()%>">
                        <input type="submit" class="btn" value="Eliminar">
                        <a class="btn btn-eliminar" href="../filme.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
