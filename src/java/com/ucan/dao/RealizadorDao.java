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
import com.ucan.modelo.Realizador;

/**
 *
 * @author saratuma
 */
public class RealizadorDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public ArrayList<Realizador> findAll() throws ClassNotFoundException {
       ArrayList<Realizador> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from realizador";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                            new Realizador(result.getInt(1), result.getInt(2), result.getDate(3))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    
    public ArrayList<String> getPessoaNome() {
       ArrayList<String> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pnome, unome from public.pessoa inner join public.realizador on pk_pessoa=fk_pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(result.getString(1) +" "+ result.getString(2));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    
    public String getRealizadorName(Integer id) {
        String name = null;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pnome, unome from public.pessoa inner join public.realizador on pk_pessoa=fk_pessoa where pk_realizador=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    name=result.getString(1) +" "+ result.getString(2);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return name;
    }
    
    
       public Integer getRealizadorIdByPessoa(Integer idPessoa) {
        Integer idRealizador = 0;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pk_realizador from realizador where fk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, idPessoa);
                result = prepared.executeQuery();
                if(result.next()){
                    idRealizador=result.getInt("pk_realizador");
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idRealizador;
    }
    
    
    public String getPessoaNome(Integer id) {
       String nome = null;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pnome, unome from public.pessoa inner join public.realizador on pk_pessoa=fk_pessoa where fk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    nome=result.getString(1)+" "+result.getString(2);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return nome;
    }
    
       public boolean updateDataCadastro(Realizador modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.realizador SET fk_pessoa=?, data_cadastro=? WHERE pk_realizador=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, modelo.getPessoa());
                prepared.setDate(2, modelo.getDataCadastro());
                prepared.setInt(3, modelo.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
      public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from realizador where pk_realizador=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RealizadorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
