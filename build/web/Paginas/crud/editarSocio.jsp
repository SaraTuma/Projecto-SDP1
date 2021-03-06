<%-- 
    Document   : editarSocio
    Created on : 19/jan/2022, 11:10:23
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Sócio</title>
        <link rel="stylesheet" href="../../Css/comum.css">
        <link rel="stylesheet" href="../../Css/actor-realizador.css">
    </head>
    <body>

    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link "><a class="active" href="../pessoa.jsp">Pessoa</a>
                    
                </li>
                <li class="link"><a href="../actor.jsp">Actor</a></li>
                <li class="link"> <a href="../realizador.jsp">Realizador</a></li>
                <li class="link"><a href="../socio.jsp">Socio</a></li>
                <li class="link"><a href="../filme.jsp">Filme</a></li>
                <li class="link"><a href="../filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="../alugar.jsp">Alugar</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar dados de um Sócio</h1>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarSocio?id=<%=request.getParameter("id")%>" method="post" >
                    
                        <label class="label-texto" for="nome">Nome do Socio</label>
                        <input type="text" name="nome" value="<%=request.getParameter("nome") %>">
                        <label class="label-texto" for="actor">Categoria o Socio</label>
                        <input type="text" name="categoria"  value="<%=request.getParameter("categoria") %>">                    
                        <input type="submit" class="button-enviar" value="Editar">
                        <a class=" btn btn-eliminar" href="../socio.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
