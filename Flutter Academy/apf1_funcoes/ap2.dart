import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp1());
}
//criando um visual mais bonito para o app, com algumas alteracoes do codigo do decola
class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyApp(),
        ),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final random = Random();

  //criando variaveis para as funcoes
  var botaoCorreto = 0;
  var clicks = 0;
  var ganhou = false;
  var perdeu = false;

  //funcao para escolher um botao aleatorio para ser o incorreto
  @override
  void initState() {
    super.initState();

    botaoCorreto = random.nextInt(3);
  }

  //funcao para os botoes
  void botaoAleatorio(int opcao) {
    setState(() {
      if (opcao == botaoCorreto) {
        ganhou = true;
      } else {
        clicks++;
      }
      if (clicks >= 2 && !ganhou) {
        perdeu = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color textColor = Colors.black;

    //mudar o fundo do app de acordo com as respostas
    if (ganhou) {
      backgroundColor = Colors.green;
    }

    if (perdeu) {
      backgroundColor = Colors.red;
    }

    //appbar para o app ficar melhor visualmente
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo dos 3 botões"),
      ),

      //criando e personalizando os botoes
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              botaoAleatorio(0);
            },
            child: const Text("aperte", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[800],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              botaoAleatorio(1);
            },
            child: const Text("aperte", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[800],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              botaoAleatorio(2);
            },
            child: const Text("aperte", style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[800],
            ),
          ),

          //aparecer a mensagem na tela de acordo com o resultado
          if (ganhou)
            Text(
              "Você ganhou! 😁",
              style: TextStyle(fontSize: 30, color: textColor),
            ),
          if (perdeu)
            Text(
              "Você perdeu! 😔",
              style: TextStyle(fontSize: 30, color: textColor),
            ),
        ]),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
