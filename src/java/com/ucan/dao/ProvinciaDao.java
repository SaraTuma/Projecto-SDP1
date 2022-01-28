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
import com.ucan.modelo.Provincia;

/**
 *
 * @author saratuma
 */
public class ProvinciaDao {
     private Connection conexao;
     private PreparedStatement prepared;
    
    public ArrayList<Provincia> findAll(){
       ArrayList<Provincia> array = new ArrayList<Provincia>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from provincia";
                    prepared = conexao.prepareStatement(query);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new Provincia(result.getInt(1), result.getString(2)));
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ProvinciaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProvinciaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select descricao from public.provincia where pk_provincia=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        descricao=result.getString("descricao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ProvinciaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProvinciaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
}
