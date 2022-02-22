<%-- 
    Document   : eliminarEmail
    Created on : 9/fev/2022, 20:24:53
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Email</title>
        <link rel="stylesheet" href="../../Css/comum.css">
        <link rel="stylesheet" href="../../Css/actor-realizador.css">
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
            .bg-red{
                color: red;
            }
        </style>
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
                <li class="link"><a href="../telefone.jsp">Telefone</a></li>
                <li class="link"><a href="../email.jsp">Email</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Eliminar : <%=request.getParameter("email") %></h1>
                <form id="formEditar" class="form-Style formEditar" action="../../EliminarEmail?id=<%=request.getParameter("id")%>" method="post" >
                 
                        <label class="label-texto" for="pessoa">Nome da Pessoa</label>
                        <input type="text" name="pessoa" disabled="disabled" value="<%=request.getParameter("pessoa")%>">
                        
                        <label class="label-texto" for="email">Email</label>
                        <input type="text" name="email" disabled="disabled" value="<%=request.getParameter("email")%>">
                        
                        <input type="submit" class="btn" value="Eliminar">
                        <a class="btn btn-eliminar" href="../email.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
