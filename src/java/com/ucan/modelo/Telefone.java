package com.ucan.modelo;

/**
 *
 * @author saratuma
 */
public class Telefone {
    
    private Integer id, pessoa;
    private String descricao;

    public Telefone(Integer id, String descricao, Integer pessoa) {
        this.id = id;
        this.pessoa = pessoa;
        this.descricao = descricao;
    }

    public Telefone(Integer pessoa, String descricao) {
        this.pessoa = pessoa;
        this.descricao = descricao;
    }

    public Telefone() {
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

    @Override
    public String toString() {
        return "Telefone{" + "id=" + id + ", pessoa=" + pessoa + ", descricao=" + descricao + '}';
    }
    
    
    
}
