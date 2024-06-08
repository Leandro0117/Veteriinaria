import 'package:flutter/material.dart';
import "screens/login_page.dart";
import 'screens/register_page.dart';
import 'screens/home/home_page.dart';
import 'screens/home/info_page.dart'; 
import 'screens/home/info_usuario_page.dart';
import 'screens/home/info_mascota_page.dart';

void main() => runApp(Miapp());

class Miapp extends StatelessWidget {
  Miapp({super.key});

  final _routes = {
    'login': (_) => const LoginPage(),
    'register': (_) => const RegisterPage(),
    'home': (_) => const HomePage(),
    'informacion': (_) => const InformacionPage(),
    'infoUsuario': (_) => const InfoUsuarioPage(),
    'infoMascotas': (_) => const InfoMascotaPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mi app",
      routes: _routes,
      initialRoute: 'home',
    );
  }
}
