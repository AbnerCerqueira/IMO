const mysql = require('mysql2')
const dotenv = require('dotenv')

dotenv.config()

const con = mysql.createConnection({
    port: process.env.MYSQL_PORT || '3306',
    host: process.env.MYSQL_HOST || 'localhost',
    user: process.env.MYSQL_USER || 'root',
    password: process.env.MYSQL_PASSWORD || '',
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