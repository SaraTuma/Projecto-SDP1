<%-- 
    Document   : socio
    Created on : 6/jan/2022, 3:04:27
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.modelo.Pessoa"%>
<%@page import="com.ucan.dao.CategoriaSocioDao"%>
<%@page import="com.ucan.modelo.CategoriaSocio"%>
<%@page import="com.ucan.dao.SocioDao"%>
<%@page import="com.ucan.modelo.Socio"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Socio</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/pessoa.css" />
        <link rel="stylesheet" href="../Css/actor-realizador.css" /> 
        <script src="../Javascript/comum.js"></script>
    </head>
    <body>
          <header>header

        
    </header>
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link"><a href="pessoa.jsp">Pessoa</a></li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"> <a  class="active" href="#">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a href="filme-actor.jsp">Actores de Filmes</a></li>
                <li class="link"><a href="alugar.jsp">Alugar</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section id="seccao-1" class="seccao-esquerda-2">
                <h1 class="h1-title">Todos os Sócios do Clube</h1>
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
                            <td class="addBorder"><strong>Nome do Sócio</strong></td>
                            <td class="addBorder"><strong>Categoria</strong></td>
                            <td class="addBorder"><strong>Data de cadastro</strong></td>
                            <td class="addBorder"><strong>Acção</strong></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            ArrayList<Socio> socios = new SocioDao().findAll();
                            for(Socio socio : socios) {
                              %>
                        <tr>
                            <td class="addBorder"><%=socio.getPessoa()%></td>
                            <td class="addBorder"><%=socio.getCategoria()%></td>
                            <td class="addBorder"><%=socio.getDataCadastro()%></td>
                            <td class="addBorder">
                                
                                <a class="btn btn-editar" href="./crud/editarSocio.jsp">Editar</a>
                                <a class="btn btn-eliminar" href="./crud/eliminarSocio.jsp">Eliminar</a>
                                
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title">Cadastrar um Socio</h1>
                <form id="formCadastro" class="form-Style formCadastro" action="../CadastrarSocio" method="POST" >
                    
                        <label class="label-texto" for="pessoa">Socio</label>
                        <select name="pessoa" required="true">
                            <%
                                ArrayList<Pessoa> pessoas = new PessoaDao().findAllNames();
                                for(Pessoa pessoa : pessoas) {
                            %>
                            <option ><%=pessoa.getNome()%></option>
                            <%}%>
                        </select>  
                        <label class="label-texto" for="categoria">Escolhe aaaaa Categoria</label>
                        <select name="categoria" required="true">
                            <%
                                ArrayList<CategoriaSocio> categorias = new CategoriaSocioDao().findAll();
                                for(CategoriaSocio categoria : categorias) {
                            %>
                            <option><%=categoria.getDescricao()%></option>
                            <%}%>
                        </select>                    
                        <input type="submit" class="button-enviar" value="Cadastrar">
                        <button class="btn btn-eliminar" onclick="mostrarSeccaoVisualizar()">Cancelaaaaar</button>
                </form>
            </section>
            
            <section id="seccao-4" class="seccao-eliminar">
                <h1 class="h1-title">Eliminar um Socio</h1>
                <form id="formEditar" class="form-Style form-eliminar" action="" method="post" >
                    <label class="label-texto" for="pessoa">Escolhe o Socio</label>
                    <select name="actor">
                        <option value="">Sara Tuma</option>
                        <option value="">Isaura Manico</option>
                        <option value="">Marilda Sungu</option>
                        <option value="">Creuma Kuzola</option>
                    </select>
                    <input type="submit" class="button-enviar" value="Eliminar">
                </form>
            </section>
    </section>
   
    </body>
</html>
