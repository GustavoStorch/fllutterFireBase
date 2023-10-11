// ignore_for_file: file_names

import 'package:flutter/material.dart';

abstract class Cores {
  static const LinearGradient corDeFundoDegrade = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color.fromARGB(255, 199, 161, 246),
      Color.fromARGB(255, 158, 213, 240),
    ],
  );

  static const Color corAppNar = Color.fromARGB(255, 158, 213, 240);

  static const Color corBotaoLogin = Color(0xffffffff);

  static const Color corBotaoLoginSelecionado = Color.fromARGB(255, 92, 89, 89);

  static const Color corTextoBranco = Color(0xffffffff);

  static const Color corTextPreto = Color(0xFF000000);

  static const Color corFundoBranco = Color(0xffffffff);

  static const Color corFundoTextField = Color(0xffF2F2F2);

  static const Color corPlaceholderTextField = Color(0xff707070);

  static const Color corBotaoClose = Color(0xff727272);

  static const Color corBotaoCloseHover = Color.fromARGB(255, 88, 88, 88);

  static const Color corBotaoSingUp = Color(0xFF9EB9F0);

  static const Color corToastSucesso = Color(0xffD6ECC5);

  static const Color corIconeSucesso = Color(0xff0C5705);

  static const Color corTextoSucesso = Color(0xff373737);

  static const Color corToastErro = Color(0xffFFCCD2);

  static const Color corIconeToastBackgroundErro = Color(0xffC9000E);

  static const Color corToastBackgroundErro = Color(0xffFFCCD2);

  static const Color corToastBackgroundWarning = Color(0xffF6F5C0);

  static const Color corIconeToastWarning = Color(0xffE19D00);

  static const Color corIconeErro = Color(0xff9C160D);

  static const Color corFundoIconeErro = Color(0xffFFCCD2);

  static const Color corFonteErro = Color(0xff9C160D);

  static const Color corTextoErro = Color(0xff161616);
}
