import 'package:flutter/material.dart';

class BemVindoPage extends StatelessWidget {
  final String nomeBemVindo,
      sobrenomeBemVindo,
      apelidoBemVindo,
      emailBemVindo,
      senhaBemVindo,
      descricaoBemVindo,
      cpfBemVindo,
      dataNascimentoBewmVindo,
      cepBemVindo;

  const BemVindoPage(
      {Key key,
      this.nomeBemVindo,
      this.sobrenomeBemVindo,
      this.apelidoBemVindo,
      this.emailBemVindo,
      this.senhaBemVindo,
      this.descricaoBemVindo,
      this.cpfBemVindo,
      this.dataNascimentoBewmVindo,
      this.cepBemVindo})
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
              'Bem vindo, $apelidoBemVindo !\nO cadastro de $nomeBemVindo $sobrenomeBemVindo foi realizado com sucesso. Favor, verifique seu email \n$emailBemVindo para confirmar seu acesso!',
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
              onPressed: () {},
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
