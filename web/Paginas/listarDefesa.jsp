<%-- 
    Document   : ListarDefesa
    Created on : 15/fev/2022, 14:59:43
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.GeneroDao"%>
<%@page import="com.ucan.dao.CategoriaSocioDao"%>
<%@page import="com.ucan.dao.DefesaDao"%>
<%@page import="com.ucan.modelo.Defesa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Defesa</title>
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
                <li class="link"><a href="formDefesa.jsp">Defesa</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                <h1 class="h1-title">Resultados da Busca</h1>
                <br>

                <table>
                    <%  Integer ano = Integer.parseInt(request.getParameter("ano").trim());
                        Integer mes1 = Integer.parseInt(request.getParameter("mes1").trim());
                        Integer mes2 = Integer.parseInt(request.getParameter("mes2").trim());
                        String genero = request.getParameter("genero").trim();
                        String letra = request.getParameter("letra").trim();
                        
                    %>
                    <thead>
                        <tr>
                            <td class="addBorder"><strong>Primeiro Nome do socio</strong></td>
                            <td class="addBorder"><strong>Ultimo Nome do socio</strong></td>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                
                              Integer idGenero = new GeneroDao().getId(genero);  
                            for(Defesa defesa : new DefesaDao().listarDefesa(ano, mes1, mes2, idGenero, letra)){
                                %>
                                
                                <td><%=defesa.getPrimeiroNome()%></td>
                                <td><%=defesa.getUltimoNome()%></td>
                                <%
                            }
                            %>
                            
                        </tr>
                                   
                    </tbody>
                </table>
            </section>
            
        </section>
    </body>
</html>
