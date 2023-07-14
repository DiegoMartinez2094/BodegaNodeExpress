import { Router } from "express";
import mysql from "mysql2";
const appInventarios = Router();
let con = undefined;

// conexion a base de datos
appInventarios.use((req, res, next)=>{
    try {
        con = mysql.createPool({
            host: "127.0.0.1",
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

appInventarios.post("/", (req, res) => { 
    // endpoint para ingresar productos a la tabla de inventarios
    //  "id_bodega":
    // "id_producto":
    // "cantidad":
    con.query(
        /*sql*/ `INSERT INTO inventarios SET ?`,
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

appInventarios.get("/", (req, res) => {
    con.query(
        /*sql*/ `SELECT * FROM inventarios order by cantidad desc`,
        req.body,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appInventarios.put("/:id", (req, res) => {
    con.query(
        /*sql*/ `UPDATE inventarios SET ? WHERE id= ?`,
        [req.body, req.params.id],
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appInventarios.delete("/:id", (req, res) => {
    con.query(
        /*sql*/ `DELETE FROM inventarios WHERE id= ?`,
        req.params.id,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})



export default appInventarios;