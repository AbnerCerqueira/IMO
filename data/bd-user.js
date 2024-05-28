const con = require('./database')

function addUser(user, callback) {
  const sql = 'INSERT INTO estudante SET ?'
  con.query(sql, user, (err, result) => {
    if (err) {
      callback(err, null)
      return
    }
    callback(null, result.insertId)
  })
}

function getUser(email, senha, callback) {
  const sql = 'SELECT id_estudante, username_estudante, diretorio_foto_estudante FROM estudante WHERE email_estudante = ? AND password_estudante = ?'
  con.query(sql, [email, senha], (err, result) => {
    if (err) {
      callback(err, null)
      return
    }
    callback(null, result)
  })
}

function updateUser(senha, id, callback) {
  const sql = 'UPDATE estudante SET ? WHERE id_estudante = ?'
  con.query(sql, [senha, id], (err, result) => {
    if (err) {
      callback(err, null)
      return 
    }
    callback(null, result)
  })
}

function addPhoto(file, id, callback) {
  const sql = 'UPDATE estudante SET ? WHERE id_estudante = ?'
  con.query(sql, [file, id], (err, result) => {
    if (err) {
      callback(err, null)
      return
    }
    callback(null, result)
  })
}


module.exports = {
  addUser,
  getUser,
  updateUser,
  addPhoto
}