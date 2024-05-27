const con = require('./database')

function addUser(user, callback) {
  const sql = 'INSERT INTO estudante SET ?'
  con.query(sql, user, (error, results, fields) => {
    if (error) {
      callback(error, null)
      return
    }
    callback(null, results.insertId)
  })
}

function getUser(email, senha, callback) {
  const sql = 'SELECT id_estudante, username_estudante FROM estudante WHERE email_estudante = ? AND password_estudante = ?'
  con.query(sql, [email, senha], (error, results, fields) => {
    if (error) {
      callback(error, null)
      return
    }
    callback(null, results)
  })
}



module.exports = {
  addUser,
  getUser
}