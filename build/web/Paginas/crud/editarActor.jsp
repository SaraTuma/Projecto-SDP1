<%-- 
    Document   : editarActor
    Created on : 17/jan/2022, 3:15:38
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Actor</title>
        <link rel="stylesheet" href="../../Css/comum.css">
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
            .seccao-editar{
                background-color: white;
                height: 25vh;
                width: 30vw;
                padding: 1rem;
                box-shadow: 2px 3px 6px 1px rgba(0, 0, 0, 0.377);
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
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar dados de um Actor</h1>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarActor" method="post" >
                    
                        <label class="label-texto" for="nome">Nome do Actor</label>
                        <input type="text" name="nome" disabled="disabled" value="<%=request.getParameter("nome") %>"> 
                        <br>
                        <label class="label-texto" for="dataCadastro">Data de Cadastro</label>
                        <input type="date" name="dataCadastro" value="<%=request.getParameter("data") %>">
                        <br>
                        <input type="submit" class="btn button-enviar" value="Editar">
                        <a class="button-enviar btn btn-eliminar" href="../actor.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
        

</html>
