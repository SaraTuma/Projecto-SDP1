/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;

import com.ucan.modelo.Auxiliar;
import com.ucan.modelo.Email;
import com.ucan.modelo.Telefone;
import com.ucan.utils.Conexao;
import com.ucan.utils.FuncaoAuxiliar;
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
public class TelefoneDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    
        public ArrayList<Telefone> findAll(){
       ArrayList<Telefone> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.telefone";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Telefone(result.getInt(1), result.getString(2), result.getInt(3)));
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TelefoneDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
        
        public ArrayList<Telefone> findAllSemRepetir(){
       ArrayList<Telefone> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.telefone";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    if(!FuncaoAuxiliar.verificarChaveRepetida(array, result.getInt(3))){
                        array.add(new Telefone(result.getInt(1), result.getString(2), result.getInt(3)));

                    }
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TelefoneDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
        
    
        
    public boolean insert( Telefone telefone){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.telefone( descricao, fk_pessoa)VALUES ( ?, ?);";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, telefone.getDescricao());
                prepared.setInt(2, telefone.getPessoa());
                
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TelefoneDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    public boolean update(Telefone telefone){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.telefone SET descricao=?, fk_pessoa=? WHERE pk_telefone=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, telefone.getDescricao());
                prepared.setInt(2, telefone.getPessoa());
                prepared.setInt(3, telefone.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TelefoneDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ArrayList<Auxiliar> buscarTelefonesPorPessoa(Integer pk_pessoa){   
        ArrayList<Auxiliar> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select descricao, pnome, unome from pessoa inner join telefone on fk_pessoa=pk_pessoa where pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, pk_pessoa);
                result = prepared.executeQuery();
                while(result.next()){
                    Auxiliar aux = new Auxiliar();
                    aux.setDescricao(result.getString(1));
                    aux.setPrimeiroNome(result.getString(2));
                    aux.setUltimoNome(result.getString(3));
                    array.add(aux);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TelefoneDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
}
