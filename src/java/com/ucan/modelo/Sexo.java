/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.modelo;

/**
 *
 * @author saratuma
 */
public class Sexo {
    private Integer id;
    private String descricao;

    public Sexo(Integer id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
    
     public Sexo(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
}
