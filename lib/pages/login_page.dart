import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email;
  String senha;

  Widget _body() {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo.png'),
            ),
            Card(
              child: Column(
                children: [
                  TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Column(
                children: [
                  TextField(
                    onChanged: (text) {
                      senha = text;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Senha', border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {
                if (senha == '123' && email == 'aplicativo@teste.email.com') {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  _erroLogin();
                }
              },
              child: Text('Entrar'),
            ),
            SizedBox(
              height: 15,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/cadastro');
              },
              child: Text('Cadastrar'),
            )
          ],
        ),
      ),
    );
  }

  void _erroLogin() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Usuário ou Senha inválido(s)."),
          content: new Text("Informe os dados Corretamente!"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/campo.png',
              fit: BoxFit.cover,
            )),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        _body(),
      ],
    ));
  }
}
