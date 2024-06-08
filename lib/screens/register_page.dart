import 'package:flutter/material.dart';
import 'package:prueba1/screens/login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  final TextEditingController nombreController = TextEditingController();
  final TextEditingController apellidosController = TextEditingController();
  final TextEditingController correoController = TextEditingController();
  final TextEditingController contrasenaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/backgrounds/fondo_cafe.jpg"),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo(),
            crea(),
            Form(
              key: formKey,
              child: Column(
                children: [
                  campoNombre(nombreController),
                  campoCedula(apellidosController),
                  campoCorreo(correoController),
                  campoContrasena(contrasenaController),
                  botonRegistrar(
                      context,
                      formKey,
                      nombreController,
                      apellidosController,
                      correoController,
                      contrasenaController),
                  tengo(context),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget logo() {
  return Column(
    children: [
      Image.asset(
        "assets/images/logoMini_negro.png",
        width: 150,
        height: 150,
      ),
    ],
  );
}

Widget crea() {
  return const Text(
    "Crea tu cuenta",
    style: TextStyle(
        color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
  );
}

Widget campoNombre(TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Nombre",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 37, 37),
            width: 2.0,
          ),
        ),
        prefixIcon: const Icon(Icons.person),
        errorStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa tu nombre';
        }
        return null;
      },
    ),
  );
}

Widget campoCedula(TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Cédula",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 37, 37),
            width: 2.0,
          ),
        ),
        prefixIcon: const Icon(Icons.person_outline),
        errorStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa tu cédula';
        }
        try {
            int.parse(value);
          } catch (e) {
            return 'La cédula no debe contener letras';
          }
        return null;
      },
    ),
  );
}

Widget campoCorreo(TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Correo",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 37, 37),
            width: 2.0,
          ),
        ),
        prefixIcon: const Icon(Icons.email),
        errorStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa tu correo';
        }
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
          return 'Ingresa un correo válido';
        }
        return null;
      },
    ),
  );
}

Widget campoContrasena(TextEditingController controller) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
    child: TextFormField(
      controller: controller,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Contraseña",
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 128, 37, 37),
            width: 2.0,
          ),
        ),
        prefixIcon: const Icon(Icons.lock),
        errorStyle: const TextStyle(fontWeight: FontWeight.w700),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, ingresa tu contraseña';
        }
        if (value.length < 3) {
          return 'La contraseña debe tener al menos 3 caracteres';
        }
        return null;
      },
    ),
  );
}

Widget botonRegistrar(
    BuildContext context,
    GlobalKey<FormState> formKey,
    TextEditingController nombreController,
    TextEditingController apellidosController,
    TextEditingController correoController,
    TextEditingController contrasenaController) {
  return Container(
    padding: const EdgeInsets.only(top: 40.0),
    child: ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 221, 166, 101),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      onPressed: () {
        if (formKey.currentState!.validate()) {
          // Realizar el registro aquí
          // Por ejemplo, puedes enviar los datos a una API
          // Una vez registrado, puedes navegar a la página de inicio de sesión
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      },
      child: const Text("Registrarse", style: TextStyle(fontSize: 17.0)),
    ),
  );
}

Widget tengo(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(top: 70.0),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromARGB(198, 255, 255, 255),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      },
      child: const Text("Tengo una cuenta"),
    ),
  );
}
