package com.ucan.modelo;

/**
 *
 * @author saratuma
 */
public class Email {
    
    private Integer id, fk_pessoa;
    private String descricao;

    public Email(Integer id, Integer pessoa, String descricao) {
        this.id = id;
        this.fk_pessoa = pessoa;
        this.descricao = descricao;
    }

    public Email(Integer pessoa, String descricao) {
        this.fk_pessoa = pessoa;
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

    public Integer getFk_pessoa() {
        return fk_pessoa;
    }

    public void setFk_pessoa(Integer fk_pessoa) {
        this.fk_pessoa = fk_pessoa;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }
    
    
    
}
