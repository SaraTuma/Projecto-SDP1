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
public class Auxiliar {
    
    private String primeiroNome, ultimoNome, descricao, nomeCompleto;
    private Integer pessoa, telefone, email, actor, alugar, categoriaSocio, classificacao, comuna, estadoCivil, filme, filmeActor, genero, morada, municipio
            , provincia, realizador, sexo, socio;

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    
    
    public String getPrimeiroNome() {
        return primeiroNome;
    }

    public void setPrimeiroNome(String primeiroNome) {
        this.nomeCompleto=primeiroNome+" ";
        this.primeiroNome = primeiroNome;
    }

    public String getUltimoNome() {
        return ultimoNome;
    }

    public void setUltimoNome(String ultimoNome) {
        this.ultimoNome = ultimoNome;
        this.nomeCompleto+=ultimoNome;
    }

    public Integer getPessoa() {
        return pessoa;
    }

    public void setPessoa(Integer pessoa) {
        this.pessoa = pessoa;
    }

    public Integer getTelefone() {
        return telefone;
    }

    public void setTelefone(Integer telefone) {
        this.telefone = telefone;
    }

    public Integer getEmail() {
        return email;
    }

    public void setEmail(Integer email) {
        this.email = email;
    }

    public Integer getActor() {
        return actor;
    }

    public void setActor(Integer actor) {
        this.actor = actor;
    }

    public Integer getAlugar() {
        return alugar;
    }

    public void setAlugar(Integer alugar) {
        this.alugar = alugar;
    }

    public Integer getCategoriaSocio() {
        return categoriaSocio;
    }

    public void setCategoriaSocio(Integer categoriaSocio) {
        this.categoriaSocio = categoriaSocio;
    }

    public Integer getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(Integer classificacao) {
        this.classificacao = classificacao;
    }

    public Integer getComuna() {
        return comuna;
    }

    public void setComuna(Integer comuna) {
        this.comuna = comuna;
    }

    public Integer getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(Integer estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public Integer getFilme() {
        return filme;
    }

    public void setFilme(Integer filme) {
        this.filme = filme;
    }

    public Integer getFilmeActor() {
        return filmeActor;
    }

    public void setFilmeActor(Integer filmeActor) {
        this.filmeActor = filmeActor;
    }

    public Integer getGenero() {
        return genero;
    }

    public void setGenero(Integer genero) {
        this.genero = genero;
    }

    public Integer getMorada() {
        return morada;
    }

    public void setMorada(Integer morada) {
        this.morada = morada;
    }

    public Integer getMunicipio() {
        return municipio;
    }

    public void setMunicipio(Integer municipio) {
        this.municipio = municipio;
    }

    public Integer getProvincia() {
        return provincia;
    }

    public void setProvincia(Integer provincia) {
        this.provincia = provincia;
    }

    public Integer getRealizador() {
        return realizador;
    }

    public void setRealizador(Integer realizador) {
        this.realizador = realizador;
    }

    public Integer getSexo() {
        return sexo;
    }

    public void setSexo(Integer sexo) {
        this.sexo = sexo;
    }

    public Integer getSocio() {
        return socio;
    }

    public void setSocio(Integer socio) {
        this.socio = socio;
    }
    
    
    
    
}
