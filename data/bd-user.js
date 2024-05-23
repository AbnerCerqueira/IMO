const con = require('./database')
  
  function getUser(email, senha, callback) {
    con.query('SELECT id, username FROM user WHERE email = ? AND senha = ?', [email, senha], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return
      }
      callback(null, results)
    })
  }
   
  function addUser(user, callback) {
    con.query('INSERT INTO user SET ?', user, (error, results, fields) => {
      if (error) {
        callback(error, null)
        return 
      }
      callback(null, results.insertId)
    })
  }
   
  function updateUser(id, user, callback) {
    con.query('UPDATE user SET ? WHERE id = ?', [user, id], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return  
      }
      callback(null, results.affectedRows)
    })
  }
   
  function deleteUser(id, callback) {
    con.query('DELETE FROM user WHERE id = ?', [id], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return  
      }
      callback(null, results.affectedRows)
    })
  }

  module.exports = {
    getUser,
    addUser,
    updateUser,
    deleteUser
  }