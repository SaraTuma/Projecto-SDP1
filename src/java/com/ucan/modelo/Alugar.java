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
    private Integer id, socio, filme;
    private Date dataAlugar, dataDevolucao, dataCadastro;

    public Alugar(Integer id, Date dataAlugar, Date dataDevolucao, Integer socio, 
            Integer filme, Date dataCadastro) {
        this.id = id;
        this.dataAlugar = dataAlugar;
        this.dataDevolucao = dataDevolucao;
        this.socio = socio;
        this.filme = filme;
        this.dataCadastro = dataCadastro;
    }

    public Alugar(Date dataAlugar, Date dataDevolucao, Integer socio, Integer filme) {
        this.dataAlugar = dataAlugar;
        this.dataDevolucao = dataDevolucao;
        this.socio = socio;
        this.filme = filme;
    }

    public Alugar(Date dataAlugar, Date dataDevolucao,Integer socio, Integer filme, Date dataCadastro) {
        this.socio = socio;
        this.filme = filme;
        this.dataAlugar = dataAlugar;
        this.dataDevolucao = dataDevolucao;
        this.dataCadastro = dataCadastro;
    }
    
    

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getDataAlugar() {
        return dataAlugar;
    }

    public void setDataAlugar(Date dataAlugar) {
        this.dataAlugar = dataAlugar;
    }

    public Date getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(Date dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    
    public Integer getSocio() {
        return socio;
    }

    public void setSocio(Integer socio) {
        this.socio = socio;
    }

    public Integer getFilme() {
        return filme;
    }

    public void setFilme(Integer filme) {
        this.filme = filme;
    }
    
    
    
}
