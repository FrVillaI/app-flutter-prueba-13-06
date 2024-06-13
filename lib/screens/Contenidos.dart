import 'package:app_prueba_13_06/screens/CuentaScreen.dart';
import 'package:app_prueba_13_06/screens/HistorialScreen.dart';
import 'package:flutter/material.dart';


void main(){
  runApp(Contenidos());
}

class Contenidos extends StatelessWidget {
  const Contenidos({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
  int indice=0;
  @override
  Widget build(BuildContext context) {
    /////////////////////////////////
    List <Widget> screens =[
      const Historial(),
     Cuenta()
    ];
    //////////////////////////////
    return Scaffold(
      body:  screens[indice],
      //////////////////////////////////////////////////////////////////
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indice,
        onTap: ( valor ) {
          setState(() {
            indice = valor;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Historial"),
          BottomNavigationBarItem(icon: Icon(Icons.no_drinks), label: "Cuenta"),
        ],
        ),
        //////////////////////////////////////////////////////////
    );
  }
}
