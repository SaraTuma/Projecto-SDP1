<%-- 
    Document   : pessoa
    Created on : 6/jan/2022, 2:03:49
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.MoradaDao"%>
<%@page import="com.ucan.dao.ComunaDao"%>
<%@page import="com.ucan.dao.MunicipioDao"%>
<%@page import="com.ucan.dao.ProvinciaDao"%>
<%@page import="com.ucan.dao.EstadoCivilDao"%>
<%@page import="com.ucan.dao.SexoDao"%>
<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.modelo.Morada"%>
<%@page import="com.ucan.modelo.Comuna"%>
<%@page import="com.ucan.modelo.EstadoCivil"%>
<%@page import="com.ucan.modelo.Municipio"%>
<%@page import="com.ucan.modelo.Provincia"%>
<%@page import="com.ucan.modelo.Sexo"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pessoa</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/pessoa.css" /> 
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
                <li class="link "><a class="active" href="#">Pessoa</a>
                    
                </li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="email.jsp">Email</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
                    <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar uma Pessoa</h1>
                    <form id="formCadastro" class="form-Style formCadastro" action="../CadastrarPessoa" method="POST" >
                    
                        <label class="label-texto" for="pnome">Primeiro nome</label>
                        <input type="text" name="pnome" id="nome" minlength="4" required>
                        <label class="label-texto" for="unome">Ultimo nome</label>
                        <input type="text" name="unome" id="nome" minlength="4" required>
                        
                        <label class="label-texto" for="bi">Numero do BI (Bilhete de Identidade)</label>
                        <input type="text" name="bi" id="bi" minlength="11" required>
                        
                        <label class="label-texto" for="dataNasc">Data de Nascimento</label>
                        <input type="date" name="dataNasc" id="dataNasc"  required="true">
                        
                        <label class="label-texto" for="sexo">Sexo </label>
                        <select name="sexo" required>
                            <%
                                SexoDao dao = new SexoDao();
                                ArrayList<Sexo> array = dao.findAll();

                                for(Sexo s : array){
                                   %><option><%=s.getDescricao()%> </option><%
                                }
                            %>
                            
                        </select>
                        <label class="label-texto" for="estadoCivil">Estado civil </label>
                        <select name="estadoCivil" required="true">
                            <%
                                EstadoCivilDao daoe = new EstadoCivilDao();
                                ArrayList<EstadoCivil> arraye;
                                arraye = daoe.findAll();

                                for(EstadoCivil e : arraye){
                                   %><option><%=e.getDescricao()%> </option><%
                                }
                            %>
                            
                        </select>
                        
                        <label class="label-texto" for="localizacao">Morada </label>
                        <div class="div-localizacao">
                            <select class="div-localizacao-interior" name="provincia">
                                <%
                                ProvinciaDao daop = new ProvinciaDao();
                                ArrayList<Provincia> arrayp;
                                arrayp = daop.findAll();

                                for(Provincia p : arrayp){
                                   %><option><%=p.getDescricao()%> </option><%
                                }
                                %>
                            </select>
                            <select class="div-localizacao-interior" name="municipio">
                                <%
                                MunicipioDao daom = new MunicipioDao();
                                ArrayList<Municipio> arraym;
                                arraym = daom.findAll();

                                for(Municipio m : arraym){
                                   %><option><%=m.getDescricao()%> </option><%
                                }
                                %>
                            </select>
                            <select class="div-localizacao-interior" name="comuna" required>
                                <%
                                ComunaDao daoc = new ComunaDao();
                                ArrayList<Comuna> arrayc;
                                arrayc = daoc.findAll();

                                for(Comuna c : arrayc){
                                   %><option><%=c.getDescricao()%> </option><%
                                }
                                %>
                            </select>
                            <div>
                                <label class="label-texto" for="bairro">Bairro </label>
                                <input type="text" name="bairro" id="nome_completo" minlength="2" required>
                                <br/>
                                <label class="label-texto" for="rua">Rua </label>
                                <input type="text" name="rua" id="nome_completo" required>
                                <br/>
                                <label class="label-texto" for="ncasa">Número da casa </label>
                                <input type="number" name="ncasa" id="nome_completo" required>
                            </div>
                        </div>
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()()">Cancelar</button>
                    
                </form>
            </section>
            
            <section id="seccao-1" class="seccao-esquerda-2">
                <h2 class="h1-title">Todas as Pessoas do Clube</h2>
                <button class="btn btn-editar" onclick="mostrarSeccaoCadastrar()">Cadastrar</button>
                <br>
                 <p class="p-erro">
                         <%
                             String r=request.getParameter("erro") ;
                             String b=r+"ab";
                             if(! b.equals("nullab")){
                                out.println(r);
                             }
                            
                         
                         %>
                </p> 
                <br>
                <table>
                    <thead>
                        
                        <tr>
                            <td class="addBorder"><strong>Nome</strong></td>
                            <td class="addBorder"><strong>Bilhete de Identidade</strong></td>
                            <td class="addBorder"><strong>Data de nascimento</strong></td>
                            <td class="addBorder"><strong>Sexo</strong></td>
                            <td class="addBorder"><strong>Estado civil</strong></td>
                            <td class="addBorder"><strong>Morada</strong></td>
                            <td class="addBorder"><strong>Acção</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                     
                           
                            <%
                                PessoaDao pessoa = new PessoaDao();
                                ArrayList<Pessoa> arraypessoa = new ArrayList<>();
                                arraypessoa = pessoa.findAll();

                                for(Pessoa pe : arraypessoa){
                                    MoradaDao morada = new MoradaDao();
                                    Morada mora = morada.findById(pe.getMorada());
                                   %>
                                <tr>
                                   <td><%=pe.getNomeCompleto()%> </td>
                                   <td><%=pe.getNumbi()%> </td>
                                   <td><%=pe.getDataNasc()%> </td>
                                   <td>
                                       <%
                                           String sexod = new SexoDao().getDescricao(pe.getSexo());
                                           String estadoCivil = new EstadoCivilDao().getDescricao(pe.getEstadoCivil());
                                       %>
                                       <%=sexod%> 
                                   </td>
                                   <td><%=estadoCivil%></td>
                                    <td>
                                       <% String descricao = new ComunaDao().getDescricao(mora.getComuna());%>
                                       <%=descricao%> - <%=mora.getBairro()%> <br>
                                       <%=mora.getRua()%> - <%=mora.getnCasa()%>
                                    </td> 
                                    
                                    <td class="addBorder">
                                
                                    <a class="btn btn-editar" href="./crud/editarPessoa.jsp?id=<%=pe.getId()%>&nome=<%=pe.getNomeCompleto()%>&bi=<%=pe.getNumbi()%>
                                       &data=<%=pe.getDataNasc()%>&sexo=<%=sexod%>
                                       &comuna=<%=descricao%>&bairro=<%=mora.getBairro()%>&rua=<%=mora.getRua()%>&casa=<%=mora.getnCasa()%>&estado=<%=estadoCivil%>">Editar</a>
                                       
                                       
                                    <a class="btn btn-eliminar" href="./crud/eliminarPessoa.jsp?id=<%=pe.getId()%>&nome=<%=pe.getNomeCompleto()%>&bi=<%=pe.getNumbi()%>
                                       &data=<%=pe.getDataNasc()%>&sexo=<%=sexod%>
                                       &comuna=<%=descricao%>&bairro=<%=mora.getBairro()%>&rua=<%=mora.getRua()%>&casa=<%=mora.getnCasa()%>&estado=<%=estadoCivil%>">Eliminar</a>
                                
                                    </td>
                        </tr><%
                                }
                                %>
                                
                    </tbody>
                </table>
            </section>
    
        </section>
    </section>
        
       
    </body>
</html>
