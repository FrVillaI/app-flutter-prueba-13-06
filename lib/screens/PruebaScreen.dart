import 'package:app_prueba_13_06/screens/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Prueba());
}

class Prueba extends StatelessWidget {
  const Prueba({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Container(
    color: Colors.blue[50], // Fondo de color azul claro
    child: Center(
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.network(
                'https://www.ngenespanol.com/wp-content/uploads/2022/08/estudio-ayuda-a-conocer-origen-de-los-perros-770x431.jpg',
                height: 150,
              ),
              SizedBox(height: 16.0),
              Text("Isaac Villacis",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              Text("FrVillaI",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              botonLogin(context),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget botonLogin(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    },
    child: Text("Login"),
  );
}
