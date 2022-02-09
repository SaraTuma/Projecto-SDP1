<%-- 
    Document   : eliminarPessoa
    Created on : 16/jan/2022, 15:20:53
    Author     : saratuma
--%>

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
        
<header>header

        
    </header>
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link "><a class="active" href="#">Pessoa</a>
                    
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
                <h1 class="h1-title">Eliminar : <%=request.getParameter("nome") %></h1>
                <form id="formEditar" class="form-Style formEditar" action="../../EliminarPessoa?id=<%=request.getParameter("id")%>" method="post" >
                 
                        <label class="label-texto" for="pnome">Primeiro nome</label>
                        <input type="text" name="pnome" disabled="disabled" value="<%=request.getParameter("nome") %>">
                        <br>
                        <label class="label-texto" for="unome">Ultimo nome</label>
                        <input type="text" name="unome" disabled="disabled" value="<%=request.getParameter("nome") %>">
                        <br>
                        <label class="label-texto" for="bi">Numero do BI (Bilhete de Identidade) : </label>
                        <input type="text" name="bi" disabled="disabled" value="<%=request.getParameter("bi") %>">
                        <br>
                        <label class="label-texto" for="dataNasc">Data de Nascimento : </label>
                        <input type="date" name="dataNasc" disabled="disabled" value="<%=request.getParameter("data") %>">
                        <br>
                        <label class="label-texto" for="telefone">Telefone : </label>
                        <input type="tel" name="telefone" disabled="disabled" value="<%=request.getParameter("telefone")%>">
                        
                        <br>
                        <label class="label-texto" for="email">E-mail : </label>
                        <input type="email" name="email" disabled="disabled" value=<%=request.getParameter("email")%>>
                        <br>
                        <label class="label-texto" for="sexo">Sexo : </label>
                        <select name="sexo" >
                            <option selected="true" disabled="disabled"><%=request.getParameter("sexo")%></option>
                        </select>
                        <br>
                        <label class="label-texto" for="estadoCivil">Estado Civil : </label>
                        <select name="estadoCivil" >
                            <option selected="true" disabled="disabled"><%=request.getParameter("estado")%></option>
                        </select>
                        <br>
                        <label class="label-texto" for="localizacao">Localização </label>
                        <div class="div-localizacao">
                            <% 
                                String comuna = request.getParameter("comuna");
                                Comuna nova = new ComunaDao().findOne(comuna);
                                Integer idMuni = nova.getMunicipio();
                                Municipio municipio = new MunicipioDao().findMunicipio(idMuni);
                                String provincia = new ProvinciaDao().getDescricao(municipio.getProvincia());
                            %>
                            <select class="div-localizacao-interior" name="provincia">
                                <option selected="true" disabled="disabled"><%=provincia%></option>
                            </select>
                            <select class="div-localizacao-interior" name="municipio">
                                <option selected="true" disabled="disabled"><%=municipio.getDescricao()%></option>
                            </select>
                            <select class="div-localizacao-interior" name="Comuna">
                                <option selected="true" disabled="disabled"><%=comuna%></option>
                            </select>
                        </div>
                            <label class="label-texto" for="">Morada  </label> <br>
                        <label class="label-texto" for="bairro">Bairro: </label>
                        <input type="text" name="bairro" disabled="disabled" value="<%=request.getParameter("bairro") %>">
                        <br>
                        <label class="label-texto" for="rua">Rua : </label>
                        <input type="text" name="rua" disabled="disabled" value="<%=request.getParameter("rua") %>">
                        <br>
                        <label class="label-texto" for="casa">Número da Casa: </label>
                        <input type="number" name="ncasa" disabled="disabled" value="<%=request.getParameter("casa") %>">
                        <br>
                        <p class="p-erro"></p>
                        <input type="submit" class="btn" value="Eliminar">
                        <a class="btn btn-eliminar" href="../pessoa.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
