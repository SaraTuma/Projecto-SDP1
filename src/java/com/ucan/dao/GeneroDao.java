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
import com.ucan.modelo.Genero;

/**
 *
 * @author saratuma
 */
public class GeneroDao {
    private Connection conexao;
    
    public ArrayList<Genero> findAll() {
        ArrayList<Genero> array = new ArrayList<Genero>();

        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from genero";
                PreparedStatement prepared = conexao.prepareStatement(query);
                ResultSet result = prepared.executeQuery();
                while(result.next()){
                    array.add(new Genero(result.getInt(1), result.getString(2)));
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(GeneroDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;

    }
}
