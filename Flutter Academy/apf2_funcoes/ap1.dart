import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAppAp1());
}

class MyAppAp1 extends StatefulWidget {
  const MyAppAp1({super.key});

  @override
  State<MyAppAp1> createState() => _MyAppAp1State();
}

class _MyAppAp1State extends State<MyAppAp1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Formas Geométricas"),
          backgroundColor: Colors.blue,
        ),
        body: Stack(
          children: [
            Positioned(
              top: 50,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            Positioned(
              top: 100,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            Positioned(
              top: 150,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            Positioned(
              top: 200,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.purple,
              ),
            ),
            Positioned(
              top: 250,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.cyan,
              ),
            ),
            Positioned(
              top: 300,
              left: 50,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
            ),
            Positioned(
              top: 350,
              left: 50,
              child: Container(
                width: 50,
                height: 100,
                color: Colors.purple,
              ),
            ),
            Positioned(
              top: 450,
              left: 50,
              child: Container(
                width: 50,
                height: 100,
                color: Colors.cyan,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
