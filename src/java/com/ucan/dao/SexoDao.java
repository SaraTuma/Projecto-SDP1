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
import com.ucan.modelo.Pessoa;
import com.ucan.modelo.Sexo;

/**
 *
 * @author saratuma
 */
public class SexoDao {
    private Connection conexao;
    
    
    
    public int getID(String nome){
       ArrayList<Sexo> array = new ArrayList<Sexo>();
       int r=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from sexo where descricao=?";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    prepared.setString(1, nome);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        r=result.getInt("pk_sexo");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select descricao from public.sexo where pk_sexo=?";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        descricao=result.getString("descricao");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
    
    
    public ArrayList<Sexo> findAll(){
       ArrayList<Sexo> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from sexo";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new Sexo(result.getInt(1), result.getString(2)));
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SexoDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
}
