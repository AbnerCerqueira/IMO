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

const index = require('./routes/routes-index')

app.use('/', index)

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`Iniciando servidor na port ${port}`)
})