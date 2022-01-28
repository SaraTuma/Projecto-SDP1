/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function mostrarSeccaoVisualizar(){
    let seccao1, seccao2, seccao3, seccao4;
    seccao1 =  document.getElementById("seccao-1");
    seccao2 =  document.getElementById("seccao-2");
    seccao3 =  document.getElementById("seccao-3");
    seccao4 =  document.getElementById("seccao-4");
    seccao1.style.display='block';
    seccao2.style.display='none';
    seccao3.style.display='none';
    seccao4.style.display='none';
    console.log('ola');
    
}

function mostrarSeccaoCadastrar(){
    let seccao1, seccao2, seccao3, seccao4;
    seccao1 =  document.getElementById("seccao-1");
    seccao2 =  document.getElementById("seccao-2");
    seccao3 =  document.getElementById("seccao-3");
    seccao4 =  document.getElementById("seccao-4");
    seccao1.style.display='none';
    seccao2.style.display='block';
    seccao3.style.display='none';
    seccao4.style.display='none';
}
