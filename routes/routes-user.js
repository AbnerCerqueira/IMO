const express = require('express')
const multer = require('multer')
const bd = require('../data/bd-user')
const bdCursos = require('../data/bd-curso')
const storage = require('../middlewares/multer')

const router = express.Router()

router.use((req, res, next) => {
    next()
})

router.use('*', (req, res, next) => {
    if (!req.session.user) {
        res.redirect('/login')
        return
    }
    next()
})

router.get('/:username', (req, res) => {
    bdCursos.getCursosUser(req.session.user.id, (err, result) => {
        if (err) throw err

        const [cursos] = result
        // console.log(cursos)
        res.render('meus-cursos.ejs', { cursos, user: req.session.user })
    }) 
})


router.get('/:username/configurar-conta', (req, res) => {
    res.render('configurar-conta.ejs', {
        user: req.session.user,
        error: req.query.error
    })
})

router.post('/:username/configurar-conta/atualizar', (req, res) => {
    const { username, newpass, confpass} = req.body

    if (newpass !== confpass) {
        res.redirect(`/user/${req.session.user.username}/configurar-conta?error=error`)
        return
    }

    bd.updateUser({
        username_estudante: username,
        password_estudante: newpass
    }, req.session.user.id,
    (err) => {
        if (err) {
            res.redirect(`/user/${req.session.user.username}/configurar-conta?error=error`)
            return
        }
    })
    req.session.user.username = username
    res.redirect(req.get('referer'))
})

const upload = multer({ storage })

router.post('/:username/configurar-conta/foto-perfil', upload.single('file'),  (req, res) => {
    let fotoPerfil = req.file?.path.substring(6)
    
    fotoPerfil = fotoPerfil.replace(/\\/g, ('/'))
    

    bd.addPhoto({
        diretorio_foto_estudante: fotoPerfil
    },
    req.session.user.id,
    (err) => {
        if (err) {
            console.log(err)
            return
        }
    })
    req.session.user = { ...req.session.user, fotoPerfil: fotoPerfil}
    res.redirect(req.get('referer'))
})

router.post('/addCurso', (req, res) => {
    const { id } = req.session.user
    const { id_curso, diretorio_aulas } = req.body
    bd.addCurso(id, id_curso, (err, result) => {
        if (err)throw err
        res.redirect(diretorio_aulas)
    })
})

module.exports = router