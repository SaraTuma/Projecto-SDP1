/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.utils;

import com.ucan.dao.ActorDao;
import com.ucan.dao.CategoriaSocioDao;
import com.ucan.dao.EstadoCivilDao;
import com.ucan.dao.FilmeDao;
import com.ucan.dao.MoradaDao;
import com.ucan.dao.PessoaDao;
import com.ucan.dao.SexoDao;
import com.ucan.dao.SocioDao;
import java.sql.SQLException;
import java.util.ArrayList;
import com.ucan.modelo.Actor;
import com.ucan.modelo.CategoriaSocio;
import com.ucan.modelo.Filme;
import com.ucan.modelo.Morada;
import com.ucan.modelo.Pessoa;
import com.ucan.modelo.Sexo;
import com.ucan.modelo.Socio;

/**
 *
 * @author saratuma
 */
public class TesteFindAll {

    public static void pessoaFindAll() throws ClassNotFoundException, SQLException{
        PessoaDao dao = new PessoaDao();
        ArrayList<Pessoa> array;
        array = dao.findAll();
       
        for(Pessoa p : array){
            System.out.println("Pk: "+p.getId()+" descricao: "+p.getNomeCompleto()
            );
        }
    }
    
    public static void sexoFindAll() throws ClassNotFoundException, SQLException{
        SexoDao dao = new SexoDao();
        ArrayList<Sexo> array;
        array = dao.findAll();
       
        for(Sexo s : array){
            System.out.println("Pk: "+s.getId()+" descricao: "+s.getDescricao()
            );
        }
    }
    
    public static void actorFindAll() throws ClassNotFoundException, SQLException{
        ActorDao dao = new ActorDao();
        ArrayList<Actor> array;
        array = dao.findAll();
       // Vector v = new Vector();
        for(Actor actor : array){
//            System.out.println("Actor : "+actor.getId().getId()
           // );
        }
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
      // System.out.println(new MoradaDao().getID("Femeninoyyy"));
     /*Morada mo = new Morada("Bairro Kikolo","Rua 12",234,14);
      
        System.out.println(mo.toString());
        System.out.println(new MoradaDao().findOne(mo));
       */
      //  System.out.println(new EstadoCivilDao().getID("Solteiro/a"));
      
      /*  Pessoa pessoa = new Pessoa("Luela Maria","0002799HA610", TratamentoDeDatas.converterDataNormalParaDataSQL("23-07-2000"),"945234567","luelamaria@gmail.com",1,2,45);
        if(new PessoaDao().insert(pessoa))
            
            System.out.println("adicionado com sucesso");
        else
            System.out.println("ERRO");
      */
      /*
      ArrayList<Socio> socios = new SocioDao().findAll();
      for(Socio socio : socios) {
          System.out.println(""+socio.toString());
        }*/
      /*
        Morada mo = new Morada(18,"500 Casas","Rua do Popalá", 10,42);
        if(new MoradaDao().update(mo)){
            System.out.println("Actualizou");
            System.out.println(new MoradaDao().findById(18));
        }
        else
            System.out.println("Erro ao actualizar");
         */
      /*
      Integer cate = new CategoriaSocioDao().getId("Efectivo");
      String categ = new CategoriaSocioDao().getDescricao(3);
        System.out.println("Id : "+cate+" decricao: "+categ);
      */
      
      String estadoCivil = new EstadoCivilDao().getDescricao(1);
        System.out.println("EStado: "+estadoCivil);
      
      /*ArrayList<Pessoa> pessoas = new PessoaDao().findAllNames();
      for(Pessoa pessoa : pessoas) {
          System.out.println(""+pessoa.toString());
        }*/
    }

    
}
