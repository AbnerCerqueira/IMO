const express = require('express')
const session = require('express-session')
const app = express()

app.set("views engine", "ejs")

app.use(express.urlencoded({ extended: true}))
app.use(express.static('public'))
app.use(session({
    secret: 'fçlsakjfdçlksajdfçlksdj',
    resave: false,
    saveUninitialized: false
}))

// app.use(function(req, res, next) {
//     res.status(404).redirect('/error404.html') // Redireciona para a página desejada
// })

const index = require('./routes/routes-index')
const user = require('./routes/routes-user')

app.use('/', index)
app.use('/user', user)

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`Iniciando servidor na port ${port}`)
})