/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.ucan.dao.PessoaDao;
import com.ucan.dao.TelefoneDao;
import com.ucan.modelo.Pessoa;
import com.ucan.modelo.Telefone;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saratuma
 */
public class EditarTelefone extends HttpServlet {

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
            if(verificarCampos(request)){
                Telefone telefone = new Telefone();
                telefone.setDescricao(request.getParameter("telefone").trim());
                String[] nome = request.getParameter("pessoa").trim().split(" ");
                Integer telefoneId = Integer.parseInt(request.getParameter("id").trim());
                Integer pId = new PessoaDao().getId(nome[0], nome[1]);
                            
               if(pId>0){
                    telefone.setPessoa(pId);
                    telefone.setId(telefoneId);
                    if(new TelefoneDao().update(telefone)){
                        mensagem = "Telefone de "+nome[0]+" "+ nome[1]+", editado com sucesso!!";
                    }
                    else
                        mensagem = "Erro: ao editar um Telefone!!";
                }
                else
                    mensagem = "Erro: Código de pessoa invalida!!!";
            }
            else
                mensagem = "Erro: campos inválidos!!";
            response.sendRedirect("Paginas/telefone.jsp?erro="+mensagem);
        }
    }
    
    public boolean verificarCampos(HttpServletRequest request){
        if(request.getParameter("telefone").trim() != null && request.getParameter("pessoa").trim()!=null && request.getParameter("id").trim()!=null)
            return true;
        return false;
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
