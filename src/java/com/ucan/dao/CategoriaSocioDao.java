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
import com.ucan.modelo.CategoriaSocio;

/**
 *
 * @author saratuma
 */
public class CategoriaSocioDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public ArrayList<CategoriaSocio> findAll() {
       ArrayList<CategoriaSocio> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.categoria_socio";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new CategoriaSocio(result.getInt(1), result.getString(2)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoriaSocioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;

    }
    
    public Integer getId(String descricao) {
        Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_categoria from public.categoria_socio where descricao=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, descricao);
                result = prepared.executeQuery();
                while(result.next()){
                    id = result.getInt(1);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoriaSocioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;

    }
    
    public String getDescricao(Integer id) {
        String  descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select descricao from public.categoria_socio where pk_categoria=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    descricao = result.getString(1);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(CategoriaSocioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;

    }
}


