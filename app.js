//importa los modulos de cada archivo de routers, los nombres son los que usaremos en las lineas más abajo 22,23,24,25
import usuarios from './routers/users.js'
import bodegas from './routers/bodegas.js'
import inventarios from './routers/inventarios.js'
import productos from './routers/productos.js'

import express from 'express'; //importar la libreria express 
import dotenv from "dotenv";   //importar la libreria dotenv que permite cargar variables de entorno

dotenv.config(); //inicializa las variables de entorno del .env

const appExpress = express(); //variable appExpres que use la función express()

appExpress.use(express.json()); //para que la variable appExpress entienda archivos json

let config = JSON.parse(process.env.MY_CONFIG);//lee la variable de entorno MY_CONFIG y la guarda 

appExpress.listen(config, ()=>{
    console.log(`http://${config.hostname}:${config.port}`); //mostramos en la consola el enlace del servidor
});

appExpress.use("/usuarios",usuarios) //nombramos el endpoint y el import que usamos anteriormente 
appExpress.use("/bodegas",bodegas)
appExpress.use("/inventarios",inventarios)
appExpress.use("/productos",productos)