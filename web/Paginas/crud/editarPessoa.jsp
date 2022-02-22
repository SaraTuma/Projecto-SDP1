<%-- 
    Document   : editarPessoa
    Created on : 14/jan/2022, 9:44:04
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.MoradaDao"%>
<%@page import="com.ucan.modelo.Morada"%>
<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.dao.PessoaDao"%>
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
                <li class="link"><a href="../telefone.jsp">Telefone</a></li>
                <li class="link"><a href="../email.jsp">Email</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
        <section id="seccao-3" class="seccao-editar">
                <h1 class="h1-title">Editar dados de uma Pessoa</h1>
                <% Integer pessoaId = Integer.parseInt(request.getParameter("id").trim());%>
                <form id="formEditar" class="form-Style formEditar" action="../../EditarPessoa?id=<%=pessoaId%>" method="POST" >
                    
                    <%
                    Pessoa pessoa = new PessoaDao().findId(pessoaId);
                    %>
                    
                        
                        <label class="label-texto" for="pnome">Primeiro Nome</label>
                        <input type="text" name="pnome" id="nome_completo" value="<%=pessoa.getPrimeiroNome() %>">
                        <br>
                        <label class="label-texto" for="unome">Ultimo Nome</label>
                        <input type="text" name="unome" id="nome_completo" value="<%=pessoa.getUltimoNome() %>">
                        <br>
                        
                        <label class="label-texto" for="bi">Numero do BI (Bilhete de Identidade)</label>
                        <input type="text" name="bi" id="bi" value="<%=pessoa.getNumbi() %>">
                        <br>
                        <label class="label-texto" for="dataNasc">Data de Nascimento</label>
                        <input type="date" name="dataNasc" id="dataNasc" value="<%=pessoa.getDataNasc() %>">
                        
                        <br>
                        <label class="label-texto" for="sexo">Sexo : </label>
                        <select name="sexo" >
                            <%String sexoPessoa = new SexoDao().getDescricao(pessoa.getSexo());%>
                            <option selected="true" ><%=sexoPessoa%></option>
                            <%
                                for(Sexo sexo : new SexoDao().findAll()){
                                    if(! sexo.getDescricao().equals(sexoPessoa)){
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
                            <%String estadoCivilPessoa = new EstadoCivilDao().getDescricao(pessoa.getEstadoCivil());%>
                            <option selected="true" ><%=estadoCivilPessoa%></option>
                            <%
                                for(EstadoCivil estado : new EstadoCivilDao().findAll()){
                                   if(! estado.getDescricao().equals(estadoCivilPessoa)){
                                    %><option><%=estado.getDescricao()%> </option><%
                                   }
                                }
                            %>
                            
                        </select>
                        <br>
                        <%Morada moradaPessoa = new MoradaDao().findById(pessoa.getMorada());%>
                        <div class="div-localizacao">
                            <% 
                                Comuna nova = new ComunaDao().findOne(moradaPessoa.getComuna());
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
                                <%String comuna = new ComunaDao().getDescricao(moradaPessoa.getComuna());%>
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
                        <input type="text" name="bairro"  value="<%=moradaPessoa.getBairro()%>">
                        <br>
                        <label class="label-texto" for="rua">Rua : </label>
                        <input type="text" name="rua"  value="<%=moradaPessoa.getRua() %>">
                        <br>
                        <label class="label-texto" for="casa">Número da Casa: </label>
                        <input type="number" name="ncasa"  value="<%=moradaPessoa.getnCasa()%>">
                         <br>
                        <label class="label-texto" for="dataCadastro">Data de Cadastro</label>
                        <input type="date" name="dataCadastro" value="<%=pessoa.getDatacadastro()%>">
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
