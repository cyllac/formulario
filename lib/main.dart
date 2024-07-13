import 'package:flutter/material.dart';

enum Genero { Masculino, Feminino, Outro }

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  const myApp({super.key});

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  String email = '';
  String senha = '';
  bool aceitoTermos = false;
  Genero genero = Genero.Feminino;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Página de Cadastro')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Insira seus dados',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'E-mail',
                ),
                onChanged: (text) {
                  if (text.contains('@')) {
                    print('Email válido');
                  } else {
                    print('Email inválido');
                  }

                  email = text;
                  //print(text);
                },
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                ),
                onChanged: (text) {
                  senha = text;
                  //print(text);
                },
              ),
              Row(
                children: [
                  Radio(
                      value: Genero.Masculino,
                      groupValue: genero,
                      onChanged: (Genero? generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado!;
                        });
                      }),
                  Text('Masculino'),
                  Radio(
                      value: Genero.Feminino,
                      groupValue: genero,
                      onChanged: (Genero? generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado!;
                        });
                      }),
                  Text('Feminino'),
                  Radio(
                      value: Genero.Outro,
                      groupValue: genero,
                      onChanged: (Genero? generoSelecionado) {
                        setState(() {
                          genero = generoSelecionado!;
                        });
                      }),
                  Text('Outro'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: aceitoTermos,
                      onChanged: (checked) {
                        print(checked);
                        setState(() {
                          aceitoTermos = !aceitoTermos;
                        });
                      }),
                  Text('Concordo com os termos de uso do app'),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  print('Entrar pressionado');
                  print('Email $email');
                  print('Senha $senha');
                  print('Gênero $genero');

                  if (!aceitoTermos) {
                    print('Não aceitou termos de uso do app');
                  }
                },
                child: Text('Entrar'),
              ),
              Text('Esqueceu sua senha?'),
            ],
          ),
        ),
      ),
    );
  }
}
