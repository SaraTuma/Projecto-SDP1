/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.modelo;

import java.sql.Date;

/**
 *
 * @author saratuma
 */
public class Pessoa {
    private Integer id, estadoCivil, morada, sexo;
    private String numbi, telefone, email, datacadastro, primeiroNome, ultimoNome, nomeCompleto;
    private Date dataNasc;

    public Pessoa(String primeiroNome,String ultimoNome, String numbi, Date dataNasc, String telefone, String email, Integer sexo, Integer estadoCivil, Integer morada) {
        this.primeiroNome = primeiroNome;
        this.ultimoNome = ultimoNome;
        this.numbi = numbi;
        this.dataNasc = dataNasc;
        this.telefone = telefone;
        this.email = email;
        this.sexo = sexo;
        this.estadoCivil = estadoCivil;
        this.morada = morada;
        this.nomeCompleto=primeiroNome+" "+ultimoNome;
    }

    public Pessoa() {
    }

    

    public Pessoa(Integer id, String primeiroNome,String ultimoNome, String numbi, 
            Date dataNasc, String telefone, 
            String email, Integer morada, Integer sexo, 
            Integer estadoCivil, String datacadastro) {
        this.id = id;
        this.primeiroNome = primeiroNome;
        this.ultimoNome = ultimoNome;
        this.numbi = numbi;
        this.dataNasc = dataNasc;
        this.telefone = telefone;
        this.email = email;
        this.datacadastro = datacadastro;
        this.sexo = sexo;
        this.estadoCivil = estadoCivil;
        this.morada = morada;
        this.nomeCompleto=primeiroNome+" "+ultimoNome;
    }

   
    
    public String getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(String datacadastro) {
        this.datacadastro = datacadastro;
    }

    public String getPrimeiroNome() {
        return primeiroNome;
    }

    public void setPrimeiroNome(String primeiroNome) {
        this.primeiroNome = primeiroNome;
        this.nomeCompleto=primeiroNome+" ";
    }

    public String getUltimoNome() {
        return ultimoNome;
    }

    public void setUltimoNome(String ultimoNome) {
        this.ultimoNome = ultimoNome;
        this.nomeCompleto+=ultimoNome;
    }


    public Pessoa(Integer id, String primeiroNome, String ultimoNome) {
        this.id = id;
        this.primeiroNome = primeiroNome;
        this.ultimoNome = ultimoNome;
        this.nomeCompleto=primeiroNome+" "+ultimoNome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

    public Integer getMorada() {
        return morada;
    }

    public void setMorada(Integer morada) {
        this.morada = morada;
    }

    

    public String getNumbi() {
        return numbi;
    }

    public void setNumbi(String numbi) {
        this.numbi = numbi;
    }

    public Date getDataNasc() {
        return dataNasc;
    }

    public void setDataNasc(Date dataNasc) {
        this.dataNasc = dataNasc;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getSexo() {
        return sexo;
    }

    public void setSexo(Integer sexo) {
        this.sexo = sexo;
    }

    public Integer getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(Integer estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    @Override
    public String toString() {
        return "Pessoa{" + "id=" + id + ", estadoCivil=" + estadoCivil + ", morada=" + morada + ", "
                + "sexo=" + sexo + ", primeiro nome=" + primeiroNome + ", ultimo nome="+ultimoNome+", numbi=" + numbi + ", dataNasc=" + dataNasc + ", "
                + "telefone=" + telefone + ", email=" + email + ", datacadastro=" + datacadastro + '}';
    }
    
    
    
}
