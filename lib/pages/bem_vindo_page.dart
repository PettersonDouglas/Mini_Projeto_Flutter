import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/images/logo.png'),
              ),
              accountName: Text('Usuário'),
              accountEmail: Text('Usuário@email.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela Inicial'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
            ListTile(
              leading: Icon(Icons.outbox),
              title: Text('Logout'),
              subtitle: Text('Tela de Login'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Perfil'),
              subtitle: Text('Seu Perfil'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/perfil');
              },
            ),
            ListTile(
              leading: Icon(Icons.next_week),
              title: Text('Mercado de Trabalho'),
              subtitle: Text('Ofertas de Emprego'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/home');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Super Craques'),
        actions: [],
      ),
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
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text('O cadastro de '),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
