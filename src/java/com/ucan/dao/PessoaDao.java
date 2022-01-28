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
import com.ucan.modelo.Pessoa;

/**
 *
 * @author saratuma
 */
public class PessoaDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public Integer findOne(Pessoa pessoa){
        Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_pessoa from public.pessoa where nome=? and num_bi=? and data_nascimento=? and "
                            + "telefone=? and email=? and fk_morada=? and fk_sexo=? and fk_estado_civil=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, pessoa.getNome());
                    prepared.setString(2, pessoa.getNumbi());
                    prepared.setDate(3, pessoa.getDataNasc());
                    prepared.setString(4, pessoa.getTelefone());
                    prepared.setString(5, pessoa.getEmail());
                    prepared.setInt(6, pessoa.getMorada());
                    prepared.setInt(7, pessoa.getSexo());
                    prepared.setInt(8, pessoa.getEstadoCivil());
                    result = prepared.executeQuery();
                    while(result.next()){
                       id = result.getInt("pk_pessoa");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public Integer getId(String nome){
        Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select pk_pessoa from public.pessoa where nome=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, nome);
                    result = prepared.executeQuery();
                    while(result.next()){
                       id = result.getInt("pk_pessoa");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    public ArrayList<Pessoa> findAll() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                            new Pessoa(result.getInt(1), result.getString(2), result.getString(3), 
                                result.getDate(4), result.getString(5), 
                                result.getString(6), result.getInt(7), result.getInt(8), 
                                result.getInt(9), result.getString(10))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public ArrayList<Pessoa> findAllNames() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa, nome from public.pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                            new Pessoa(result.getInt(1), result.getString(2))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public boolean insert( Pessoa pessoa){  
        boolean r=false;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.pessoa(\n" +
"	nome, num_bi, data_nascimento, telefone, email, fk_morada, fk_sexo, fk_estado_civil)\n" +
"	VALUES (?, ?, ?, ?, ?, ?, ?, ?);";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getNome());
                prepared.setString(2, pessoa.getNumbi());
                prepared.setDate(3, pessoa.getDataNasc());
                prepared.setString(4, pessoa.getTelefone());
                prepared.setString(5, pessoa.getEmail());
                prepared.setInt(6, pessoa.getMorada());
                prepared.setInt(7, pessoa.getSexo());
                prepared.setInt(8, pessoa.getEstadoCivil());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                r=true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
        
    }
    
    public boolean deleteId(Integer id){    
        boolean deleted=false;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from pessoa where pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                deleted=true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deleted;
    }
    
    public boolean deletePessoa(Pessoa pessoa){    
        boolean deleted=false;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "DELETE from public.pessoa where nome=? and num_bi=? and "
                        + "data_nascimento=? and telefone=? and email=? and fk_morada=? and fk_sexo=?, fk_estado_civil=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getNome());
                prepared.setString(2, pessoa.getNumbi());
                prepared.setDate(3, pessoa.getDataNasc());
                prepared.setString(4, pessoa.getTelefone());
                prepared.setString(5, pessoa.getEmail());
                prepared.setInt(6, pessoa.getMorada());
                prepared.setInt(7, pessoa.getSexo());
                prepared.setInt(8, pessoa.getEstadoCivil());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                deleted=true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return deleted;
    }
    
    public void deleteBi(String bi){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from public.pessoa where num_bi=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, bi);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public boolean update(Pessoa pessoa){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.pessoa SET nome=?, num_bi=?, data_nascimento=?, telefone=?, email=?,"
                        + " fk_morada=?, fk_sexo=?, fk_estado_civil=?"
                        + "WHERE pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getNome());
                prepared.setString(2, pessoa.getNumbi());
                prepared.setDate(3, pessoa.getDataNasc());
                prepared.setString(4, pessoa.getTelefone());
                prepared.setString(5, pessoa.getEmail());
                prepared.setInt(6, pessoa.getMorada());
                prepared.setInt(7, pessoa.getSexo());
                prepared.setInt(8, pessoa.getEstadoCivil());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
      public void updateDataCadastro(Integer id, Date data){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.pessoa SET data_cadastro=? "
                        + "WHERE pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, data);
                prepared.setInt(2, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}