const express = require('express')
const bd = require('../data/bd-user')
const bdCursos = require('../data/bd-curso')

const router = express.Router()

router.use(express.json())

router.use((req, res, next) => {
    next()
})

router.get('/', (req, res) => {
    bdCursos.getCursos((err, result) => {
        if (err) throw err
        const cursos = result
        res.render('index.ejs', { cursos, user: req.session.user })
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
    const { email, username, password, confpass } = req.body

    if (!email || !username || !password) {
        res.redirect("/cadastro?error=error")
        return
    }
    if (password !== confpass) {
        res.redirect("/cadastro?error=error")
        return
    }
    bd.addUser({
        email_estudante: email,
        username_estudante: username,
        password_estudante: password
    }, (error) => {
        if (error) {
            res.redirect("/cadastro?error=error")
            return
        }
    })
    res.redirect("/login")
})

router.post("/login", (req, res) => {
    const { email, password } = req.body

    bd.getUser(email, password, (error, results) => {
        if (!results.length) {
            res.redirect("/login?error=error")
            return
        }
        req.session.user = {
            id: results[0].id_estudante,
            username: results[0].username_estudante,
            fotoPerfil: results[0].diretorio_foto_estudante
        }
        res.redirect(`/user/${req.session.user.username}`)
    })
})

module.exports = router