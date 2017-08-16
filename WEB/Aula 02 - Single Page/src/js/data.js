var dataValida = document.querySelector('#data_valida')

dataValida.textContent = dataAtualFormatada()


function dataAtualFormatada(){
    var data = new Date();
    var dia = data.getDate()+1;
    if (dia.toString().length == 1)
      dia = "0"+dia;
    var mes = data.getMonth()+1;
    if (mes.toString().length == 1)
      mes = "0"+mes;
    var ano = data.getFullYear();  
    return dia+"/"+mes+"/"+ano;
}