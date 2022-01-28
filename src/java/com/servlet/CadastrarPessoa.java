/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.ucan.utils.TratamentoDeDatas;
import com.ucan.dao.ComunaDao;
import com.ucan.dao.EstadoCivilDao;
import com.ucan.dao.MoradaDao;
import com.ucan.dao.PessoaDao;
import com.ucan.dao.SexoDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ucan.modelo.Morada;
import com.ucan.modelo.Pessoa;

/**
 *
 * @author saratuma
 */
public class CadastrarPessoa extends HttpServlet {

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
            String mensagem=null;
            Pessoa pessoa = new Pessoa();
            PessoaDao pDao = new PessoaDao();
            
            pessoa.setNome(request.getParameter("nome").trim());
            
            pessoa.setDataNasc(TratamentoDeDatas.converterDataNormalParaDataSQL(request.getParameter("dataNasc").trim()));
            
            pessoa.setNumbi(request.getParameter("bi").trim());
            pessoa.setEmail(request.getParameter("email").trim());
            pessoa.setSexo(new SexoDao().getID(request.getParameter("sexo").trim()));
            pessoa.setTelefone(request.getParameter("telefone").trim());
            pessoa.setEstadoCivil(new EstadoCivilDao().getID(request.getParameter("estadoCivil")));
           //Criando uma instancia para a morada
            Morada morada = new Morada(
                    request.getParameter("bairro").trim(),
                    request.getParameter("rua").trim(),
                    Integer.parseInt(request.getParameter("ncasa").trim()),
                    new ComunaDao().getID(request.getParameter("comuna").trim())
                );
            if(new MoradaDao().insert(morada)){
                pessoa.setMorada(new MoradaDao().findOne(morada));
                if(pDao.insert(pessoa))
                {
                    mensagem = "Cadastrado com sucesso!!";
                    response.sendRedirect("Paginas/pessoa.jsp?erro="+mensagem);
                }
                else
                {
                    mensagem = "Erro ao Adicionar a pessoa na base de dados!!!";
                    response.sendRedirect("Paginas/pessoa.jsp?erro="+mensagem);
                }
            }
            else{
                mensagem = "Erro ao Adicionar a Morada da pessoa!!!";
                response.sendRedirect("Paginas/pessoa.jsp?erro="+mensagem);

            }

        }
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

}
