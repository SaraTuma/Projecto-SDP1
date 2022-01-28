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
import java.sql.Time;
import java.sql.Timestamp;
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
            result.getInt(7), result.getInt(8), result.getTimestamp(9),result.getInt(10))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FilmeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
}
