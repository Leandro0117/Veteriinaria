import router from './routes/userRoutes.js'
import  {createPool} from 'mysql2/promise';
import express from 'express';
import cors from 'cors';

const app = express();
app.use(cors());
app.use(express.json());

const port = 3000;

// Configuración de CORS

// Configuración del body parser para manejar las solicitudes JSON
app.use(router);
// Configuración de la conexión a la base de datos MySQL
export const pool = createPool({
  host: 'be7ounj3qlx5smbb73fj-mysql.services.clever-cloud.com',
  port: '3306',
  user: 'ulvhkr3pifbpiuwm',
  password: 'YtAcQ3Sq0pSy9FCWWg2F',
  database: 'be7ounj3qlx5smbb73fj'

})
// Inicia el servidor
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
