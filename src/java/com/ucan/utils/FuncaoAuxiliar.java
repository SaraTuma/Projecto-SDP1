/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.utils;

import com.ucan.modelo.Telefone;
import java.util.ArrayList;

/**
 *
 * @author saratuma
 */
public class FuncaoAuxiliar {
    
    public static boolean verificarChaveRepetida (ArrayList<Telefone> telefone, Integer id){
        for(Telefone tel : telefone){
            if(tel.getPessoa()==id)
                return true;
        }
        return false;
    }
    
    public static String verificarERetornarMes(int mes){
        String descricao=null;
        switch(mes){
            case 1: descricao="Janeiro"; break;
            case 2: descricao="Fevereiro"; break;
            case 3: descricao="Março"; break;
            case 4: descricao="Abril"; break;
            case 5: descricao="Maio"; break;
            case 6: descricao="Junho"; break;
            case 7: descricao="Julho"; break;
            case 8: descricao="Agosto"; break;
            case 9: descricao="Setembro"; break;
            case 10: descricao="Outubro"; break;
            case 11: descricao="Novembro"; break;
            case 12: descricao="Dezembro"; break;
            default: break;
        }
        return descricao;
    }
    
}
