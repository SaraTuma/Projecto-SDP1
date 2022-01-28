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
public class Alugar {
    private Integer id;
    private String dataAlugar, dataDevolucao, dataCadastro;
    private Socio socio;
    private Filme filme;

    public Alugar(Integer id, String dataAlugar, String dataDevolucao, Socio socio, 
            Filme filme, String dataCadastro) {
        this.id = id;
        this.dataAlugar = dataAlugar;
        this.dataDevolucao = dataDevolucao;
        this.socio = socio;
        this.filme = filme;
        this.dataCadastro = dataCadastro;
    }

    public Alugar(String dataAlugar, String dataDevolucao, Socio socio, Filme filme) {
        this.dataAlugar = dataAlugar;
        this.dataDevolucao = dataDevolucao;
        this.socio = socio;
        this.filme = filme;
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDataAlugar() {
        return dataAlugar;
    }

    public void setDataAlugar(String dataAlugar) {
        this.dataAlugar = dataAlugar;
    }

    public String getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(String dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    
    public Socio getSocio() {
        return socio;
    }

    public void setSocio(Socio socio) {
        this.socio = socio;
    }

    public Filme getFilme() {
        return filme;
    }

    public void setFilme(Filme filme) {
        this.filme = filme;
    }
    
    
    
}
