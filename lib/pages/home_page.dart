import 'package:flutter/material.dart';
import 'package:teste/pages/news_page.dart';
import 'package:teste/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  final String nome, email, apelido, descricao, sobrenome;
  const HomePage({
    Key key,
    this.nome,
    this.sobrenome,
    this.apelido,
    this.email,
    this.descricao,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                  }),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Notícia 1',
                          style: TextStyle(
                            backgroundColor: Colors.green,
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          child: Text(
                            'Notícia relacionada a futebol e clubes contratando',
                            style: TextStyle(
                                backgroundColor: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Card(
                  child: SizedBox(
                    child: Text(
                      'Notícia 2',
                      style: TextStyle(
                        backgroundColor: Colors.green,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    'Notícia 3',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  child: Text(
                    'Notícia 4',
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
