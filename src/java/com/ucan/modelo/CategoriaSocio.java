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
public class CategoriaSocio {
    private Integer id;
    private String descricao;

    public CategoriaSocio(Integer id, String descricao) {
        this.id = id;
        this.descricao = descricao;
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

    @Override
    public String toString() {
        return "CategoriaSocio{" + "id=" + id + ", descricao=" + descricao + '}';
    }
    
    
    
}