import 'dart:math';

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyAppAp3());
}

class MyAppAp3 extends StatefulWidget {
  const MyAppAp3({super.key});

  @override
  State<MyAppAp3> createState() => _MyAppAp3State();
}

class _MyAppAp3State extends State<MyAppAp3> {
  Random random = Random();
  Color cores = Colors.black;
  bool exibirCirculo = true;

  void mudarDeCor() {
    setState(() {
      cores = Color.fromARGB(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  void mudarDeForma() {
    setState(() {
      exibirCirculo = !exibirCirculo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fomatos dinâmicos"),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  if (exibirCirculo) {
                    mudarDeCor();
                  }
                },
                child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        shape: exibirCirculo
                            ? BoxShape.circle
                            : BoxShape.rectangle,
                        color: exibirCirculo ? cores : cores)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    mudarDeCor();
                  },
                  child: const Text('Mudar Cor'),
                ),
                ElevatedButton(
                  onPressed: () {
                    mudarDeForma();
                  },
                  child: Text(
                      exibirCirculo ? 'Exibir Quadrado' : 'Exibir Círculo'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
