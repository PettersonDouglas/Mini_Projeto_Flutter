import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teste/pages/bem_vindo_page.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;

  String nome,
      sobrenome,
      apelido,
      email,
      senha,
      descricao,
      cpf,
      dataNascimento,
      cep;

  _sendForm() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print("Nome $nome");
      print("CPF $cpf");
      print("Email $email");
      print("Sobrenome $sobrenome");
      print("CEP $cep");
      print("Apelido $apelido");
      print("Senha $senha");
      print("Descrição $descricao");
      print("Data de Nascimento $dataNascimento");
    } else {
      setState(
        () {
          _validate = true;
        },
      );
    }
  }

  _bemVindo() {
    if (nome != null &&
        cpf != null &&
        email != null &&
        sobrenome != null &&
        apelido != null &&
        dataNascimento != null &&
        descricao != null &&
        senha != null) {
      print('tudo ok');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BemVindoPage(
            apelido: '$apelido',
            nome: '$nome',
            sobrenome: '$sobrenome',
            email: '$email',
            descricao: '$descricao',
          ),
        ),
      );
    }
  }

  Widget _formUI() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Nome',
            icon: Icon(
              Icons.perm_identity,
            ),
          ),
          maxLength: 15,
          validator: _validarNome,
          onSaved: (String val) {
            nome = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Sobrenome',
            icon: Icon(
              Icons.person,
            ),
          ),
          maxLength: 15,
          validator: _validarSobrenome,
          onSaved: (String val) {
            sobrenome = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Apelido',
            icon: Icon(
              Icons.person_pin_rounded,
            ),
          ),
          maxLength: 15,
          validator: _validarApelido,
          onSaved: (String val) {
            apelido = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'Data de Nascimento',
              icon: Icon(
                Icons.cake,
              )),
          keyboardType: TextInputType.phone,
          maxLength: 8,
          validator: _validarDataNascimento,
          onSaved: (String val) {
            dataNascimento = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'CPF', icon: Icon(Icons.dock)),
          keyboardType: TextInputType.phone,
          maxLength: 11,
          validator: _validarCpf,
          onSaved: (String val) {
            cpf = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
              hintText: 'CEP', icon: Icon(Icons.house_outlined)),
          keyboardType: TextInputType.phone,
          maxLength: 8,
          validator: _validarCep,
          onSaved: (String val) {
            cep = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Email',
            icon: Icon(
              Icons.email,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          maxLength: 40,
          validator: _validarEmail,
          onSaved: (String val) {
            email = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Descrição',
            icon: Icon(
              Icons.speaker_notes,
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          maxLength: 150,
          validator: _validarDescricao,
          onSaved: (String val) {
            descricao = val;
          },
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Senha',
            icon: Icon(Icons.lock),
          ),
          keyboardType: TextInputType.emailAddress,
          maxLength: 16,
          validator: _validarSenha,
          onSaved: (String val) {
            senha = val;
          },
          obscureText: true,
        ),
        SizedBox(height: 15.0),
        RaisedButton(
          textColor: Colors.white,
          color: Colors.green[800],
          onPressed: () {
            _sendForm();
            _bemVindo();
          },
          child: Text('Cadastrar'),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: Text('Cadastro'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(15.0),
            child: Form(
              key: _key,
              autovalidate: _validate,
              child: _formUI(),
            ),
          ),
        ),
      ),
    );
  }
}

String _validarNome(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  return null;
}

String _validarSobrenome(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o sobrenome";
  } else if (!regExp.hasMatch(value)) {
    return "O sobrenome deve conter caracteres de a-z ou A-Z";
  }
  return null;
}

String _validarApelido(String value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o apelido";
  } else if (!regExp.hasMatch(value)) {
    return "O apelido deve conter caracteres de a-z ou A-Z";
  }
  return null;
}

String _validarCpf(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o CPF";
  } else if (value.length != 11) {
    return "O CPF deve ter 11 dígitos";
  } else if (!regExp.hasMatch(value)) {
    return "O número do CPF  deve conter apenas dígitos";
  }
  return null;
}

String _validarDataNascimento(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe a data de nascimento no formato dd/mm/aaaa";
  } else if (value.length != 8) {
    return "A data de nascimento deve ter 8 dígitos";
  } else if (!regExp.hasMatch(value)) {
    return "A data de nascimento  deve conter apenas dígitos";
  }
  return null;
}

String _validarCep(String value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe o CEP";
  } else if (value.length != 8) {
    return "O CEP deve ter 8 dígitos";
  } else if (!regExp.hasMatch(value)) {
    return "O CEP deve conter apenas dígitos";
  }
  return null;
}

String _validarEmail(String value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(pattern);
  if (value.length == 0) {
    return "Informe o Email";
  } else if (!regExp.hasMatch(value)) {
    return "Email inválido!";
  } else {
    return null;
  }
}

String _validarSenha(String value) {
  String patttern = r'(^[a-zA-Z\-0-9\^<>()[\]\\.,;:\s@\" ]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Informe a senha";
  } else if (!regExp.hasMatch(value)) {
    return "A senha não pode conter caracteres especiais";
  }
  return null;
}

String _validarDescricao(String value) {
  String patttern = r'(^[a-zA-Z\-0-9\^<>()[\]\\.,~;ãÃâÂéçiçÉêÊíÍ:\s@\"]*$)';
  RegExp regExp = new RegExp(patttern);
  if (value.length == 0) {
    return "Descrição de Perfil";
  } else if (!regExp.hasMatch(value)) {
    return "A descrição não pode conter caracteres especiais";
  }
  return null;
}
