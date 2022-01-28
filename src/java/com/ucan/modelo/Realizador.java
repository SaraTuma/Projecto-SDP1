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
class Realizador {
    private Integer id;
    private Pessoa pessoa;
    private String dataCadastro;

    public Realizador(Integer id, Pessoa pessoa, String dataCadastro) {
        this.id = id;
        this.pessoa = pessoa;
        this.dataCadastro = dataCadastro;
    }

    public Realizador(Pessoa pessoa) {
        this.pessoa = pessoa;
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(String dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
    
}
