<%-- 
    Document   : alugar
    Created on : 6/jan/2022, 2:53:19
    Author     : saratuma
--%>

<%@page import="com.ucan.dao.PessoaDao"%>
<%@page import="com.ucan.modelo.Socio"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ucan.dao.FilmeDao"%>
<%@page import="com.ucan.dao.SocioDao"%>
<%@page import="com.ucan.dao.AlugarDao"%>
<%@page import="com.ucan.modelo.Alugar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alugar</title>
        <link rel="stylesheet" href="../Css/comum.css" /> 
        <link rel="stylesheet" href="../Css/pessoa.css" /> 
        <script src="../Javascript/comum.js"></script>
    </head>
    <body>
       
    <section class="principal">
        <section class="seccao-esquerda">
            <div class="title"><strong>Administração</strong></div>
            <ul class="lista-esquerda">
                <li class="link"><a href="pessoa.jsp">Pessoa</a></li>
                <li class="link"><a href="actor.jsp">Actor</a></li>
                <li class="link"> <a href="realizador.jsp">Realizador</a></li>
                <li class="link"><a href="socio.jsp">Socio</a></li>
                <li class="link"><a href="filme.jsp">Filme</a></li>
                <li class="link"><a  href="filme-actor.jsp">Actores e Filmes</a></li>
                <li class="link"><a class="active" href="#">Alugados</a></li>
                <li class="link"><a href="telefone.jsp">Telefone</a></li>
                <li class="link"><a href="email.jsp">Email</a></li>
                <li class="link"><a href="formDefesa.jsp">Defesa</a></li>
            </ul>
        </section>
        <section class="seccao-direita">
            <section class="seccao-direita-1">
           
           
        </section>

        <section class="seccao-direita">
           
            <section id="seccao-1" class="seccao-esquerda-2">
                
                <h1 class="h1-title">Todos os Alugados do Clube</h1>
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
                <table>
                    <thead>
                        <tr>
                            <td class="addBorder"><strong>Titulos do filme</strong></td>
                            <td class="addBorder"><strong>Nome do Socio</strong></td>
                            <td class="addBorder"><strong>Data que alugou</strong></td>
                            <td class="addBorder"><strong>Data de devolucao</strong></td>
                            <td class="addBorder"><strong>Data de cadastro</strong></td>
                            <td class="addBorder"><strong>Operação</strong></td>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>teste</td>
                        </tr>
                        <%
                            String nomeSocio=null;
                            Integer idPessoa=null;
                            String titulosFilme =null;
                            for(Alugar aluguer : new AlugarDao().findAll()){
                                idPessoa = new SocioDao().getPessoaId(aluguer.getSocio());
                                nomeSocio = new SocioDao().getPessoaNome(idPessoa);
                                titulosFilme = new FilmeDao().findByTitles(aluguer.getFilme());
                                %>
                            <tr>
                                    <td class="addBorder"><%=titulosFilme%></td>
                                    <td class="addBorder"><%=nomeSocio%></td>
                                    <td class="addBorder"><%=aluguer.getDataAlugar()%></td>
                                    <td class="addBorder"><%=aluguer.getDataDevolucao()%></td>
                                    <td class="addBorder"><%=aluguer.getDataCadastro()%></td>
                            </tr>
                            <%}
                            %>
                        
                        
                    </tbody>
                </table>
            </section>
            <section id="seccao-2" class="seccao-cadastro">
                <h1 class="h1-title"> Alugar um filme </h1>
                <form id="formCadastro" class="form-Style formCadastro" action="" method="post" >
                    
                        <label class="label-texto" for="actor">Nome do socio</label>
                        <select name="nomeSocio">
                            <%
                            ArrayList<Socio> socios = new SocioDao().findAll();
                            String nome, categoria;
                            for(Socio socio : socios) {
                                nome = new PessoaDao().findId(socio.getPessoa()).getNomeCompleto();
                                //categoria = new CategoriaSocioDao().getDescricao(socio.getCategoria());
                              %>
                            <option><%=nome%></option>
                            <%}%>
                        </select>                     
                        <input type="submit" class="button-enviar" value="Cadastrar">
                    
                </form>
            </section>
            
        </section>
    </body>
</html>
