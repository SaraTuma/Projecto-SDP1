<%-- 
    Document   : editarFilmeActor
    Created on : 15/fev/2022, 13:07:27
    Author     : saratuma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Filme Actor</title>
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
                <li class="link "><a class="active" href="../pessoa.jsp">Pessoa</a></li>
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
                <h1 class="h1-title">Editar um Filme-Actor</h1>
                <%
                Integer pId = Integer.parseInt(request.getParameter("id").trim());
                %>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarTelefone?id=<%=pId%>" method="post" >
                    
                        <label class="label-texto" for="pessoa">Nome da Pessoa</label>
                        
                        <select name="pessoa">
                            <%
                                
                            for(Pessoa pessoa : new PessoaDao().findAll()){
                                if(pessoa.getId() == pId){
                                    %><option selected="true"><%=pessoa.getNomeCompleto()%></option>
                              <%
                                  }
                                else{
                                    %><option ><%=pessoa.getNomeCompleto()%></option>
                              <%
                                }
                                                                
                            }
                            %>
                            
                        </select>
                       
                        <label class="label-texto" for="telefone">Telefone</label>
                        <input type="tel" name="telefone"  value="<%=request.getParameter("telefone") %>" required="true">                    
                        <input type="submit" class="button-enviar" value="Editar">
                        <a class=" btn  btn-eliminar" href="../filme-actor.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
