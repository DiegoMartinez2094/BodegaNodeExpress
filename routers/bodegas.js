import { Router } from "express"; //importamos de la libreria express el modulo Router
import mysql from "mysql2"; //importamos de la libreria mysql2 el modulo mysql
const appBodegas = Router(); //nombramos una variable appBodegas y le asignamos la funcion Router
let con = undefined; // definimos una variable para usarla más adelante como conexio 

// conexion a base de datos
appBodegas.use((req, res, next)=>{
    try {
        con = mysql.createPool({
            host: "127.0.0.1",
            user: "campus",
            password: "campus2023",
            // user: "root",
            // password: "123456",
            database: "db_prueba_backend_sql",
            port: 3306
    });
    next();        
    } catch (error) {
        res.status(500).send('Conexion pailas papá, funado de la red :(')
    }
})

appBodegas.post("/", (req, res) => {
    // datos que necesitamos para crear una bodega
    //"id": 
    // "nombre": 
    // "id_responsable": 
    // "estado": 
    // "created_by": 
    // "update_by": 
    // "created_at":
    // "updated_at": 
    // "deleted_at"
    con.query(
        /*sql*/ `INSERT INTO bodegas SET ?`,
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

appBodegas.get("/", (req, res) => {
    con.query(
        /*sql*/ `SELECT * FROM bodegas order by nombre asc`,
        req.body,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appBodegas.put("/:id", (req, res) => {
    con.query(
        /*sql*/ `UPDATE bodegas SET ? WHERE id= ?`,
        [req.body, req.params.id],
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})

appBodegas.delete("/:id", (req, res) => {
    con.query(
        /*sql*/ `DELETE FROM bodegas WHERE id= ?`,
        req.params.id,
        (err,data,fils)=>{
            console.log(err);
            console.log(data);
            console.log(fils);
            res.send(data)
        }
    );
})



export default appBodegas;