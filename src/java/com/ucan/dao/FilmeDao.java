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
import com.ucan.modelo.Filme;

/**
 *
 * @author saratuma
 */
public class FilmeDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    
     public boolean insert(Filme modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.filme(titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, ano_publicado)VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, modelo.getTituloOrig());
                prepared.setString(2, modelo.getTituloPort());
                prepared.setString(3, modelo.getSinopse());
                prepared.setTime(4, modelo.getDuracao());
                prepared.setInt(5, modelo.getRealizador());
                prepared.setInt(6, modelo.getClassificacao());
                prepared.setInt(7, modelo.getGenero());
                prepared.setInt(8, modelo.getAnoPublicado());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
     
     public boolean insertDataCadastro(Filme modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.filme(titulo_orig, titulo_port, sinopse, duracao, fk_realizador, fk_classificacao, fk_genero, data_cadastro, ano_publicado)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, modelo.getTituloOrig());
                prepared.setString(2, modelo.getTituloPort());
                prepared.setString(3, modelo.getSinopse());
                prepared.setTime(4, modelo.getDuracao());
                prepared.setInt(5, modelo.getRealizador());
                prepared.setInt(6, modelo.getClassificacao());
                prepared.setInt(7, modelo.getGenero());
                prepared.setDate(8, modelo.getDataCadastro());
                prepared.setInt(9, modelo.getAnoPublicado());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ArrayList<Filme> findAll() {
       ArrayList<Filme> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.filme";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                        new Filme(result.getInt(1), 
                                result.getString(2), 
                                result.getString(3),
                                result.getString(4), 
             result.getTime(5), result.getInt(6), 
            result.getInt(7), result.getInt(8), result.getDate(9),result.getInt(10))
                    );
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    
    public Filme findById(Integer id) {
       Filme modelo = null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.filme where pk_filme=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    
                    modelo =    new Filme(result.getInt(1), result.getString(2), result.getString(3),
                        result.getString(4), result.getTime(5), result.getInt(6), 
                        result.getInt(7), result.getInt(8), result.getDate(9),result.getInt(10)
                    );
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modelo;
    }
    
     public String findByTitles(Integer id) {
       String titulos = null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select titulo_orig, titulo_port from public.filme where pk_filme=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    
                    titulos = result.getString(1)+" ; "+ result.getString(2);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return titulos;
    }
    
    
     public boolean verifyById(Integer id) {
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.filme where pk_filme=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                    return true;
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
        public boolean update(Filme modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.filme SET titulo_orig=?, titulo_port=?, "
                        + "sinopse=?, duracao=?, fk_realizador=?, fk_classificacao=?, fk_genero=?, "
                        + "ano_publicado=? WHERE pk_filme=?;";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, modelo.getTituloOrig());
                prepared.setString(2, modelo.getTituloPort());
                prepared.setString(3, modelo.getSinopse());
                prepared.setTime(4, modelo.getDuracao());
                prepared.setInt(5, modelo.getRealizador());
                prepared.setInt(6, modelo.getClassificacao());
                prepared.setInt(7, modelo.getGenero());
                prepared.setInt(8, modelo.getAnoPublicado());
                prepared.setInt(9, modelo.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean updateDataCadastro(Filme modelo){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.filme SET titulo_orig=?, titulo_port=?, "
                        + "sinopse=?, duracao=?, fk_realizador=?, fk_classificacao=?, fk_genero=?, "
                        + "data_cadastro=?, ano_publicado=? WHERE pk_filme=?;";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, modelo.getTituloOrig());
                prepared.setString(2, modelo.getTituloPort());
                prepared.setString(3, modelo.getSinopse());
                prepared.setTime(4, modelo.getDuracao());
                prepared.setInt(5, modelo.getRealizador());
                prepared.setInt(6, modelo.getClassificacao());
                prepared.setInt(7, modelo.getGenero());
                prepared.setDate(8, modelo.getDataCadastro());
                prepared.setInt(9, modelo.getAnoPublicado());
                prepared.setInt(10, modelo.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
      public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from filme where pk_filme=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
}
