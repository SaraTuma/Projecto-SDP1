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
import com.ucan.modelo.Socio;

/**
 *
 * @author saratuma
 */
public class SocioDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    
      public ArrayList<Socio> findAll(){
       ArrayList<Socio> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select *  from public.socio";
                    prepared = conexao.prepareStatement(query);
                    result = prepared.executeQuery();
                    while(result.next()){
                        array.add(new Socio(result.getInt(1),result.getInt(2), result.getInt(3), result.getTimestamp(4)));
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(SocioDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SocioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
      
      
       public boolean insert( Socio socio){  
        boolean r=false;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.socio( fk_pessoa, fk_categoria)VALUES ( ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, socio.getPessoa());
                prepared.setInt(2, socio.getCategoria());
                
                //prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                r=true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SocioDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
        
    }
}
