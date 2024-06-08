import 'dart:convert';
import 'package:http/http.dart' as http;

verificar() {
  /*return http.post(
    Uri.parse('http://localhost:3000/usuarios/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );*/
}

void getUsers() async {
  var url = Uri.parse('http://192.168.1.21:3000/usuarios');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var responseBody = response.body;
    print(responseBody);
  } else {
    print('Error en la petición: ${response.statusCode}');
  }
}

Future<Map<String, dynamic>> loginUser(int cedula, String contrasenia) async {
  var url = Uri.parse('http://172.20.10.4:3000/login');

  // Enviar la solicitud POST con cedula y contrasenia en el cuerpo
  var response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'documento': cedula, 'contrasenia': contrasenia}),
  );

  // Verificar el estado de la respuesta
  if (response.statusCode == 200) {
    // Deserializar la respuesta JSON
    var responseBody = jsonDecode(response.body);
    return responseBody;
  } else {
    // Manejar el error devolviendo la respuesta JSON con un mensaje de error
    var responseBody = jsonDecode(response.body);
    return responseBody;
  }
}

/*void verificarCuenta() async {
  var response = await http.get(
    Uri.parse('http://localhost:3000/usuarios'),
    headers: {'Content-Type': 'application/json'},
    //body: jsonEncode({'IDUsuario': cedula}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['exists'];
  } else {
    throw Exception('Error al verificar cuenta');
  }
}

Future<void> fetchUsuarios() async {
  final response = await http.get(Uri.parse('http://localhost:3000/usuarios'));

  if (response.statusCode == 200) {
    // La solicitud fue exitosa
    final Map<String, dynamic> data = json.decode(response.body);
    print(data); // Aquí puedes manejar la respuesta JSON como desees
  } else {
    // Si la solicitud no fue exitosa, maneja el error
    print('Error al obtener usuarios: ${response.reasonPhrase}');
  }
}*/

Future<bool> registrarUsuario(
    String cedula, String correo, String contrasena) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/registrar'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(
        {'cedula': cedula, 'correo': correo, 'contrasena': contrasena}),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['success'];
  } else {
    throw Exception('Error al registrar usuario');
  }
}
