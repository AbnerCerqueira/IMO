verificar = 0
function teste(){
    botao = document.getElementById('teste')

    if (verificar == 0) {
        botao.src = '/img/headerlogoazul.svg'
        verificar = 1
        
    } else {
        botao.src = '/img/headerlogoinicial.svg'
        verificar = 0
    }
} 