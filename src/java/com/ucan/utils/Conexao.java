/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author free
 */
public class Conexao
{
    private static final String URL = "jdbc:postgresql://localhost:5432/clube";
    private static final String USERNAME = "postgres";
    private static final String PASSWORD = "postgres";
    private static Connection co =null;
    
    
    public static Connection getConexao() throws ClassNotFoundException, SQLException{
        
        Class.forName("org.postgresql.Driver");
        co=DriverManager.getConnection(URL, USERNAME,PASSWORD);
        return co;
    }
    
    
    public static void fecharConexao(Connection conexao){
        try {
            conexao.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ERRO ao fechar conexão!");
        }
    }
    
    public static void fecharConexaoP(Connection conexao, PreparedStatement prepared){
        try {
            prepared.close();
            conexao.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ERRO ao fechar conexão!");
        }
    }
    
    public static void fecharConexaoPR(Connection conexao, PreparedStatement prepared, ResultSet result){
        try {
            result.close();
            prepared.close();
            conexao.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("ERRO ao fechar conexão!");
        }
    }
    
}
