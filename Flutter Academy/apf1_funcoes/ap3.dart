import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp2());
}

//criando um visual mais bonito para o app, com algumas alteracoes do codigo do decola
class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: CupertinoColors.darkBackgroundGray),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyApp6(),
        ),
      ),
    );
  }
}

enum EstadoDoJogo {
  emAndamento,
  ganhou,
  perdeu,
}

class MyApp6 extends StatefulWidget {
  @override
  State<MyApp6> createState() => _MyApp6State();
}

class _MyApp6State extends State<MyApp6> {
  final random = Random();

  //criando variaveis para as funcoes
  var vitorias = 0;
  var derrotas = 0;
  var botaoCorreto = 0;
  var clicks = 0;
  var estadoDoJogo = EstadoDoJogo.emAndamento;

  //funcao para escolher um botao aleatorio para ser o incorreto
  @override
  void initState() {
    super.initState();

    iniciarJogo();
  }

  //funcao para os botoes
  void botaoAleatorio(int opcao) {
    setState(() {
      //verifica se o botao que clicou é o correto e da mais chance de clique
      if (opcao == botaoCorreto) {
        estadoDoJogo = EstadoDoJogo.ganhou;
        vitorias++;
      } else {
        clicks++;
      }
      if (clicks >= 2 && estadoDoJogo != EstadoDoJogo.ganhou) {
        estadoDoJogo = EstadoDoJogo.perdeu;
        derrotas++;
      }
    });
  }

  void iniciarJogo() {
    setState(() {
      botaoCorreto = random.nextInt(3);

      clicks = 0;

      estadoDoJogo = EstadoDoJogo.emAndamento;
    });
  }

  void reiniciarJogo() {
    setState(() {
      iniciarJogo();
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.transparent;
    Color textColor = Colors.black;

    //mudar o fundo do app de acordo com as respostas
    if (estadoDoJogo == EstadoDoJogo.ganhou) {
      backgroundColor = Colors.green;
    }

    if (estadoDoJogo == EstadoDoJogo.perdeu) {
      backgroundColor = Colors.red;
    }

    //appbar para o app ficar melhor visualmente
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jogo dos 3 botões"),
      ),

      //criando e personalizando os botoes
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                botaoAleatorio(0);
              },
              child: const Text(
                "aperte",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                botaoAleatorio(1);
              },
              child: const Text(
                "aperte",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                botaoAleatorio(2);
              },
              child: const Text(
                "aperte",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
            ),

            //aparecer a mensagem na tela de acordo com o resultado
            if (estadoDoJogo == EstadoDoJogo.ganhou)
              Text(
                "Você ganhou! 😁",
                style: TextStyle(fontSize: 30, color: textColor),
              ),
            if (estadoDoJogo == EstadoDoJogo.perdeu)
              Text(
                "Você perdeu! 😔",
                style: TextStyle(fontSize: 30, color: textColor),
              ),
            if (estadoDoJogo != EstadoDoJogo.emAndamento)
              ElevatedButton(
                onPressed: () {
                  reiniciarJogo();
                },
                child: const Text(
                  "Reiniciar Jogo",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
              ),
              Text(
              "Vitórias: $vitorias",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              "Derrotas: $derrotas",
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
