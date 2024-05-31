const express = require('express')
const bdCurso = require('../data/bd-curso')

const router = express.Router()


router.use((req, res, next) => {
    next()
})

router.get('/', (req, res) => {
    bdCurso.getCursos((err, result) => {
        if (err) throw err
        const cursos = result
        res.render('teste-biblioteca.ejs', { cursos })
    })
})

router.use('/*', (req, res, next) => {
    if (!req.session.user) {
        res.redirect('/login')
        return
    }
    next()
})

router.get('/:categoria/:curso', (req, res) => {
    const { curso } = req.params
    const { aula } = req.query
    
    cursoAulas(curso, (aulas) => {

        if(!aula ){ // redirecionar pra primeira aula se n tiver nada na url
            try {
                res.redirect(`/library/${aulas[0].categoria_curso}/${aulas[0].nome_curso}?aula=${aulas[0].nome_aula}`)
            } catch (err) {
                console.log(err)
                res.status(404).redirect('/error404.html')
            }
        }

        // console.log(aulas)
        const atual = aulas.findIndex(
            aulaVideo => aulaVideo.nome_aula == aula
        )
        res.render('aula.ejs', { aulas, atual, user: req.session.user })
    })
})

function cursoAulas(curso, callback) {
    curso = curso.replace(/-/g, ' ').toLowerCase() // trocar os hifens da url por espaço, serve pra fazer a cosulta com o nome correto
    // console.log(curso)

    bdCurso.getAula(curso, (err, result) => {
        if (err) throw err

        const [aulas] = result // desconstruct no array retornado da procedure
        for (let i = 0; i < aulas.length; i++) {
            aulas[i].categoria_curso = aulas[i].categoria_curso.replace(/\s+/g, '-').toLowerCase() // pegar os espaço em branco e tranformar em hífen
            aulas[i].nome_curso = aulas[i].nome_curso.replace(/\s+/g, '-').toLowerCase() // pegar os espaço em branco e tranformar em hífen
            // aulas[i].nome_aula = aulas[i].nome_aula.replace(/\s+/g, '-').toLowerCase() // pegar os espaço em branco e tranformar em hífen
            aulas[i].link_aula = aulas[i].link_aula.replace("watch?v=", "embed/")
            aulas[i].link_aula = aulas[i].link_aula.replace(/&/g, "")
        }
        callback(aulas)
    })
}

module.exports = router