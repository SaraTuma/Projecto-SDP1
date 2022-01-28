/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.modelo;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author saratuma
 */
public class Actor {
    private Integer id, pessoa;
    private Timestamp dataCadastro;
    
    //alterar para fk_pessoa

    public Actor(Integer id, Integer pessoa, Timestamp dataCadastro) {
        this.id = id;
        this.pessoa = pessoa;
        this.dataCadastro = dataCadastro;
    }

    public Actor(Integer pessoa, Timestamp dataCadastro) {
        this.pessoa = pessoa;
        this.dataCadastro = dataCadastro;
    }

    public Integer getPessoa() {
        return pessoa;
    }

    public void setPessoa(Integer pessoa) {
        this.pessoa = pessoa;
    }

   
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Timestamp getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Timestamp dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
    
}
