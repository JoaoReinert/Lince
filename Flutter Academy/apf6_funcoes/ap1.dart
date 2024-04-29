import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo? tipoSanguineo;

  // todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];
  Pessoa? pessoaSelecionada;

  List<Pessoa> get listaDePessoas => _listaDePessoas;

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void uptadeTipoSanguineo(TipoSanguineo sangue) {
    _controllerSangue = sangue;
    notifyListeners();
  }

  final _controllerNome = TextEditingController();
  final _controllerEmail = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerGitHub = TextEditingController();
  TipoSanguineo? _controllerSangue;

  TextEditingController get controllerNome => _controllerNome;
  TextEditingController get controllerEmail => _controllerEmail;
  TextEditingController get controllerTelefone => _controllerTelefone;
  TextEditingController get controllerGithub => _controllerGitHub;
  TipoSanguineo? get controllerSangue => _controllerSangue;

  void insert() {
    if (pessoaSelecionada == null) {
      final pessoas = Pessoa(
          nome: controllerNome.text,
          email: controllerEmail.text,
          telefone: controllerTelefone.text,
          github: controllerGithub.text,
          tipoSanguineo: controllerSangue);
      incluir(pessoas);

      controllerNome.clear();
      controllerEmail.clear();
      controllerTelefone.clear();
      controllerGithub.clear();
      _controllerSangue = null;
      notifyListeners();
    } else {
      salvarPessoaEditada();
    }
  }

  void editarPessoa(Pessoa pessoa) {
    pessoaSelecionada = pessoa;
    _controllerNome.text = pessoa.nome;
    _controllerEmail.text = pessoa.email;
    _controllerTelefone.text = pessoa.telefone;
    _controllerGitHub.text = pessoa.github;
    _controllerSangue = pessoa.tipoSanguineo;
  }

  void salvarPessoaEditada() {
    if (pessoaSelecionada != null) {
      final pessoaEditada = Pessoa(
        nome: _controllerNome.text,
        email: _controllerEmail.text,
        telefone: _controllerTelefone.text,
        github: _controllerGitHub.text,
        tipoSanguineo: _controllerSangue,
      );

      final index = _listaDePessoas.indexOf(pessoaSelecionada!);
      _listaDePessoas[index] = pessoaEditada;
      pessoaSelecionada = null;
      controllerNome.clear();
      controllerEmail.clear();
      controllerTelefone.clear();
      controllerGithub.clear();
      _controllerSangue = null;
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EstadoListaDePessoas(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black87,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Tela1(),
          ),
        ),
      ),
    );
  }
}

class Tela1 extends StatefulWidget {
  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.home),
            Text(' Tela inicial'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 109, 198),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PageIncluirNovasPessoas()));
            },
            label: const Text(
              'Cadastrar novas pessoas',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.accessibility_new_rounded,
              color: Color.fromARGB(255, 224, 208, 208),
            ),
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 0, 109, 198),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerListaDePessoas()));
            },
            label: const Text(
              'Ver lista de pessoas',
              style: TextStyle(color: Colors.white),
            ),
            icon: const Icon(
              Icons.article,
              color: Color.fromARGB(255, 224, 208, 208),
            ),
          ),
        ],
      ),
    );
  }
}

class PageIncluirNovasPessoas extends StatefulWidget {
  const PageIncluirNovasPessoas({super.key});
  @override
  State<PageIncluirNovasPessoas> createState() =>
      _PageIncluirNovasPessoasState();
}

class _PageIncluirNovasPessoasState extends State<PageIncluirNovasPessoas> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de pessoas'),
      ),
      body: Consumer<EstadoListaDePessoas>(
        builder: (context, state, child) {
          return Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Nome'),
                        validator: (text) => validarNome(text!),
                        controller: state.controllerNome,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'E-mail'),
                        validator: (text) => validarEmail(text!),
                        controller: state.controllerEmail,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Telefone'),
                        validator: (numero) => validarTelefone(numero!),
                        controller: state.controllerTelefone,
                      ),
                      TextFormField(
                        decoration:
                            const InputDecoration(labelText: 'Link do GitHub'),
                        validator: (link) => validarGitHub(link!),
                        controller: state.controllerGithub,
                      ),
                      DropdownButtonFormField<TipoSanguineo>(
                        value: state.controllerSangue,
                        onChanged: (value) {
                          if (value != null) {
                            state.uptadeTipoSanguineo(value);
                          }
                        },
                        items: TipoSanguineo.values.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo.toString().split('.').last),
                          );
                        }).toList(),
                        decoration:
                            InputDecoration(labelText: 'Tipo sanguíneo'),
                        validator: (value) => validarSangue(value),
                      ),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 0, 109, 198),
                        ),
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            state.insert();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerListaDePessoas(),
                              ),
                            );
                          }
                        },
                        label: const Text(
                          'Salvar',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(
                          Icons.save,
                          color: Color.fromARGB(255, 224, 208, 208),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String? validarNome(String text) {
    if (text == '') {
      return 'Insira seu nome';
    }
    if (text.length <= 3) {
      return 'Seu nome tem que ter mais de 3 letras';
    }
    return null;
  }

  String? validarEmail(String text) {
    if (text == '') {
      return 'Insira um e-mail';
    }
    if (!text.contains('@')) {
      return 'Digite um e-mail válido';
    }
    if (text.length < 10) {
      return 'Digite um e-mail válido';
    }
    return null;
  }

  String? validarTelefone(String numero) {
    if (numero == '') {
      return 'Insira seu número';
    }
    if (numero.length < 9) {
      return 'Digite um número de telefone correto';
    }

    return null;
  }

  String? validarGitHub(String link) {
    if (link == '') {
      return 'Insira seu link do GitHub';
    }
    if (!link.contains('github')) {
      return 'Insira um link válido';
    }
    return null;
  }

  String? validarSangue(TipoSanguineo? sangue) {
    if (sangue == null) {
      return 'Insira seu tipo sanguíneo';
    }
    return null;
  }
}

class VerListaDePessoas extends StatelessWidget {
  const VerListaDePessoas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Lista de pessoas cadastradas')),
      ),
      body: Consumer<EstadoListaDePessoas>(
        builder: (context, estado, child) {
          return ListView.builder(
            itemCount: estado._listaDePessoas.length,
            itemBuilder: (context, index) {
              final pessoa = estado._listaDePessoas[index];
              return ListTile(
                title: Text(pessoa.nome),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(backgroundColor: Colors.blue),
                      onPressed: () {
                        estado.editarPessoa(pessoa);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PageIncluirNovasPessoas(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                    ),
                    IconButton(
                        style:
                            IconButton.styleFrom(backgroundColor: Colors.red),
                        onPressed: () {
                          estado.excluir(pessoa);
                        },
                        icon: const Icon(Icons.delete))
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('E-mail: ${pessoa.email}'),
                    Text('Telefone: ${pessoa.telefone}'),
                    Text('GitHub: ${pessoa.github}'),
                    Text('${pessoa.tipoSanguineo}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
