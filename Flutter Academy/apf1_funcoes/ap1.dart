import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color textoCor = Colors.black;

  //criando uma funcao para dar uma cor aleatorio para o texto
  void mudarCorTexto() {
    setState(() {
      textoCor = Color((Random().nextDouble() * 0xFFFFFFFF).toInt() << 0)
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    //criando uma appbar para ficar mais visualmente facil de entender o app
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("muda de cor"),
        ),
        //alinhando o texto no centro com uma column
        body: Center(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.center,
             children: [
             Text(
              "texto aleatório",
              style: TextStyle(fontSize: 30, color: textoCor),
            ),
            //criando o botao para sortear a cor
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: mudarCorTexto,
              child: const Text("Sotear cor"),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
