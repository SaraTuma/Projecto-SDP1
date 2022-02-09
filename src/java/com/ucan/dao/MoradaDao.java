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
import com.ucan.modelo.Morada;

/**
 *
 * @author saratuma
 */
public class MoradaDao {
     private Connection conexao;
     private PreparedStatement prepared;
     private ResultSet result;
     
     public boolean insert( Morada morada){  
        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.morada(\n" +
"	bairro, rua, ncasa, fk_comuna)\n" +
"	VALUES (?, ?, ?, ?);";
                PreparedStatement prepared = conexao.prepareStatement(query);
                prepared.setString(1, morada.getBairro());
                prepared.setString(2, morada.getRua());
                prepared.setInt(3, morada.getnCasa());
                prepared.setInt(4, morada.getComuna());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    public ArrayList<Morada> findAll(){
       ArrayList<Morada> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from morada";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                                           
                        array.add(
                        new Morada(result.getInt(1), result.getString(2), result.getString(3),
                                result.getInt(4), result.getInt(5) ) 
                        );
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public int getID(String descricao){
       int r=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_morada from public.morada where descricao=?";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        r=result.getInt("pk_morada");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public Morada findById(Integer id){
       Morada morada=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from morada where pk_morada=?";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                     prepared.setInt(1, id);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                                           
                        
                        morada = new Morada(result.getInt(1), result.getString(2), result.getString(3),
                                result.getInt(4), result.getInt(5) 
                        );
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return morada;
    }
    
      public Integer findOne(Morada morada){
          int id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_morada from public.morada where bairro=? and rua=? and ncasa=? and fk_comuna=?";
                    prepared = conexao.prepareStatement(query);
                     prepared.setString(1, morada.getBairro());
                     prepared.setString(2, morada.getRua());
                     prepared.setInt(3, morada.getnCasa());
                     prepared.setInt(4, morada.getComuna());
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                       id = result.getInt("pk_morada");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
      
      
    public boolean update(Morada morada){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.morada SET bairro=?, rua=?, ncasa=?, fk_comuna=? WHERE pk_morada=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, morada.getBairro());
                prepared.setString(2, morada.getRua());
                prepared.setInt(3, morada.getnCasa());
                prepared.setInt(4, morada.getComuna());
                prepared.setInt(5, morada.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MoradaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
