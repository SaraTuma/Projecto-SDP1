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
    
    
}
