/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;

import com.ucan.modelo.Alugar;
import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.Date;
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
public class AlugarDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public ArrayList<Alugar> findAll(){
       ArrayList<Alugar> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.alugar";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Alugar(result.getDate(1), result.getDate(2), result.getInt(3), result.getInt(4), result.getDate(5)));
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            return array;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
   
        public boolean insert( Alugar alugar){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme)VALUES (?, ?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, alugar.getDataAlugar());
                prepared.setDate(2, alugar.getDataDevolucao());
                prepared.setInt(3, alugar.getSocio());
                prepared.setInt(4, alugar.getFilme());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
      public boolean insertDataCadastro( Alugar alugar){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.alugar( data_alugar, data_devolucao, fk_socio, fk_filme, data_cadastro)VALUES (?, ?, ?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, alugar.getDataAlugar());
                prepared.setDate(2, alugar.getDataDevolucao());
                prepared.setInt(3, alugar.getSocio());
                prepared.setInt(4, alugar.getFilme());
                prepared.setDate(5, alugar.getDataCadastro());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
        
 
    public boolean update(Alugar alugar){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.alugar SET  data_alugar=?, data_devolucao=?, fk_socio=?, fk_filme=? WHERE pk_alugar=?";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, alugar.getDataAlugar());
                prepared.setDate(2, alugar.getDataDevolucao());
                prepared.setInt(3, alugar.getSocio());
                prepared.setInt(4, alugar.getFilme());
                prepared.setInt(5, alugar.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateDataCdastro(Alugar alugar){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.alugar SET  data_alugar=?, data_devolucao=?, fk_socio=?, fk_filme=?, data_cadastro=? WHERE pk_alugar=?";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, alugar.getDataAlugar());
                prepared.setDate(2, alugar.getDataDevolucao());
                prepared.setInt(3, alugar.getSocio());
                prepared.setInt(4, alugar.getFilme());
                prepared.setDate(5, alugar.getDataCadastro());
                prepared.setInt(6, alugar.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
      
    public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from alugar where pk_alugar=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteByDates(Date dataAlugar, Date dataDevolucao){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from alugar where data_alugar=? and data_devolucao=?";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, dataAlugar);
                prepared.setDate(2, dataDevolucao);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AlugarDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
