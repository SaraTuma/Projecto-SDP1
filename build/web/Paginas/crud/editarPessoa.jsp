<%-- 
    Document   : editarPessoa
    Created on : 14/jan/2022, 9:44:04
    Author     : saratuma
--%>

<%@page import="com.ucan.modelo.EstadoCivil"%>
<%@page import="com.ucan.dao.EstadoCivilDao"%>
<%@page import="com.ucan.dao.SexoDao"%>
<%@page import="com.ucan.modelo.Sexo"%>
<%@page import="com.ucan.modelo.Provincia"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ucan.dao.ProvinciaDao"%>
<%@page import="com.ucan.dao.MunicipioDao"%>
<%@page import="com.ucan.modelo.Municipio"%>
<%@page import="com.ucan.modelo.Comuna"%>
<%@page import="com.ucan.dao.ComunaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Pessoa</title>
        <link rel="stylesheet" href="../../Css/comum.css">
        <link rel="stylesheet" href="../../Css/editar.css">
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
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar dados de uma Pessoa</h1>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarPessoa?id=<%=request.getParameter("id")%>" method="POST" >
                    
                    <label class="label-texto" for="pessoa">Escolhe a Pessoa</label>
                        
                        <label class="label-texto" for="pnome">Primeiro Nome</label>
                        <input type="text" name="pnome" id="nome_completo" value="<%=request.getParameter("pnome") %>">
                        <br>
                        <label class="label-texto" for="unome">Ultimo Nome</label>
                        <input type="text" name="unome" id="nome_completo" value="<%=request.getParameter("unome") %>">
                        <br>
                        
                        <label class="label-texto" for="bi">Numero do BI (Bilhete de Identidade)</label>
                        <input type="text" name="bi" id="bi" value="<%=request.getParameter("bi") %>">
                        <br>
                        <label class="label-texto" for="dataNasc">Data de Nascimento</label>
                        <input type="date" name="dataNasc" id="dataNasc" value="<%=request.getParameter("data") %>">
                        <br>
                         <label class="label-texto" for="telefone">Telefone : </label>
                        <input type="tel" name="telefone" value="<%=request.getParameter("telefone")%>">
                        
                        <br>
                        <label class="label-texto" for="email">E-mail : </label>
                        <input type="email" name="email"value=<%=request.getParameter("email")%>>
                        <br>
                        <label class="label-texto" for="sexo">Sexo : </label>
                        <select name="sexo" >
                            <option selected="true" ><%=request.getParameter("sexo")%></option>
                            <%
                                   
                                ArrayList<Sexo> arraySexo = new ArrayList<>();
                                arraySexo = new SexoDao().findAll();

                                for(Sexo sexo : arraySexo){
                                    if(! sexo.getDescricao().equals(request.getParameter("sexo"))){
                                    %>
                                        <option ><%=sexo.getDescricao()%></option>
                                    <%
                                    }
                                }
                                %>
                        </select>
                        <br>
                        <label class="label-texto" for="estadoCivil">Estado civil</label>
                        <select name="estadoCivil">
                            <option selected="true" ><%=request.getParameter("estado")%></option>
                            <%
                                EstadoCivilDao daoe = new EstadoCivilDao();
                                ArrayList<EstadoCivil> arraye;
                                arraye = daoe.findAll();

                                for(EstadoCivil estado : arraye){
                                   if(! estado.getDescricao().equals(request.getParameter("estado"))){
                                    %><option><%=estado.getDescricao()%> </option><%
                                   }
                                }
                            %>
                            
                        </select>
                        <br>
                        <div class="div-localizacao">
                            <% 
                                String comuna = request.getParameter("comuna");
                                Comuna nova = new ComunaDao().findOne(comuna);
                                Integer idMuni = nova.getMunicipio();
                                Municipio municipio = new MunicipioDao().findMunicipio(idMuni);
                                String provincia = new ProvinciaDao().getDescricao(municipio.getProvincia());
                                    
                            %>
                            <label class="label-texto" for="provincia">Provincia: </label>

                            <select class="div-localizacao-interior" name="provincia">
                                <option selected="true" ><%=provincia%></option>
                                <%
                                   
                                ArrayList<Provincia> arrayProvincia = new ArrayList<>();
                                arrayProvincia = new ProvinciaDao().findAll();

                                for(Provincia provincia2 : arrayProvincia){
                                    if(! provincia.equals(provincia2.getDescricao())){
                                    %>
                                    <option ><%=provincia2.getDescricao()%></option>
                                    <%
                                    }
                                }
                                %>
                            </select>
                            <label class="label-texto" for="municipio">Municipio : </label>
                            <select class="div-localizacao-interior" name="municipio">
                                <option selected="true" ><%=municipio.getDescricao()%></option>
                                <%
                                   
                                ArrayList<Municipio> arrayMunicipio = new ArrayList<>();
                                arrayMunicipio = new MunicipioDao().findAll();

                                for(Municipio municipio2 : arrayMunicipio){
                                    if(! municipio.getDescricao().equals(municipio2.getDescricao())){
                                    %>
                                    <option ><%=municipio2.getDescricao()%></option>
                                    <%
                                    }
                                }
                                %>
                            </select>
                            <label class="label-texto" for="comuna">Comuna <span class="bg-red"> *</span> : </label>
                            <select class="div-localizacao-interior" name="comuna" required="true">
                                <option selected="true" ><%=comuna%></option>
                                <%
                                   
                                ArrayList<Comuna> arrayComuna = new ArrayList<>();
                                arrayComuna = new ComunaDao().findAll();

                                for(Comuna comuna2 : arrayComuna){
                                    if(! comuna.equals(comuna2.getDescricao())){
                                    %>
                                    <option ><%=comuna2.getDescricao()%></option>
                                    <%
                                    }
                                }
                                %>
                            </select>
                        </div>
                            <label class="label-texto" for="">Morada  </label> <br>
                        <label class="label-texto" for="bairro">Bairro: </label>
                        <input type="text" name="bairro"  value="<%=request.getParameter("bairro") %>">
                        <br>
                        <label class="label-texto" for="rua">Rua : </label>
                        <input type="text" name="rua"  value="<%=request.getParameter("rua") %>">
                        <br>
                        <label class="label-texto" for="casa">Número da Casa: </label>
                        <input type="number" name="ncasa"  value="<%=request.getParameter("casa") %>">
                        <br>
                        <p class="bg-red">Campos obrigatórios *</p>
                        <input type="submit" class="btn button-enviar" value="Editar">
                        <a class="button-enviar btn btn-eliminar" href="../pessoa.jsp">Cancelar</a>
                    
                </form>
            </section>
        </section>
    </section>
    </body>
</html>
