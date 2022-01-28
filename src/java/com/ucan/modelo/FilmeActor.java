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
public class FilmeActor {
    private Filme filme;
    private Actor actor;
    private String dataCadastro;

    public FilmeActor(Filme filme, Actor actor) {
        this.filme = filme;
        this.actor = actor;
    }
    public FilmeActor(Filme filme, Actor actor, String dataCadastro) {
        this.filme = filme;
        this.actor = actor;
        this.dataCadastro = dataCadastro;
    }
    public Filme getFilme() {
        return filme;
    }

    public void setFilme(Filme filme) {
        this.filme = filme;
    }

    public Actor getActor() {
        return actor;
    }

    public void setActor(Actor actor) {
        this.actor = actor;
    }
    
    
}
