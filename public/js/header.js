verificar = 0
function teste(){
    botao = document.getElementById('teste')

    if (verificar == 0) {
        botao.src = '/img/header/headerlogoazul.svg'
        verificar = 1
        
    } else {
        botao.src = '/img/header/headerlogoinicial.svg'
        verificar = 0
    }
} 