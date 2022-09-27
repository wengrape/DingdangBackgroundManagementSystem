const mysql = require("mysql");
const sql = mysql.createConnection({
    host: "127.0.0.1",
    user: "root",
    password: "admin123",
    database: "bookdata"
})

// const sqldata = "select * from Book_Classification"
// sql.query(sqldata, (err, results) => {

//     if (err) return console.log(err.message)
//     console.log(results)
// })

module.exports = sql

