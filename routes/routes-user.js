const express = require('express')

const router = express.Router()

router.use((req, res, next) => {
    next()
})

router.get('/:username/configurar-conta', (req, res) => {
    if (!req.session.user) {
        res.send("Faça login para acesar a pagina")
    }
    res.render('configurar-conta.ejs', {
        username: req.session.user.username
    })
})

module.exports = router