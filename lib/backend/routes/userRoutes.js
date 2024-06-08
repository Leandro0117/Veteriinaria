import {Router} from 'express';
import {
    getUsers,
    getUser,
    createUser,
    updateUser,
    loginUser
} from '../controllers/usercontroller.js';

const router = Router ();

router.get('/usuario/:CedulaEmpleado', getUser);
router.get('/usuarios', getUsers);
router.post('/register', createUser);
router.put('/user/:id', updateUser);
router.post('/login', loginUser);

export default router;