import { pool } from "../server.js";

export const getUser = async (req, res) => {
    console.log(req.params.CedulaEmpleado);
    try{
        const [result] = await pool.query("SELECT * FROM usuario WHERE CedulaEmpleado = ?",
        [req.params.CedulaEmpleado]);
    
        if(result.length === 0)
            return res.status(404).json({message: "Uusario no encontrado"});
            res.json(result[0]);
    }catch(error){
        return res.status(500).json({message: error.message});
    }
};

export const getUsers = async (req, res) => {
    console.log('funcionaaaa');
    try {
        const [result] = await pool.query("SELECT * FROM usuario");
        //res.json(result);
    } catch (error) {
        //return res.status(500).json({ message: "Error interno del servidor", error: error.message });
    }
};

export const createUser = async (req, res) => {
    const { nombres, apellidos, documento, correo, contraseña } = req.body;
    
    try {
        const result = await pool.query(
            "INSERT INTO CUENTAS_ESTU(nombres, apellidos, documento, correo, contraseña) VALUES (?, ?, ?, ?, ?)",
            [nombres, apellidos, documento, correo, contraseña]
        );

        res.json({
            id: result.insertId,
            nombres,
            apellidos,
            documento,
            correo,
            contraseña
        });
    } catch (error) {
        console.error("Error al crear usuario:", error);
        res.status(500).json({ message: error.message });
    }
};

export const updateUser = async (req, res) => {
    try {
        const result = await pool.query(
            "UPDATE CUENTAS_ESTU SET ? WHERE id = ?",
            [req.body, req.params.id]
        );

        res.json({ message: "Usuario actualizado correctamente" });
    } catch (error) {
        console.error("Error al actualizar usuario:", error);
        res.status(500).json({ message: error.message });
    }
};

export const loginUser = async (req, res) => {

    const { documento, contrasenia } = req.body;
    console.log(documento);
    console.log(contrasenia);
    try {
        const [result] = await pool.query("SELECT * FROM usuario WHERE CedulaEmpleado = ? AND Contrasenia = ?", [documento, contrasenia]);
        console.log(result);
        if (result.length === 1) {
            return res.status(200).json({ messageSuccess: "Inicio de sesión exitoso", user: result[0] });
        } else {
            return res.status(401).json({ messageFail: "Credenciales inválidas"});

        }
    } catch (error) {
        console.error("Error al iniciar sesión:", error);
        return res.status(500).send('Error al iniciar sesión');
    }

};