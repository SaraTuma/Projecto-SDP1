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
    
    public ArrayList<Classificacao> findAll() {
       ArrayList<Classificacao> array = new ArrayList<Classificacao>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from classificacao";
                PreparedStatement prepared = conexao.prepareStatement(query);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Classificacao(result.getInt(1), result.getString(2)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ClassificacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ClassificacaoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;

    }
}
