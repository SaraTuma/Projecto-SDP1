/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;

import com.ucan.modelo.FilmeActor;
import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author saratuma
 */
public class FilmeActorDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    
    public boolean insert(FilmeActor modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.filme_actor(fk_filme, fk_actor)VALUES (?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, modelo.getFilme());
                prepared.setInt(2, modelo.getActor());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean insertDataCadastro(FilmeActor modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.filme_actor(fk_filme, fk_actor, data_cadastro)VALUES (?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, modelo.getFilme());
                prepared.setInt(2, modelo.getActor());
                prepared.setDate(3, modelo.getDataCadastro());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean update(FilmeActor modelo, int filme, int actor){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.filme_actor SET fk_filme=?, fk_actor=?, data_cadastro=? WHERE fk_filme=? and pk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, modelo.getFilme());
                prepared.setInt(2, modelo.getActor());
                prepared.setDate(3, modelo.getDataCadastro());
                prepared.setInt(4, filme);
                prepared.setInt(5, actor);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
        
    public ArrayList<FilmeActor> findAll(){
       ArrayList<FilmeActor> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from filme_actor";
                    prepared = conexao.prepareStatement(query);
                    result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new FilmeActor(result.getInt(1), result.getInt(2), result.getDate(3)));
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
      public boolean delete(Integer filme, Integer actor){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "DELETE FROM public.filme_actor WHERE fk_filme=? and fk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, filme);
                prepared.setInt(2, actor);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
