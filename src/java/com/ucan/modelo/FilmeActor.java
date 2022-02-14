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
public class FilmeActor {
    private Integer filme, actor;
    private Date dataCadastro;

    public FilmeActor(Integer filme, Integer actor) {
        this.filme = filme;
        this.actor = actor;
    }

    public FilmeActor(Integer filme, Integer actor, Date dataCadastro) {
        this.filme = filme;
        this.actor = actor;
        this.dataCadastro = dataCadastro;
    }

    public Integer getFilme() {
        return filme;
    }

    public void setFilme(Integer filme) {
        this.filme = filme;
    }

    public Integer getActor() {
        return actor;
    }

    public void setActor(Integer actor) {
        this.actor = actor;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    
    
    
}
