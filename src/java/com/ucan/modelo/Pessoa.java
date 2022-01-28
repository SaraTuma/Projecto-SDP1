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
    private String nome, numbi, telefone, email, datacadastro;
    private Date dataNasc;

    public Pessoa(String nome, String numbi, Date dataNasc, String telefone, String email, Integer sexo, Integer estadoCivil, Integer morada) {
        this.nome = nome;
        this.numbi = numbi;
        this.dataNasc = dataNasc;
        this.telefone = telefone;
        this.email = email;
        this.sexo = sexo;
        this.estadoCivil = estadoCivil;
        this.morada = morada;
    }

    public Pessoa() {
    }

    

    public Pessoa(Integer id, String nome, String numbi, 
            Date dataNasc, String telefone, 
            String email, Integer morada, Integer sexo, 
            Integer estadoCivil, String datacadastro) {
        this.id = id;
        this.nome = nome;
        this.numbi = numbi;
        this.dataNasc = dataNasc;
        this.telefone = telefone;
        this.email = email;
        this.datacadastro = datacadastro;
        this.sexo = sexo;
        this.estadoCivil = estadoCivil;
        this.morada = morada;
    }

   
    
    public String getDatacadastro() {
        return datacadastro;
    }

    public void setDatacadastro(String datacadastro) {
        this.datacadastro = datacadastro;
    }

    

   

    public Pessoa(Integer id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nomeCompleto) {
        this.nome = nomeCompleto;
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

    @Override
    public String toString() {
        return "Pessoa{" + "id=" + id + ", estadoCivil=" + estadoCivil + ", morada=" + morada + ", "
                + "sexo=" + sexo + ", nome=" + nome + ", numbi=" + numbi + ", dataNasc=" + dataNasc + ", "
                + "telefone=" + telefone + ", email=" + email + ", datacadastro=" + datacadastro + '}';
    }
    
    
    
}
