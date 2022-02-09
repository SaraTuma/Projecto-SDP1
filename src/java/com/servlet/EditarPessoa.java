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
public class EditarPessoa extends HttpServlet {

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
            if(! verificarCampos(request)){
                mensagem="Erro: Exitem campos invalidos!!";
            }
            else{
                Integer pId = Integer.parseInt(request.getParameter("id"));
                Pessoa pessoa = new Pessoa();
                PessoaDao pDao = new PessoaDao();
                Pessoa pessoaAlterar = pDao.findId(pId);

                pessoa.setPrimeiroNome(request.getParameter("pnome").trim());
                pessoa.setUltimoNome(request.getParameter("unome").trim());
                pessoa.setDataNasc(TratamentoDeDatas.converterDataNormalParaDataSQL(request.getParameter("dataNasc").trim()));
                pessoa.setNumbi(request.getParameter("bi").trim());
                pessoa.setSexo(new SexoDao().getID(request.getParameter("sexo").trim()));
                pessoa.setEstadoCivil(new EstadoCivilDao().getID(request.getParameter("estadoCivil")));
               //Criando uma instancia para a morada
                Morada morada = new Morada(
                        request.getParameter("bairro").trim(),
                        request.getParameter("rua").trim(),
                        Integer.parseInt(request.getParameter("ncasa").trim()),
                        new ComunaDao().getID(request.getParameter("comuna").trim())
                    );
                if(pessoaAlterar!=null){
                    morada.setId(pessoaAlterar.getMorada());
                    if(new MoradaDao().update(morada)){
                        pessoa.setMorada(morada.getId());
                        pessoa.setId(pessoaAlterar.getId());
                        if(pDao.update(pessoa)){
                            mensagem = "Actualizado com sucesso!!";
                        }
                        else
                            mensagem = "Erro: ao Actualizar os dados da pessoa!!";
                    }
                    else
                        mensagem = "Erro: ao Actualizar os dados da morada!!";
                }
                else
                    mensagem = "Erro: Pessoa não foi cadastrada!!";
            }   
            response.sendRedirect("Paginas/pessoa.jsp?erro="+mensagem);
        }
    }

    
    public boolean verificarCampos(HttpServletRequest request){
        if(request.getParameter("pnome").trim() != null && 
                request.getParameter("unome").trim()!= null &&
                request.getParameter("dataNasc").trim()!= null &&
                request.getParameter("bi").trim()!= null &&
                request.getParameter("sexo").trim()!= null &&
                request.getParameter("estadoCivil").trim()!= null &&
                request.getParameter("bairro").trim()!= null &&
                request.getParameter("rua").trim()!= null &&
                request.getParameter("ncasa").trim()!= null &&
                request.getParameter("comuna").trim()!= null &&
                request.getParameter("id").trim()!= null){
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

}
