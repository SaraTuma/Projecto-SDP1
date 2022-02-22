/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.ucan.dao.ClassificacaoDao;
import com.ucan.dao.FilmeDao;
import com.ucan.dao.GeneroDao;
import com.ucan.dao.PessoaDao;
import com.ucan.dao.RealizadorDao;
import com.ucan.modelo.Filme;
import com.ucan.utils.TratamentoDeDatas;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saratuma
 */
public class CadastrarFilme extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String mensagem = null;
            if(verificarCampos(request)){
                Filme filme = new Filme();
                FilmeDao filmeDao = new FilmeDao();
                filme.setTituloOrig(request.getParameter("tOriginal").trim());
                filme.setTituloPort(request.getParameter("tPortugues").trim());
                filme.setSinopse(request.getParameter("sinopse").trim());
                filme.setDuracao(TratamentoDeDatas.converterTempoParaTimeSQL(request.getParameter("duracao").trim()));
                filme.setAnoPublicado(Integer.parseInt(request.getParameter("anoPublicado").trim()));
                String[] nome = request.getParameter("nomeRealizador").trim().split(" ");
                Integer idPessoa = new PessoaDao().getId(nome[0], nome[1]);
                Integer idRealizador = new RealizadorDao().getRealizadorIdByPessoa(idPessoa);
                Integer idClassificacao = new ClassificacaoDao().getId(request.getParameter("classificacao").trim());
                Integer idGenero = new GeneroDao().getId(request.getParameter("genero").trim());
                if(idRealizador>0 && idClassificacao>0 && idGenero>0){
                    filme.setRealizador(idRealizador);
                    filme.setClassificacao(idClassificacao);
                    filme.setGenero(idGenero);
                    if(filmeDao.insert(filme)){
                        mensagem="Cadastrado com sucesso!!";
                    }else
                        mensagem="ERRO: ao cadastrar o filme!!";
                }
                else{
                    mensagem = "Erro: Id's invalidos para :"+request.getParameter("nomeRealizador").trim()+" !!";
                }
                
            }
            else{
                mensagem = "Erro: campos inválidos!!!";
            }
            
            response.sendRedirect("Paginas/filme.jsp?erro="+mensagem);
            
        }
    }
    
      public boolean verificarCampos(HttpServletRequest request){
        if(request.getParameter("tOriginal").trim() != null && 
                request.getParameter("tPortugues").trim() != null && 
                request.getParameter("sinopse").trim()!= null &&
                request.getParameter("duracao").trim()!= null &&
                request.getParameter("anoPublicado").trim()!= null &&
                request.getParameter("nomeRealizador").trim()!= null &&
                request.getParameter("classificacao").trim()!= null &&
                request.getParameter("genero").trim()!= null){
            return true;
        }
            
        return false;
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private Filme Filme() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
