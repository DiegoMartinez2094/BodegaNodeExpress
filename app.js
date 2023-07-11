import usuarios from './routers/users.js'
import bodegas from './routers/bodegas.js'
import inventarios from './routers/inventarios.js'
import productos from './routers/productos.js'

import express from 'express';
import dotenv from "dotenv";
dotenv.config();
const appExpress = express();
appExpress.use(express.json()); 

let config = JSON.parse(process.env.MY_CONFIG);

appExpress.listen(config, ()=>{
    console.log(`http://${config.hostname}:${config.port}`);
});

appExpress.use("/usuarios",usuarios)
appExpress.use("/bodegas",bodegas)
appExpress.use("/inventarios",inventarios)
appExpress.use("/productos",productos)