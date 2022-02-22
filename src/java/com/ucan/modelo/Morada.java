package com.ucan.modelo;

/**
 *
 * @author saratuma
 */
public class Morada {
    
    private Integer id, nCasa;
    private String bairro, rua;
    private Integer comuna;
    
    public Morada(Integer id, String bairro, String rua, Integer nCasa, Integer comuna) {
        this.id = id;
        this.nCasa = nCasa;
        this.bairro = bairro;
        this.rua = rua;
        this.comuna = comuna;
    }
    
    public Morada(String bairro, String rua, Integer nCasa, Integer comuna) {
        this.nCasa = nCasa;
        this.bairro = bairro;
        this.rua = rua;
        this.comuna = comuna;
    }

    
    public Morada(Integer id) {
        this.id = id;
    }
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public Integer getnCasa() {
        return nCasa;
    }

    public void setnCasa(Integer nCasa) {
        this.nCasa = nCasa;
    }

    public Integer getComuna() {
        return comuna;
    }

    public void setComuna(Integer comuna) {
        this.comuna = comuna;
    }

    @Override
    public String toString() {
        return "Morada{" + "id=" + id + ", nCasa=" + nCasa + ", bairro=" + bairro + ", rua=" + rua + ", comuna=" + comuna + '}';
    }
    
    
    
    
}
