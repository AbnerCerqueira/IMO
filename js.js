//aquela bosta de form do bootstrap buga o botao ai fiz isso aqui so pra testar msm
function Entra(){
    window.open("cadastro.html")
}
function Entra2(){
    window.open("login.html")
}
function Banco(){
    if (localStorage.getItem("banco") === null) {
        const banco = [];
        localStorage.setItem("banco", JSON.stringify(banco));
    }
}

function Cadastro(){
    const banco = JSON.parse(localStorage.getItem("banco"))
    let user = document.querySelector("#user").value
    let pass = document.querySelector("#pass").value
    let conf_pass = document.querySelector("#conf-pass").value
    let dados = {user: user, pass: pass}
    if(pass == conf_pass){
        banco.push(dados)
        localStorage.setItem("banco", JSON.stringify(banco))
        window.location.href = "login.html"
    }
    else{
        alert("As senhas não são iguais!")
        window.location.reload()
    }
}

function Login(){
    const banco = JSON.parse(localStorage.getItem("banco"))
    let user = document.querySelector("#user").value
    let pass = document.querySelector("#pass").value

    let usuariologado = false

    for(i = 0; i < banco.length; i++){
        if(user == banco[i].user && pass == banco[i].pass){
            usuariologado = true
            sessionStorage.setItem("logado", JSON.stringify(banco))
            window.location.href="index.html"
            break;
        
        }
    }
    if(!usuariologado){
        alert("Usuário ou senha errados")
        window.location.reload()
    }
      
}
function Logado(){
    const banco = JSON.parse(sessionStorage.getItem("logado"))
    if(banco == null){
        null
    }
    else{
        document.querySelector("#informacoes").innerHTML = `
        <img src ="img/user.png" height="50px"></img>
        `
    }
}
function Desloga(){
    sessionStorage.removeItem("logado")
    window.location.replace("index.html")
}