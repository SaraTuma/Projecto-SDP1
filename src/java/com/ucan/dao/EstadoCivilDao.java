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
import com.ucan.modelo.EstadoCivil;

/**
 *
 * @author saratuma
 */
public class EstadoCivilDao {
    private Connection conexao;
    
    public int getID(String descricao){
       int id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_estado_civil from public.estado_civil where descricao=?";
                    PreparedStatement prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    ResultSet result = prepared.executeQuery();
                    while(result.next()){
                        id=result.getInt("pk_estado_civil");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public ArrayList<EstadoCivil> findAll() {
       
        ArrayList<EstadoCivil> array = new ArrayList<EstadoCivil>();
        try {
            conexao = Conexao.getConexao();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        if(conexao!=null){
            try {
                String query = "select * from estado_civil";
                PreparedStatement prepared = conexao.prepareStatement(query);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    array.add(new EstadoCivil(result.getInt(1), result.getString(2)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            } catch (SQLException ex) {
                Logger.getLogger(EstadoCivilDao.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return array;
    }
}
