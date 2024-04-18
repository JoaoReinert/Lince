import 'package:flutter/material.dart';

class ListaCores {
  String nome;
  final Color cor;

  ListaCores(this.nome, this.cor);
}

void main(List<String> args) {
  runApp(MaterialApp(
    title: "Cores",
    home: MyAppNavegar(
      cores: [
        ListaCores("Azul", Colors.blue),
        ListaCores("Verde", Colors.green),
        ListaCores("Roxo", Colors.purple),
        ListaCores("Ciano", Colors.cyan),
        ListaCores("Vermelho", Colors.red),
        ListaCores("Amarelo", Colors.yellow),
        ListaCores("Laranja", Colors.orange),
      ],
    ),
  ));
}

class MyAppNavegar extends StatelessWidget {
  final List<ListaCores> cores;
  const MyAppNavegar({super.key, required this.cores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Lista de cores",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: cores.length,
        itemBuilder: ((context, index) {
          return ListTile(
            title: Text(
              cores[index].nome,
              style: TextStyle(color: cores[index].cor, fontSize: 20),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CorFundo(cores: cores[index]),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

class CorFundo extends StatelessWidget {
  final ListaCores cores;

  const CorFundo({super.key, required this.cores});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cores.cor,
        title: Text(cores.nome),
      ),
      backgroundColor: cores.cor,
    );
  }
}
