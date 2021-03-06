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
public class Socio {
    private Integer id, pessoa, categoria;
    private Date dataCadastro;

    public Socio(Integer id, Integer pessoa, Integer categoria, Date dataCadastro) {
        this.id = id;
        this.pessoa = pessoa;
        this.categoria = categoria;
        this.dataCadastro = dataCadastro;
    }

    public Socio(Integer pessoa, Integer categoria, Date dataCadastro) {
        this.pessoa = pessoa;
        this.categoria = categoria;
        this.dataCadastro = dataCadastro;
    }

    public Socio(Integer pessoa, Integer categoria) {
        this.pessoa = pessoa;
        this.categoria = categoria;
    }

    public Socio() {
     
    }
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPessoa() {
        return pessoa;
    }

    public void setPessoa(Integer pessoa) {
        this.pessoa = pessoa;
    }

    public Integer getCategoria() {
        return categoria;
    }

    public void setCategoria(Integer categoria) {
        this.categoria = categoria;
    }

    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }

    @Override
    public String toString() {
        return "Socio{" + "id=" + id + ", pessoa=" + pessoa + ", categoria=" + categoria + ", dataCadastro=" + dataCadastro + '}';
    }

   

   
    
}
