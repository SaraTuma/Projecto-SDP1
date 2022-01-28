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
public class Municipio {
    private Integer id;
    private String descricao;
    private Integer provincia;

    public Municipio(Integer id, String descricao, Integer provincia) {
        this.id = id;
        this.descricao = descricao;
        this.provincia = provincia;
    }

    public Municipio(Integer id, String descricao) {
        this.id = id;
        this.descricao = descricao;
    }
    

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProvincia() {
        return provincia;
    }

    public void setProvincia(Integer provincia) {
        this.provincia = provincia;
    }

    
    
    
}
