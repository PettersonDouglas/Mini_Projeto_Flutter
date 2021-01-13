import 'package:flutter/material.dart';
import 'package:teste/pages/bem_vindo_page.dart';

import 'package:teste/pages/cadastro_page.dart';

import 'package:teste/pages/home_page.dart';
import 'package:teste/pages/login_page.dart';
import 'package:teste/pages/news_page.dart';
import 'package:teste/pages/profile_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Geral',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/cadastro': (context) => CadastroPage(),
        '/perfil': (context) => ProfilePage(),
        '/bemvindo': (context) => BemVindoPage(),
        '/news': (contex) => NewsPage(),
      },
    );
  }
}
