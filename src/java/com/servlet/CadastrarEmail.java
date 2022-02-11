/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.ucan.dao.EmailDao;
import com.ucan.dao.PessoaDao;
import com.ucan.modelo.Email;
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
public class CadastrarEmail extends HttpServlet {

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
                Email email = new Email();
                email.setDescricao(request.getParameter("email").trim());
                String[] nome = request.getParameter("pessoa").trim().split(" ");
                Integer pId = new PessoaDao().getId(nome[0], nome[1]);
                if(pId>0){
                    email.setPessoa(pId);
                    if(new EmailDao().insert(email)){
                        mensagem = "Email de "+nome[0]+" "+ nome[1]+", cadastrado com sucesso!!";
                    }
                    else
                        mensagem = "Erro: ao cadastrar Email!!";
                }
                else
                    mensagem = "Erro: Código de pessoa invalida!!!";
            }
            else
                mensagem = "Erro: campos inválidos!!";
            response.sendRedirect("Paginas/email.jsp?erro="+mensagem);
            
            
        }
    }

    public boolean verificarCampos(HttpServletRequest request){
        if(request.getParameter("email").trim() != null && request.getParameter("pessoa").trim()!=null)
            return true;
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

}
