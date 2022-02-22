
package com.ucan.dao;

import com.ucan.utils.Conexao;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ucan.modelo.Pessoa;

/**
 *
 * @author saratuma
 */
public class PessoaDao {
    private Connection conexao;
    private PreparedStatement prepared;
    private ResultSet result;
    
    public Integer findOne(Pessoa pessoa){
        Integer id=0;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa from public.pessoa where pnome=? and unome=? and num_bi=? and data_nascimento=? and "
                        + "fk_morada=? and fk_sexo=? and fk_estado_civil=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getPrimeiroNome());
                prepared.setString(2, pessoa.getUltimoNome());
                prepared.setString(3, pessoa.getNumbi());
                prepared.setDate(4, pessoa.getDataNasc());
                prepared.setInt(5, pessoa.getMorada());
                prepared.setInt(6, pessoa.getSexo());
                prepared.setInt(7, pessoa.getEstadoCivil());
                result = prepared.executeQuery();
                while(result.next()){
                   id = result.getInt("pk_pessoa");
                }

                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
    
    public Integer getId(String pnome, String unome){
        Integer id=-1;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                
                    String query = "select pk_pessoa from public.pessoa where pnome=? and unome=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, pnome);
                    prepared.setString(2, unome);
                    result = prepared.executeQuery();
                    if(result.next()){
                       id = result.getInt("pk_pessoa");
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
               
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }
    
     public boolean verifyBI(String bi){
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                try {
                    String query = "select * from public.pessoa where num_bi=?";
                    prepared = conexao.prepareStatement(query);
                    prepared.setString(1, bi);
                    result = prepared.executeQuery();
                    if(result.next()){
                        Conexao.fecharConexaoPR(conexao, prepared, result);
                        return true;
                    }
                    
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                } catch (SQLException ex) {
                    Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public ArrayList<Pessoa> findAll() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                            new Pessoa(result.getInt(1), result.getString(2),result.getString(3), result.getString(4), 
                                result.getDate(5), result.getInt(6), result.getInt(7), 
                                result.getInt(8), result.getDate(9))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
     public ArrayList<Pessoa> findAllPersonNotActors() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa, pnome, unome from pessoa left join actor on pk_pessoa=fk_pessoa where fk_pessoa is null;";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                
                while(result.next()){
                    Pessoa pessoa=new Pessoa();
                    pessoa.setId(result.getInt(1));
                    pessoa.setPrimeiroNome(result.getString(2));
                    pessoa.setUltimoNome(result.getString(3));
                    array.add(pessoa);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
     
     
      public ArrayList<Pessoa> findAllPersonNotSocio() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa, pnome, unome from pessoa left join socio on pk_pessoa=fk_pessoa where fk_pessoa is null;";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                
                while(result.next()){
                    Pessoa pessoa=new Pessoa();
                    pessoa.setId(result.getInt(1));
                    pessoa.setPrimeiroNome(result.getString(2));
                    pessoa.setUltimoNome(result.getString(3));
                    array.add(pessoa);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
      
      
      public ArrayList<Pessoa> findAllPersonNotRealizador() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa, pnome, unome from pessoa left join realizador on pk_pessoa=fk_pessoa where fk_pessoa is null";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                
                while(result.next()){
                    Pessoa pessoa=new Pessoa();
                    pessoa.setId(result.getInt(1));
                    pessoa.setPrimeiroNome(result.getString(2));
                    pessoa.setUltimoNome(result.getString(3));
                    array.add(pessoa);
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
      
    public Pessoa findId(Integer id) {
       Pessoa pessoa=null;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from pessoa where pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                   
                    pessoa = new Pessoa(result.getInt(1), result.getString(2),result.getString(3), result.getString(4), 
                                result.getDate(5), result.getInt(6), result.getInt(7), 
                                result.getInt(8), result.getDate(9))
                    ;
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return pessoa;
    }
    
    public boolean findPersonById(Integer id) {
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select * from pessoa where pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                result = prepared.executeQuery();
                if(result.next()){
                    Conexao.fecharConexaoPR(conexao, prepared, result);
                    return true;
                }
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    
    public ArrayList<Pessoa> findAllNames() {
       ArrayList<Pessoa> array = new ArrayList<>();
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "select pk_pessoa, nome from public.pessoa";
                prepared = conexao.prepareStatement(query);
                result = prepared.executeQuery();
                while(result.next()){
                    array.add(
                            new Pessoa(result.getInt(1), result.getString(2), result.getString(3))
                    );
                }
                
                Conexao.fecharConexaoPR(conexao, prepared, result);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return array;
    }
    
    public boolean insert( Pessoa pessoa){  
        boolean r=false;
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "INSERT INTO public.pessoa(pnome, unome, num_bi, data_nascimento, fk_morada, fk_sexo, fk_estado_civil)VALUES (?, ?, ?, ?, ?, ?, ?)";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getPrimeiroNome());
                prepared.setString(2, pessoa.getUltimoNome());
                prepared.setString(3, pessoa.getNumbi());
                prepared.setDate(4, pessoa.getDataNasc());
                prepared.setInt(5, pessoa.getMorada());
                prepared.setInt(6, pessoa.getSexo());
                prepared.setInt(7, pessoa.getEstadoCivil());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                r=true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
        
    }
    
    public boolean deleteId(Integer id){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from pessoa where pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setInt(1, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deletePessoa(Pessoa pessoa){    
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "DELETE from public.pessoa where pnome=?, unome=? and num_bi=? and "
                        + "data_nascimento=? and fk_morada=? and fk_sexo=?, fk_estado_civil=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getPrimeiroNome());
                prepared.setString(2, pessoa.getUltimoNome());
                prepared.setString(3, pessoa.getNumbi());
                prepared.setDate(4, pessoa.getDataNasc());
                prepared.setInt(5, pessoa.getMorada());
                prepared.setInt(6, pessoa.getSexo());
                prepared.setInt(7, pessoa.getEstadoCivil());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public void deleteBi(String bi){  
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "delete from public.pessoa where num_bi=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, bi);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    
    public boolean update(Pessoa pessoa){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.pessoa SET pnome=?,unome=?, num_bi=?, data_nascimento=?,"
                        + " fk_morada=?, fk_sexo=?, fk_estado_civil=?, data_cadastro=?"
                        + "WHERE pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setString(1, pessoa.getPrimeiroNome());
                prepared.setString(2, pessoa.getUltimoNome());
                prepared.setString(3, pessoa.getNumbi());
                prepared.setDate(4, pessoa.getDataNasc());
                prepared.setInt(5, pessoa.getMorada());
                prepared.setInt(6, pessoa.getSexo());
                prepared.setInt(7, pessoa.getEstadoCivil());
                prepared.setDate(8, pessoa.getDatacadastro());
                prepared.setInt(9, pessoa.getId());
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
      public void updateDataCadastro(Integer id, Date data){        
        try {
            conexao = Conexao.getConexao();
            if(conexao!=null){
                String query = "UPDATE public.pessoa SET data_cadastro=? "
                        + "WHERE pk_pessoa=?";
                prepared = conexao.prepareStatement(query);
                prepared.setDate(1, data);
                prepared.setInt(2, id);
                prepared.execute();
                Conexao.fecharConexaoP(conexao, prepared);
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(PessoaDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
}
