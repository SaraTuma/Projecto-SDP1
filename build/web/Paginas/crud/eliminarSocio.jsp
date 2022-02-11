<%-- 
    Document   : eliminarSocio
    Created on : 19/jan/2022, 11:24:30
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Socio</title>
        <link rel="stylesheet" href="../../Css/comum.css" /> 
        <link rel="stylesheet" href="../../Css/pessoa.css" />
        <link rel="stylesheet" href="../../Css/actor-realizador.css" /> 
        <script src="../../Javascript/comum.js"></script>
    </head>
    <body>
      
        <section class="principal">
            <section class="seccao-esquerda">
                <div class="title"><strong>Administração</strong></div>
                <ul class="lista-esquerda">
                    <li class="link"><a href="../pessoa.jsp">Pessoa</a></li>
                    <li class="link"><a href="../actor.jsp">Actor</a></li>
                    <li class="link"> <a href="../realizador.jsp">Realizador</a></li>
                    <li class="link"> <a  class="active" href="../socio.jsp">Socio</a></li>
                    <li class="link"><a href="../filme.jsp">Filme</a></li>
                    <li class="link"><a href="../filme-actor.jsp">Actores de Filmes</a></li>
                    <li class="link"><a href="../alugar.jsp">Alugar</a></li>
                </ul>
            </section>
            <section class="seccao-direita">
                <section id="seccao-4" class="seccao-eliminar">
                    <h1 class="h1-title">Eliminar um Socio</h1>
                    <form id="formEditar" class="form-Style form-eliminar" action="../../EliminarSocio?id=<%=request.getParameter("id")%>" method="post" >
                        <label class="label-texto" for="nome">Nome do Socio</label>
                        <input type="text" name="nome" disabled="disabled" value="<%=request.getParameter("nome") %>">
                        <label class="label-texto" for="categoria">Categoria do Socio</label>
                        <input type="text" name="categoria" disabled="disabled" value="<%=request.getParameter("categoria") %>">
                        <input type="submit" class="button-enviar" value="Eliminar">
                    </form>
                </section>
            </section>
        </section>
    </body>
</html>
