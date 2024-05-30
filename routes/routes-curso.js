const express = require('express')
const bdCurso = require('../data/bd-curso')

const router = express.Router()

router.use((req, res, next) => {
    next()
})

router.get('/:curso', (req, res) => {
    const { curso } = req.params
    cursoAulas(curso, (aulas) => {
        // console.log(aulas)
        try {
            res.redirect(`/library/${aulas[0].nome_curso}/${aulas[0].id_aula}`)
        } catch (err) {
            console.log(err)
            res.send('curso nao existe')
        }
    })

})

router.get('/:curso/:aula', (req, res) => {
    const { curso } = req.params
    cursoAulas(curso, (aulas) => {
        // console.log(aulas)
        res.render('aula.ejs', { aulas })
    })
})

function cursoAulas(curso, callback) {
    curso = curso.replace(/-/g, ' ').toLowerCase() // trocar os hifens da url por espaço, serve pra fazer a cosulta com o nome correto
    // console.log(curso)

    bdCurso.getAula(curso, (err, result) => {
        if (err) throw err

        const aulas = result
        for (let i = 0; i < aulas.length; i++) {
            aulas[i].nome_curso = aulas[i].nome_curso.replace(/\s+/g, '-').toLowerCase() // pegar os espaço em branco e tranformar em hífen
            aulas[i].nome_aula = aulas[i].nome_aula.replace(/\s+/g, '-').toLowerCase() // pegar os espaço em branco e tranformar em hífen
        }
        callback(aulas)
    })
}

module.exports = router