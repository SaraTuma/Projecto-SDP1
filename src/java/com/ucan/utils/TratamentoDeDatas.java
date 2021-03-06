/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucan.utils;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author saratuma
 * Dta    : 16 -01 - 2022
 * Objectivo : Tratar os dados do tipo normal a serem a aceitos no formato sql 
 */
public class TratamentoDeDatas 
{           
    public static Date converterDataNormalParaDataSQL(String dataFormatoNormal)
    {
        java.sql.Date sqlDate = null; 
          
        try
        {
               SimpleDateFormat d= new SimpleDateFormat("yyy-MM-dd");
               java.util.Date dt=d.parse(dataFormatoNormal);
               sqlDate = new java.sql.Date(dt.getTime());
        } catch (ParseException ex) 
        {
            Logger.getLogger(TratamentoDeDatas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sqlDate;
    }
    
    public static Time converterTempoParaTimeSQL(String duracao) {
	DateFormat formato = new SimpleDateFormat("HH:mm:ss");
        Time tempo=null;
	
        try {
            tempo = new java.sql.Time(formato.parse(duracao).getTime());
        } catch (ParseException ex) {
            Logger.getLogger(TratamentoDeDatas.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tempo;
	
    }
}
