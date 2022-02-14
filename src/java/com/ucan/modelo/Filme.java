/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.modelo;

import java.sql.Date;
import java.sql.Time;

/**
 *
 * @author saratuma
 */
public class Filme {
    private Integer id, anoPublicado, genero, classificacao, realizador;
    private String tituloPort, tituloOrig, sinopse;
    private Date dataCadastro;
    private Time duracao;

    public Filme(String tituloPort, String tituloOrig, String sinopse, 
            Time duracao, Integer realizador, Integer classificacao, 
            Integer genero, Integer anoPublicado) {
        this.tituloPort = tituloPort;
        this.tituloOrig = tituloOrig;
        this.sinopse = sinopse;
        this.duracao = duracao;
        this.realizador = realizador;
        this.classificacao = classificacao;
        this.genero = genero;
        this.anoPublicado = anoPublicado;
    }

    public Filme(Integer id, String tituloPort, String tituloOrig, String sinopse, 
             Time duracao, Integer realizador, 
            Integer classificacao, Integer genero,Date dataCadastro, Integer anoPublicado) {
        this.id = id;
        this.tituloPort = tituloPort;
        this.tituloOrig = tituloOrig;
        this.sinopse = sinopse;
        this.dataCadastro = dataCadastro;
        this.duracao = duracao;
        this.realizador = realizador;
        this.classificacao = classificacao;
        this.genero = genero;
        this.anoPublicado=anoPublicado;
    }

    public Integer getAnoPublicado() {
        return anoPublicado;
    }

    public void setAnoPublicado(Integer anoPublicado) {
        this.anoPublicado = anoPublicado;
    }
    
    public Date getDataCadastro() {
        return dataCadastro;
    }

    public void setDataCadastro(Date dataCadastro) {
        this.dataCadastro = dataCadastro;
    }
    
    

    public String getTituloPort() {
        return tituloPort;
    }

    public void setTituloPort(String tituloPort) {
        this.tituloPort = tituloPort;
    }

    public String getTituloOrig() {
        return tituloOrig;
    }

    public void setTituloOrig(String tituloOrig) {
        this.tituloOrig = tituloOrig;
    }

    public String getSinopse() {
        return sinopse;
    }

    public void setSinopse(String sinopse) {
        this.sinopse = sinopse;
    }

    public Time getDuracao() {
        return duracao;
    }

    public void setDuracao(Time duracao) {
        this.duracao = duracao;
    }

    public Integer getRealizador() {
        return realizador;
    }

    public void setRealizador(Integer realizador) {
        this.realizador = realizador;
    }

    public Integer getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(Integer classificacao) {
        this.classificacao = classificacao;
    }

    public Integer getGenero() {
        return genero;
    }

    public void setGenero(Integer genero) {
        this.genero = genero;
    }
    
    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Filme{" + "id=" + id + ", anoPublicado=" + anoPublicado + ", tituloPort=" + tituloPort + ", tituloOrig=" + tituloOrig + ", sinopse=" + sinopse + ", dataCadastro=" + dataCadastro + ", realizador=" + realizador + ", duracao=" + duracao + ", classificacao=" + classificacao + ", genero=" + genero + '}';
    }

    
    
}
