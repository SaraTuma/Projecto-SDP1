package com.ucan.dao;

import com.ucan.utils.Conexao;
import java.sql.Connection;
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
    private ResultSet result;
    
    public ArrayList<Actor> findAll(){
       ArrayList<Actor> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.actor";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Actor(result.getInt(1), result.getInt(2), result.getDate(3)));
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
                String query = "SELECT pnome, unome from public.pessoa inner join public.actor on pk_pessoa=fk_pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(result.getString(1) +" "+ result.getString(1));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    
       public Integer getPessoaId(Integer idActor) {
       Integer idPessoa = null;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pk_pessoa from public.pessoa inner join public.actor on pk_pessoa=fk_pessoa where pk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, idActor);
                result = prepared.executeQuery();
                if(result.next()){
                    idPessoa=result.getInt(1);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return idPessoa;
    }
    
    public String getPessoaNome(Integer id) {
       String nome = null;
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "SELECT pnome, unome from public.pessoa inner join public.actor on pk_pessoa=fk_pessoa where fk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    nome=result.getString(1)+" "+result.getString(2);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return nome;
    }
    
        public boolean insert( Actor actor){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.actor(fk_pessoa)VALUES (?)";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, actor.getPessoa());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
        
    public boolean insertDataCadastro( Actor actor){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.actor(fk_pessoa, data_cadastro)VALUES (?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, actor.getPessoa());
                prepared.setDate(2, actor.getDataCadastro());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }  
    
    
    public boolean update(Actor actor){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.actor SET fk_pessoa=? WHERE pk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, actor.getPessoa());
                prepared.setInt(2, actor.getId());

                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean updateDataCdastro(Actor actor){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.actor SET fk_pessoa=?, data_cadastro=? WHERE pk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, actor.getPessoa());
                prepared.setDate(2, actor.getDataCadastro());
                prepared.setInt(3, actor.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
      
    public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from actor where pk_actor=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteByPessoa(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from actor where fk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ActorDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
}
