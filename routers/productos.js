import { Router } from "express";
import mysql from "mysql2";
const appProductos = Router();
let con = undefined;

// conexion a base de datos
appProductos.use((req, res, next)=>{
    try {
        con = mysql.createPool({
            host: "127.0.0.1",
            // user: "campus",
            // password: "campus2023",
             user: "root",
             password: "123456",
            database: "db_prueba_backend_sql",
            port: 3306
    });
    next();        
    } catch (error) {
        res.status(500).send('Conexion pailas papá, funado de la red :(')
    }
})

appProductos.post("/", (req, res) => {
    con.query(
        /*sql*/ `INSERT INTO productos SET ?`,
        req.body,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            data.affectedRows+=200;
            let result = req.body;
            result.id= data.insertId;
            res.status(data.affectedRows).send(result);
        }
    );

})

appProductos.get("/", (req, res) => {
    con.query(
        /*sql*/ `SELECT * FROM productos`,
        req.body,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appProductos.put("/:id", (req, res) => {
    con.query(
        /*sql*/ `UPDATE productos SET ? WHERE id= ?`,
        [req.body, req.params.id],
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appProductos.delete("/:id", (req, res) => {
    con.query(
        /*sql*/ `DELETE FROM productos WHERE id= ?`,
        req.params.id,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})



export default appProductos;