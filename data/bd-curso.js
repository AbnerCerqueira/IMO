const con = require('./database')

function getAula(nome_curso, callback) {
    const sql = 'CALL pr_return_aulas_curso( ? );'
    con.query(sql, nome_curso, (err, result) => {
        if (err) {
            callback(err, null)
            return
        }
        callback(null, result)
    })
}

function getCursosUser(id_estudante, callback) {
    const sql = 'CALL pr_return_estudante_cursos( ? )'
    con.query(sql, id_estudante, (err, result) => {
        if (err) {
            callback(err, null)
            return
        }
        callback(null, result)
    })
}

function getCursos(callback) {
    const sql = 'SELECT * FROM curso'
    con.query(sql, (err, result) => {
        if (err) {
            callback(err, null)
            return
        }
        callback(null, result)
    })
}

module.exports = {
    getAula,
    getCursos,
    getCursosUser
}