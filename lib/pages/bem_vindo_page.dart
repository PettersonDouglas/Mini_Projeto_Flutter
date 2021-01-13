import 'package:flutter/material.dart';
import 'package:teste/pages/home_page.dart';

class BemVindoPage extends StatelessWidget {
  final String nome,
      sobrenome,
      apelido,
      email,
      senha,
      descricao,
      cpf,
      dataNascimento,
      cep;

  const BemVindoPage(
      {Key key,
      this.nome,
      this.sobrenome,
      this.apelido,
      this.email,
      this.senha,
      this.descricao,
      this.cpf,
      this.dataNascimento,
      this.cep})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Super Carques'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo, $apelido !\nO cadastro de $nome $sobrenome foi realizado com sucesso. Favor, verifique seu email \n$email para confirmar seu acesso!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color: Colors.green[900],
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              apelido: '$apelido',
                              nome: '$nome',
                              sobrenome: '$sobrenome',
                              email: '$email',
                              descricao: '$descricao',
                            )));
              },
              child: Text(
                'Aceitar',
              ),
            )
          ],
        ),
      ),
    );
  }
}
