import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isTitleBold = true;
  double peso = 70; 
  double altura = 170;
  String resultado = '';

  void calcular() {
    
    double imc = peso / ((altura / 100) * (altura / 100));

    setState(() {
      if (imc < 18.5) {
        resultado = 'BAJO PESO';
      } else if (imc < 24.9) {
        resultado = 'NORMAL';
      } else {
        resultado = 'SOBREPESO';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC APP'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(
              "Bienvenido,selecciona tu peso y altura",
               style: TextStyle(
                fontSize: 20.0,
                fontWeight:
                    isTitleBold == true ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            Text(
              '${peso.toStringAsFixed(1)}kg',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: peso,
              min: 10,
              max: 200,
              onChanged: (newValue) {
                setState(() {
                  peso = newValue;
                });
              },
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
            ),
            Text(
              ' ${altura.toStringAsFixed(1)}cm',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: altura,
              min: 100,
              max: 220,
              onChanged: (newValue) {
                setState(() {
                  altura = newValue;
                });
              },
              activeColor: Colors.pink,
              inactiveColor: Colors.pink.withOpacity(0.2),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Image.asset('assets/imagenes/play.png'), 
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}