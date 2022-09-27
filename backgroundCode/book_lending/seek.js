const sql = require("../connectdata.js")
const express = require("express");
const app = express();
const cors = require('cors');
// 解决跨域问题
app.use(cors())
// 允许urlencoded请求体类型参数
app.use(express.urlencoded({ extended: false }))
// 允许json请求体类型参数
app.use(express.json())

// rest模式
app.get("/lending/seek/all", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Book_Lending"

    sql.query(sqldata, (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
        // res.sendStatus(results)
    })
})

// 查
app.get("/lending/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Book_Lending where book_name=?"
    sql.query(sqldata, [req.query.book_name], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
        // res.sendStatus(results)

    })
})
// 增
app.post("/lending/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "INSERT INTO book_lending set?"

    sql.query(sqldata, [{ id: req.body.id, book_name: req.body.book_name, lending_person: req.body.lending_person, lending_date: req.body.lending_date }], (err, results) => {
        if (err) return res.send(err.message)
        // if (results.affectedRows !== 1) return res.send('增加失败,请重新加入一条数据')
        res.send(results)
        // res.sendStatus(results.affectedRows)

    })


})
// 改
app.put("/lending/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "update book_lending set?  where id=?"
    // [req.body.book_name, req.body.lending_person, req.body.lending_date, req.body.id]
    sql.query(sqldata, [req.body, req.body.id], (err, results) => {
        if (err) return res.send(err.stack)
        res.send(results)
        // res.sendStatus(results)

    })
    // res.send(req.body)

})
// 删除
app.delete("/lending/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "delete from book_lending where id=?"
    sql.query(sqldata, [req.body.id], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
        // res.sendStatus(results)
    })

})


// ----------------------------------------------back-------------------------------


// rest模式
app.get("/back/seek/all", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Book_Back"

    sql.query(sqldata, (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})
app.get("/back/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Book_Back where book_name=?"
    sql.query(sqldata, [req.query.book_name], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})
// 增
app.post("/back/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "INSERT INTO Book_Back set?"

    sql.query(sqldata, [{ id: req.body.id, book_name: req.body.book_name, back_person: req.body.back_person, back_date: req.body.back_date }], (err, results) => {
        if (err) return res.send(err.message)
        // if (results.affectedRows !== 1) return res.send('增加失败,请重新加入一条数据')
        // res.sendStatus(results.affectedRows)
        res.send(results)

    })


})
// 改
app.put("/back/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "update Book_Back set?  where id=?"
    // [req.body.book_name, req.body.lending_person, req.body.lending_date, req.body.id]
    sql.query(sqldata, [req.body, req.body.id], (err, results) => {
        if (err) return res.send(err.stack)
        res.send(results)

    })
    // res.send(req.body)

})
// 删除
app.delete("/back/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "delete from book_back where id=?"
    sql.query(sqldata, [req.body.id], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
    })

})


// -------------------------------------------------author--------------------------


// rest模式
app.get("/author/seek/all", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Author_Management"

    sql.query(sqldata, (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})

// 查2
app.get("/author/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Author_Management where book_name=?"
    sql.query(sqldata, [req.query.book_name], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})
// 增
app.post("/author/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "INSERT INTO Author_Management set?"
    sql.query(sqldata, [{ id: req.body.id, author_name: req.body.author_name, author_sex: req.body.author_sex, author_age: req.body.author_age, author_address: req.body.author_address, book_name: req.body.book_name }], (err, results) => {
        if (err) return res.send(err.message)
        // if (results.affectedRows !== 1) return res.send('增加失败,请重新加入一条数据')
        // res.sendStatus(results.affectedRows)
        res.send(results)

    })


})
// 改
app.put("/author/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "update Author_Management set?  where id=?"
    // [req.body.book_name, req.body.lending_person, req.body.lending_date, req.body.id]
    sql.query(sqldata, [req.body, req.body.id], (err, results) => {
        if (err) return res.send(err.stack)
        res.send(results)

    })
    // res.send(req.body)

})
// 删除
app.delete("/author/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "delete from Author_Management where id=?"
    sql.query(sqldata, [req.body.id], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
    })

})

// ------------------------------------------reader---------------------------
// rest模式
app.get("/reader/seek/all", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Reader_Management"

    sql.query(sqldata, (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})

// 查2
app.get("/reader/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "select * from Reader_Management where book_name=?"
    sql.query(sqldata, [req.query.book_name], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)

    })
})
// 增
app.post("/reader/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "INSERT INTO Reader_Management set?"
    sql.query(sqldata, [{ id: req.body.id, reader_name: req.body.reader_name, reader_nickname: req.body.reader_nickname, reader_sex: req.body.reader_sex, reader_age: req.body.reader_age, reader_address: req.body.reader_address, book_name: req.body.book_name, leading_name: req.body.leading_name, back_name: req.body.back_name }], (err, results) => {
        if (err) return res.send(err.message)
        // if (results.affectedRows !== 1) return res.send('增加失败,请重新加入一条数据')
        // res.sendStatus(results.affectedRows)
        res.send(results)

    })


})
// 改
app.put("/reader/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*")
    const sqldata = "update Reader_Management set?  where id=?"
    // [req.body.book_name, req.body.lending_person, req.body.lending_date, req.body.id]
    sql.query(sqldata, [req.body, req.body.id], (err, results) => {
        if (err) return res.send(err.stack)
        res.send(results)

    })
    // res.send(req.body)

})
// 删除
app.delete("/reader/seek", (req, res) => {
    res.setHeader("Access-Control-Allow-Origin", "*");
    const sqldata = "delete from Reader_Management where id=?"
    sql.query(sqldata, [req.body.id], (err, results) => {
        if (err) return res.send(err.message)
        res.send(results)
    })

})


app.listen(5050, (error) => {
    if (!error) console.log("success!http://127.0.0.1:5050/lending/seek/all")
})



