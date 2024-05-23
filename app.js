const express = require('express')
const app = express()

app.set("views engine", "ejs")

app.use(express.static('public'))

const index = require('./routes/index')

app.use('/', index)

const port = process.env.PORT || 8080
app.listen(port, () => {
    console.log(`Iniciando servidor na port ${port}`)
})