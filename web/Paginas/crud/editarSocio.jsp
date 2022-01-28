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
        
<header>header

        
    </header>
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
                <form id="formEditar" class="form-Style formEditar" action="" method="post" >
                    
                        <label class="label-texto" for="actor">Escolhe o Socio</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <label class="label-texto" for="actor">Categoria o Socio</label>
                        <select name="actor">
                            <option value="">Sara Tuma</option>
                            <option value="">Isaura Manico</option>
                            <option value="">Marilda Sungu</option>
                            <option value="">Creuma Kuzola</option>
                        </select>
                        <label class="label-texto" for="data_cadastro">Data de Cadastro</label>
                        <input type="date" name="data_cadastro" id="data_cadastro">                      
                        <input type="submit" class="button-enviar" value="Editar">
                        <a class="button-enviar btn btn-eliminar" href="../socio.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
