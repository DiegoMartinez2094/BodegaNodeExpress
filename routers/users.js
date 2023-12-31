import { Router } from "express";
import mysql from "mysql2";
import appValidate from "../middleware/valiUser.js"; //importamos el middleware para usarlos en el post y put 

const appUsuario = Router();
let con = undefined;

// conexion a base de datos
appUsuario.use((req, res, next)=>{
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

appUsuario.post("/",appValidate, (req, res) => { //el appValidate es el middleware que importamos anteriormente
    con.query(
        /*sql*/ `INSERT INTO users SET ?`,
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

appUsuario.get("/", (req, res) => {
    con.query(
        /*sql*/ `SELECT * FROM users`,
        req.body,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appUsuario.put("/:id", (req, res) => {
    con.query(
        /*sql*/ `UPDATE users SET ? WHERE id= ?`,
        [req.body, req.params.id],
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appUsuario.delete("/:id", (req, res) => {
    con.query(
        /*sql*/ `DELETE FROM users WHERE id= ?`,
        req.params.id,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

export default appUsuario;