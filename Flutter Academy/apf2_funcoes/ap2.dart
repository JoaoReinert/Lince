import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppAp2());
}

class MyAppAp2 extends StatefulWidget {
  const MyAppAp2({super.key});

  @override
  State<MyAppAp2> createState() => _MyAppAp2State();
}

class _MyAppAp2State extends State<MyAppAp2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Quadrados empilhados"),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
            ),
            Positioned(
              top: 70,
              left: 60,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 80,
              left: 70,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            Positioned(
              top: 90,
              left: 80,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: 160,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.black,
              ),
            ),
             Positioned(
              top: 180,
              left: 60,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.cyan,
              ),
            ),
            Positioned(
              top: 190,
              left: 70,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            ),
            Positioned(
              top: 200,
              left: 80,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              top: 270,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
              ),
            ),
             Positioned(
              top: 290,
              left: 60,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 300,
              left: 70,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              top: 310,
              left: 80,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: 380,
              left: 50,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.white,
              ),
            ),
             Positioned(
              top: 390,
              left: 55,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.deepPurple,
              ),
            ),
            Positioned(
              top: 400,
              left: 65,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.deepOrange,
              ),
            ),
            Positioned(
              top: 410,
              left: 75,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
            Positioned(
              top: 420,
              left: 85,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green[200],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
  }
}
