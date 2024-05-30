const con = require('./database')

function getAula(nome_curso, callback) {
    const sql = `
    SELECT a.id_aula, a.nome_aula, c.nome_curso FROM aulas a
    INNER JOIN aulas_curso ac ON (a.id_aula = ac.id_aula)
    INNER JOIN curso c ON (ac.id_curso = c.id_curso)
    WHERE a.status = 1 AND c.status = 1 AND c.nome_curso = ?;
    `
    con.query(sql, nome_curso, (err, result) => {
        if (err) {
            callback(err, null)
            return
        }
        callback(null, result)
    })
}

module.exports = {
    getAula
}