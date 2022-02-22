<%-- 
    Document   : formDefesa
    Created on : 15/fev/2022, 14:59:43
    Author     : saratuma
--%>

<%@page import="com.ucan.modelo.Genero"%>
<%@page import="com.ucan.dao.GeneroDao"%>
<%@page import="com.ucan.dao.CategoriaSocioDao"%>
<%@page import="com.ucan.modelo.CategoriaSocio"%>
<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.dao.SocioDao"%>
<%@page import="com.ucan.modelo.Socio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ucan.modelo.Classificacao"%>
<%@page import="com.ucan.dao.ClassificacaoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario defesa</title>
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
                <li class="link"><a href="email.jsp">Email</a></li>
                <li class="link"><a href="#">DefesaForm</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                <h1 class="h1-title"> Defesa</h1>
                
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
                <form id="formCadastro" class="form-Style formCadastro" action="listarDefesa.jsp" method="post" >
                        <label class="label-texto" for="ano">Ano </label>
                        <input type="number" name="ano" required>
                        <label class="label-texto" for="ano">Mes 1 </label>
                        <input type="number" name="mes1" required>
                        <label class="label-texto" for="ano">Mes 2</label>
                        <input type="number" name="mes2" required>
                        <label class="label-texto" for="letra">Letra inicial do socio</label>
                        <input type="text" name="letra" required>
                    
                        <label class="label-texto" for="genero">Escolhe o Genero</label>
                        <select name="genero" required="true">
                            <%
                                for(Genero genero : new GeneroDao().findAll()){
                                   %><option><%=genero.getDescricao()%> </option><%
                                }
                            %>
                            
                        </select>
                        <input type="submit" class="button-enviar" value="Listar">
                    
                </form>
                
            </section>
            
        </section>
    </body>
</html>
