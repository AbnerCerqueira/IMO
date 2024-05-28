const mysql = require('mysql2')
const dotenv = require('dotenv')

dotenv.config()

const con = mysql.createConnection({
    host: process.env.MYSQL_HOST || 'localhost',
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || '1',
    database: process.env.MYSQL_DATABASE || 'imo'
})

con.connect((err) => {
    if (err) {
        console.log('Erro ao conectar com o banco\n' + err)
        return
    }
    console.log('Conectado ao banco de dados')
})

module.exports = con