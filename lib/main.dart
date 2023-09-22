import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Incremento de Peso'),
        ),
        body: Center(
          child: PesoWidget(),
        ),
      ),
    );
  }
}

class PesoWidget extends StatefulWidget {
  @override
  _PesoWidgetState createState() => _PesoWidgetState();
}

class _PesoWidgetState extends State<PesoWidget> {
  int peso = 60; // Peso inicial

  void incrementarPeso() {
    setState(() {
      peso += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Peso Actual:',
          style: TextStyle(fontSize: 20),
        ),
        Text(
          '$peso kg',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: incrementarPeso,
          child: Text('Incrementar Peso'),
        ),
      ],
    );
  }
}
