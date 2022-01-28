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
public class Comuna {
    private Integer id;
    private String descricao;
    private Integer municipio;

    public Comuna(Integer id, String descricao, Integer municipio) {
        this.id = id;
        this.descricao = descricao;
        this.municipio = municipio;
    }

    public Comuna(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Integer municipio) {
        this.municipio = municipio;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    
}
