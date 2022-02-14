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
import com.ucan.modelo.Municipio;

/**
 *
 * @author saratuma
 */
public class MunicipioDao {
     private Connection conexao;
     private PreparedStatement prepared;
     private ResultSet result;
    
    public ArrayList<Municipio> findAll(){
       ArrayList<Municipio> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from municipio";
                    prepared = conexao.prepareStatement(query);
                    result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new Municipio(result.getInt(1), result.getString(2)));
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    
    public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select descricao from public.municipio where pk_municipio=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    result = prepared.executeQuery();
                    while(result.next()){
                        descricao=result.getString("descricao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
    
    public Municipio findMunicipio(Integer id){
          Municipio municipio = null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from public.municipio where pk_municipio=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    result = prepared.executeQuery();
                    while(result.next()){
                       municipio = new Municipio(result.getInt(1), result.getString(2), result.getInt(3));
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(MunicipioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return municipio;
    }
}
