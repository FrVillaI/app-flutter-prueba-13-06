import 'package:flutter/material.dart';

void main() {
  runApp(Historial());
}

class Historial extends StatelessWidget {
  const Historial({super.key});

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
  final List<Map<String, String>> transacciones = [
    {
      'accion': 'Retiro',
      'monto': '100',
      'saldo': '200',
    },
    {
      'accion': 'Deposito',
      'monto': '200',
      'saldo': '400',
    },
    {
      'accion': 'Deposito',
      'monto': '50',
      'saldo': '450',
    },
    {
      'accion': 'Retiro',
      'monto': '20',
      'saldo': '430',
    },
    {
      'accion': 'Deposito',
      'monto': '150',
      'saldo': '580',
    },
        {
      'accion': 'Deposito',
      'monto': '120',
      'saldo': '700',
    },
        {
      'accion': 'Retiro',
      'monto': '100',
      'saldo': '600',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Transacciones'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView.builder(
      itemCount: transacciones.length,
      itemBuilder: (context, index) {
        return _buildMovieCard(transacciones[index]);
      },
    );
  }

  Widget _buildMovieCard(Map<String, String> transacciones) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(transacciones['accion']!),
        subtitle: Text(transacciones['monto']!),
        onTap: () {},
      ),
    );
  }
}
