import 'package:app_prueba_13_06/screens/LoginScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Registro extends StatelessWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
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
      color: Color.fromARGB(255, 51, 173, 255),
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
                _buildNombreField(),
                const SizedBox(height: 16.0),
                _buildCorreoField(),
                const SizedBox(height: 16.0),
                _buildContraseniaField(),
                const SizedBox(height: 16.0),
                _buildRegistroButton(context),
                const SizedBox(height: 16.0),
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNombreField() {
    return TextFormField(
      controller: _nicknameController,
      decoration: const InputDecoration(
        hintText: 'Ingresar el nombre',
        fillColor: Colors.white,
        filled: true,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingrese el nombre';
        }
        return null;
      },
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      },
      child: const Text(
        'Inicia sesion',
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
        registro(context);
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

  Future<void> registro(BuildContext context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _correoController.text,
        password: _contraseniaController.text,
      );
      guardar();
      _showRegistroDialog(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showRegistroDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registro Exitoso'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: const Text('Iniciar sesion'),
            ),
          ],
        );
      },
    );
  }
}

final TextEditingController _nicknameController = TextEditingController();
final TextEditingController _correoController = TextEditingController();
final TextEditingController _contraseniaController = TextEditingController();

Future<void> guardar() async {
  DatabaseReference ref =
      FirebaseDatabase.instance.ref("usuarios/" + _nicknameController.text);
  await ref.set({
    "id": _nicknameController.text,
    "correo": _correoController.text,
    "contraseña": _contraseniaController.text
  });
}
