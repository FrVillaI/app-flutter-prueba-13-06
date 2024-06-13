import 'package:app_prueba_13_06/screens/RegistroScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Contenidos.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color:  Color.fromARGB(255, 51, 173, 255),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white, // Fondo blanco del cuadro
            borderRadius: BorderRadius.circular(12.0), // Bordes redondeados
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildCorreoField(),
                const SizedBox(height: 16.0),
                _buildContraseniaField(),
                const SizedBox(height: 16.0),
                _buildLoginButton(context),
                const SizedBox(height: 16.0),
                _buildRegistroButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCorreoField() {
    return TextFormField(
      controller: _correoController,
      decoration: const InputDecoration(
        hintText: 'Ingresar el correo electrónico',
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su correo';
        }
        return null;
      },
    );
  }

  Widget _buildContraseniaField() {
    return TextFormField(
      controller: _contraseniaController,
      decoration: const InputDecoration(
        hintText: 'Ingresar la contraseña',
        fillColor: Colors.white,
        filled: true,
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese su contraseña';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        login(context);
      },
      child: const Text(
        'Iniciar Sesión',
        style: TextStyle(color: Colors.white), // Color del texto blanco
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Color del botón negro
      ),
    );
  }

  Widget _buildRegistroButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Registro()),
        );
      },
      child: const Text(
        'Registrarse',
        style: TextStyle(color: Colors.white), // Color del texto blanco
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black, // Color del botón negro
      ),
    );
  }

}

final TextEditingController _correoController = TextEditingController();
final TextEditingController _contraseniaController = TextEditingController();

Future<void> login(BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _correoController.text,
      password: _contraseniaController.text
    );
    // Si el inicio de sesión es exitoso, mostrar el diálogo
    _showLoginDialog(context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}

void _showLoginDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Credenciales Correctas'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Contenidos()),
              );
            },
            child: const Text('Ver Catálogo'),
          ),
        ],
      );
    },
  );
}
