const con = require('./database')
  
  function getUserByLoginPass(login, senha, callback) {
    connection.query('SELECT id, login FROM user WHERE login = ? AND senha = ?', [login, senha], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return
      }
      callback(null, results)
    })
  }
   
  function addUser(user, callback) {
    connection.query('INSERT INTO user SET ?', user, (error, results, fields) => {
      if (error) {
        callback(error, null)
        return 
      }
      callback(null, results.insertId)
    })
  }
   
  function updateUser(id, user, callback) {
    connection.query('UPDATE user SET ? WHERE id = ?', [user, id], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return  
      }
      callback(null, results.affectedRows)
    })
  }
   
  function deleteUser(id, callback) {
    connection.query('DELETE FROM user WHERE id = ?', [id], (error, results, fields) => {
      if (error) {
        callback(error, null)
        return  
      }
      callback(null, results.affectedRows)
    })
  }

  module.exports = {
    getUserByLoginPass,
    addUser,
    updateUser,
    deleteUser
  }