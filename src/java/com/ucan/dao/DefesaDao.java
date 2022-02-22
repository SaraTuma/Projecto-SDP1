/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.dao;


import com.ucan.modelo.Defesa;
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
public class DefesaDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    

    
    
    public ArrayList<Defesa> listarDefesa(int ano, int mes1,int mes2, int genero, String letra){
        ArrayList<Defesa> listaDefesa = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pnome , unome from pessoa pe inner join socio so on pe.pk_pessoa=so.fk_pessoa inner "
                        + "join alugar alu on so.pk_socio=alu.fk_socio inner join filme fil on alu.fk_filme=fil.pk_filme where pnome "
                        + "like '"+letra+"%' and fil.fk_genero=? and date_part('month',alu.data_alugar) "
                        + "between ? and ? and date_part('year',alu.data_alugar)=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, genero);
                prepared.setInt(2, mes1);
                prepared.setInt(3, mes2);
                prepared.setInt(4, ano);
                result = prepared.executeQuery();
                while(result.next()){
                    Defesa defesa = new Defesa();
                    defesa.setPrimeiroNome(result.getString(1));
                    defesa.setUltimoNome(result.getString(2));
                    
                    listaDefesa.add(defesa);
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DefesaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listaDefesa;
    }
}
