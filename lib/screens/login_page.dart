import 'package:flutter/material.dart';
import 'package:prueba1/screens/home/home_page.dart';
import 'register_page.dart';
import 'package:prueba1/backend/puente.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //Controladores para los campos de texto
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }

  Widget cuerpo(BuildContext context) {
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
              inicia(),
              const SizedBox(
                height: 10.0,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    campoCedula(),
                    campoContrasena(),
                    const SizedBox(
                      height: 25.0,
                    ),
                    botonLogin(context),
                    noTengo(context),
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

  Widget inicia() {
    return const Text(
      "Inicia sesión",
      style: TextStyle(
          color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.w700),
    );
  }

  Widget campoCedula() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: TextFormField(
        controller: _usernameController,
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
          prefixIcon: const Icon(Icons.person),
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

  Widget campoContrasena() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2.0,
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

  Widget botonLogin(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 221, 166, 101),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: const BorderSide(color: Colors.white, width: 2.0),
        ),
      ),
      onPressed: () async {
        if (_formKey.currentState!.validate()) {
          // Obtener los valores de los campos de texto
          String cedulaText = _usernameController.text.trim();
          String password = _passwordController.text.trim();
          int cedula = int.parse(cedulaText);

          // Realizar el inicio de sesión
          var response = await loginUser(cedula, password);

          // Manejo de la respuesta
          if (response.containsKey('messageSuccess')) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Loggeado")),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Credenciales inválidas")),
            );
          }
        }
      },
      child: const Text("Iniciar sesión", style: TextStyle(fontSize: 17.0)),
    );
  }

  Widget noTengo(BuildContext context) {
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
            MaterialPageRoute(builder: (context) => const RegisterPage()),
          );
        },
        child: const Text("No tengo una cuenta"),
      ),
    );
  }
}
