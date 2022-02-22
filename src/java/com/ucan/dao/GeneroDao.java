
package com.ucan.dao;

import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ucan.modelo.Genero;

/**
 *
 * @author saratuma
 */
public class GeneroDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public ArrayList<Genero> findAll() {
        ArrayList<Genero> array = new ArrayList<Genero>();

        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from genero";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Genero(result.getInt(1), result.getString(2)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;

    }
    
    
    public String getDescricao(Integer id){
       String descricao=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                    String query = "select descricao from public.genero where pk_genero=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setInt(1, id);
                    result = prepared.executeQuery();
                    if(result.next()){
                        descricao=result.getString("descricao");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return descricao;
    }
    
    
    public Integer getId(String descricao){
       Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                    String query = "select pk_genero from public.genero where descricao=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, descricao);
                    result = prepared.executeQuery();
                    if(result.next()){
                        id=result.getInt("pk_genero");
                    }
                    Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
     public boolean delete(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from genero where pk_genero=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
