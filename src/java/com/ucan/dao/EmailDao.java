package com.ucan.dao;

import com.ucan.modelo.Email;
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
public class EmailDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
        public ArrayList<Email> findAll(){
       ArrayList<Email> array = new ArrayList<>();
        try {
            
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from public.email";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Email(result.getInt(1), result.getString(2), result.getInt(3)));
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            return array;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
        
    public boolean insert( Email email){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.email( descricao, fk_pessoa)VALUES ( ?, ?);";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, email.getDescricao());
                prepared.setInt(2, email.getPessoa());
                
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
        
    }
    
    public boolean update(Email email){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.email SET descricao=?, fk_pessoa=? WHERE pk_email=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, email.getDescricao());
                prepared.setInt(2, email.getPessoa());
                prepared.setInt(3, email.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
     public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from email where pk_email=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(EmailDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
