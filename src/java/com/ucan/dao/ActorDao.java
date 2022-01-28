/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;

import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ucan.modelo.Actor;

/**
 *
 * @author saratuma
 */
public class ActorDao {
    private Connection conexao;
    private PreparedStatement prepared;
    
    public ArrayList<Actor> findAll(){
       ArrayList<Actor> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.actor";
                prepared = conexao.prepareStatement(query);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Actor(result.getInt(1), result.getInt(2), result.getTimestamp(3)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            return array;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public ArrayList<String> getPessoaNome() {
       ArrayList<String> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT nome from public.pessoa inner join public.actor on pk_pessoa=fk_pessoa";
                prepared = conexao.prepareStatement(query);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    array.add(result.getString(1));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public String getPessoaNome(Integer id) {
       String nome = null;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT nome from public.pessoa inner join public.actor on pk_pessoa=fk_pessoa where fk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    nome=result.getString(1);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return nome;
    }
    
    
    
    //fazer o crud completo
    // fazer um metodo que retorna uma pessoa que é actor - dados completos
}
