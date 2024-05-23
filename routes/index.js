const express = require('express')
const bd = require('../data/user')

const router = express.Router()

router.use((req, res, next) => {
    next()
})

router.get('/', (req, res) => {
    res.render('index.ejs')
})

router.get('/login', (req, res) => {
    res.render('login.ejs')
})

router.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs')
})

module.exports = router