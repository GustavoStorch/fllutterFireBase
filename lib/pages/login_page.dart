// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously, depend_on_referenced_packages, prefer_final_fields, unused_field, avoid_print

import 'package:flutter/material.dart';
import 'package:atividade_lista/componentes/campos/text_field_login_string.dart';
import 'package:atividade_lista/componentes/cores/Cores.dart';
import 'package:atividade_lista/componentes/fontes/fontes.dart';
import 'package:atividade_lista/componentes/botoes/login_buttom_widget.dart';
import 'package:atividade_lista/componentes/toast/toast_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextFieldLoginStringWidget txtUsuario = TextFieldLoginStringWidget(
    placeholder: 'Usuário',
    onFieldSubmitted: (String? str) {
      usuario = txtUsuario.text;
    },
  );

  late final TextFieldLoginStringWidget txtSenha = TextFieldLoginStringWidget(
    placeholder: 'Senha',
    onFieldSubmitted: (String? str) {
      senha = txtSenha.text;
    },
  );

  String usuario = '';
  String senha = '';
  bool? loginValido;
  bool _toastShown = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: Cores.corDeFundoDegrade,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 40.0)),
            Text(
              'Bem Vindo!.',
              style:
                  Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
            ),
            Text(
              'Realize seu Cadastro.',
              style:
                  Fontes.getRoboto(fontSize: 24.0, cor: Cores.corTextoBranco),
            ),
            const Padding(padding: EdgeInsets.only(top: 24)),
            SizedBox(
              width: fullWidth * 0.8,
              child: txtUsuario,
            ),
            const Padding(padding: EdgeInsets.only(top: 14)),
            SizedBox(
              width: fullWidth * 0.8,
              child: txtSenha,
            ),
            const SizedBox(height: 30.0),
            LoginButtomWidget(
              text: 'Cadastrar',
              onPressed: () => {
                cadastrarUsuario(txtUsuario.text, txtSenha.text),
              },
            ),
          ],
        ),
      ),
    );
  }

  void cadastrarUsuario(String usuarioRegistro, String senhaRegistro) async {
    print('Usuário: $usuarioRegistro\nSenha: $senhaRegistro');
    if (usuarioRegistro.isNotEmpty && senhaRegistro.isNotEmpty) {
      try {
        CollectionReference usuarios =
            FirebaseFirestore.instance.collection('Usuarios');

        await usuarios.add({
          'Usuario': usuarioRegistro,
          'Senha': senhaRegistro,
        });

        ToastUtils.showCustomToastSucess(
            context, 'Cadastro realizado com sucesso!');
      } catch (e) {
        ToastUtils.showCustomToastError(
            context, 'Erro ao cadastrar usuário: $e');
      }
    } else {
      ToastUtils.showCustomToastError(
          context, 'Por favor, preencha todos os campos!');
    }
  }
}
