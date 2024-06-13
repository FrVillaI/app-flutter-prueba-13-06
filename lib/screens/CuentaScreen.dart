import 'package:flutter/material.dart';

void main() {
  runApp(Cuenta());
}

class Cuenta extends StatelessWidget {
  const Cuenta({super.key});

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
        title: const Text('Cuenta'),
      ),
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Center(
    child: Card(
      color: Colors.blue[50],
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.network(
              'https://alt72.com.ar/wp-content/uploads/2014/09/login-150x150.png', 
              height: 150,
            ),
            SizedBox(height: 16.0),
            Text("Cuenta "),
            SizedBox(height: 16.0),
            Text("N° 1579642510"),
            SizedBox(height: 8.0),
            Text("Valor total disponible"),
            SizedBox(height: 8.0),
            Text("600", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}
