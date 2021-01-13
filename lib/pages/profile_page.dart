import 'package:flutter/material.dart';
import 'package:teste/pages/news_page.dart';

import 'home_page.dart';

class ProfilePage extends StatefulWidget {
  final String nome, sobrenome, apelido, email, descricao;

  const ProfilePage({
    Key key,
    this.nome,
    this.sobrenome,
    this.apelido,
    this.email,
    this.descricao,
  }) : super(key: key);
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
              accountName: Text('${widget.nome}'),
              accountEmail: Text('${widget.email}'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('Tela Inicial'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      apelido: '${widget.apelido}',
                      nome: '${widget.nome}',
                      sobrenome: '${widget.sobrenome}',
                      email: '${widget.email}',
                      descricao: '${widget.descricao}',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Perfil'),
              subtitle: Text('Seu Perfil'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      apelido: '${widget.apelido}',
                      nome: '${widget.nome}',
                      sobrenome: '${widget.sobrenome}',
                      email: '${widget.email}',
                      descricao: '${widget.descricao}',
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.next_week),
              title: Text('Mercado de Trabalho'),
              subtitle: Text('Ofertas de Emprego'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewsPage(
                      apelido: '${widget.apelido}',
                      nome: '${widget.nome}',
                      sobrenome: '${widget.sobrenome}',
                      email: '${widget.email}',
                      descricao: '${widget.descricao}',
                    ),
                  ),
                );
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
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Perfil'),
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
            color: Colors.black.withOpacity(0.4),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Container(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.green[500],
                    child: Column(
                      children: [
                        Text(
                          '${widget.nome}, "${widget.apelido}" ${widget.sobrenome}',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Editar',
                              style: TextStyle(color: Colors.blueAccent),
                            )
                          ],
                        ),
                        Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          child: Image.asset(
                            'assets/images/logo.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Editar',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 10),
                          )
                        ],
                      ),
                      Text('' + widget.descricao),
                    ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
