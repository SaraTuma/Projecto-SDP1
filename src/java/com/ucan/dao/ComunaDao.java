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
import com.ucan.modelo.Comuna;

/**
 *
 * @author saratuma
 */
public class ComunaDao {
    private Connection conexao;
    PreparedStatement prepared;
    
    public int getID(String descricao){
       int id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_comuna from public.comuna where descricao=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        id=result.getInt("pk_comuna");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select descricao from public.comuna where pk_comuna=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        descricao=result.getString("descricao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
    
    public ArrayList<Comuna> findAll(){
       ArrayList<Comuna> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from comuna";
                    prepared = conexao.prepareStatement(query);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new Comuna(result.getInt(1), result.getString(2), result.getInt(3)));
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public Comuna findOne(String descricao){
       Comuna comuna=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from comuna where descricao=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        comuna =new Comuna(result.getInt(1), result.getString(2), result.getInt(3));
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return comuna;
    }
    
    
      public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from comuna where pk_comuna=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ComunaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
