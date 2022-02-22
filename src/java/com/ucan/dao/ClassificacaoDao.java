/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;

import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ucan.modelo.Classificacao;

/**
 *
 * @author saratuma
 */
public class ClassificacaoDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public ArrayList<Classificacao> findAll() {
       ArrayList<Classificacao> array = new ArrayList<Classificacao>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from classificacao";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Classificacao(result.getInt(1), result.getString(2)));
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ClassificacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;

    }
    
      public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                    String query = "select descricao from public.classificacao where pk_classificacao=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    result = prepared.executeQuery();
                    if(result.next()){
                        descricao=result.getString("descricao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ClassificacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
      
     public Integer getId(String descricao){
       Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                    String query = "select pk_classificacao from public.classificacao where descricao=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    result = prepared.executeQuery();
                    if(result.next()){
                        id=result.getInt("pk_classificacao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ClassificacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
}
