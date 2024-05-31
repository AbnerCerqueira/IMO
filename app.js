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

// app.use((err, req, res, next) => {
//     res.status(500).send('Erro interno no servidor')
// })

const index = require('./routes/routes-index')
const user = require('./routes/routes-user')
const biblioteca = require('./routes/routes-curso')

app.use('/', index)
app.use('/user', user)
app.use('/library', biblioteca)

app.use((req, res, next) => {
    res.status(404).redirect('/error404.html')
})

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`Iniciando servidor na port ${port}`)
})