import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyAppFormularioBasico());
}

class MyAppFormularioBasico extends StatefulWidget {
  const MyAppFormularioBasico({super.key});

  @override
  State<MyAppFormularioBasico> createState() => _MyAppFormularioBasicoState();
}

class _MyAppFormularioBasicoState extends State<MyAppFormularioBasico> {
  String? nome;
  int? idade;
  bool inativo = false;
  final _formKey = GlobalKey<FormState>();

  void enviarFormulario() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("Formulário Básico"),
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Insira seus dados",
                  style: TextStyle(fontSize: 20),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nome",
                  ),
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return "Insira um nome";
                    }
                    if (3 > text.length) {
                      return "O nome tem que ter mais de 3 letras";
                    }
                    if (text.startsWith(RegExp(r'[^A-Z]'))) {
                      return "O nome precisa começar com letra maiúscula";
                    }
                    return null;
                  },
                  onSaved: (text) => nome = text,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Idade",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Insira a sua idade";
                    }
                    int? idade = int.tryParse(value);
                    if (idade == null || idade < 18) {
                      return "Você tem que ser de maior para se cadastrar";
                    }
                    return null;
                  },
                  onSaved: (value) => idade = int.parse(value!),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: inativo,
                      onChanged: (bool? verificador) {
                        if (verificador != null) {
                          setState(() {
                            inativo = verificador;
                          });
                        }
                      },
                    ),
                    const Text("Inativo"),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    enviarFormulario();
                  },
                  child: const Text(
                    "Enviar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (nome != "" && idade != null)
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: inativo ? Colors.grey : Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Detalhes do Formulário",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Nome: $nome",
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          "Idade: $idade",
                          style: const TextStyle(fontSize: 13),
                        ),
                        Text(
                          "Inativo: ${inativo ? "Sim" : "Não"}",
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
