package com.ucan.modelo;

/**
 *
 * @author saratuma
 */
public class Email {
    
    private Integer id, pessoa;
    private String descricao;

    public Email(Integer id, String descricao, Integer pessoa) {
        this.id = id;
        this.pessoa = pessoa;
        this.descricao = descricao;
    }

    public Email(Integer pessoa, String descricao) {
        this.pessoa = pessoa;
        this.descricao = descricao;
    }

    public Email() {
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

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
    
}
