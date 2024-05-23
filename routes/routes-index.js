const express = require('express')
const bd = require('../data/bd-user')

const router = express.Router()

router.use(express.json())

router.use((req, res, next) => {
    next()
})

router.get('/', (req, res) => {
    res.render('index.ejs')
})

router.get('/configurar-conta', (req, res) => {
    res.render('configurar-conta.ejs', {
        error: req.query.error
    })
})
router.get('/login', (req, res) => {
    res.render('login.ejs', {
        error: req.query.error
    })
})

router.get('/cadastro', (req, res) => {
    res.render('cadastro.ejs', {
        error: req.query.error
    })
})

// POST
router.post("/cadastro", (req, res) => {
    const dadosFornecidos = req.body
    
    if (!dadosFornecidos.email || !dadosFornecidos.password) {
        res.redirect("/cadastro?error=error")
        return
    }
    if (dadosFornecidos.password !== dadosFornecidos.confpass) {
        res.redirect("/cadastro?error=error")
        return
    }
    bd.addUser(dadosFornecidos, (error) => {
        if (error) {
            res.redirect("/cadastro?error=error")
            return
        }
    })
    res.redirect("/login")
})

router.post("/login", (req, res) => {
    const dadosFornecidos = req.body
    
    bd.getUser(dadosFornecidos.email, dadosFornecidos.senha, (error, results) => {
        if (error || !results.length) {
            res.redirect("/login?error=error")
            return
        }
        req.session.user = {
            id: results.id,
            login: results[0].login
        }
        res.redirect(`/user/${req.session.user.login}`)
    })
})

module.exports = router