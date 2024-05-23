const express = require('express')
const app = express()

app.set("views engine", "ejs")

app.use(express.static('public'))

app.get('/', (req, res) => {
    res.render('index.ejs')
})

app.get('/login', (req, res) => {
    res.render('login.ejs')
})

app.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs')
})

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`Iniciando servidor na port ${port}`)
})