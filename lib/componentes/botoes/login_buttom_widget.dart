// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:atividade_lista/componentes/cores/Cores.dart';

class LoginButtomWidget extends StatefulWidget {
  const LoginButtomWidget({
    required this.onPressed,
    this.readonly = false,
    required this.text,
    Key? key,
  });

  final void Function()? onPressed;
  final bool readonly;
  final String text;

  @override
  State<LoginButtomWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtomWidget> {
  bool hovered = false;
  bool valid = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onHover: (bool hover) => setState(() => hovered = hover),
      style: ElevatedButton.styleFrom(
        backgroundColor:
            hovered ? Cores.corBotaoLoginSelecionado : Cores.corBotaoLogin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: !valid || widget.readonly ? null : widget.onPressed,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 50,
          maxWidth: 280,
        ),
        width: size.width * .95,
        height: size.height * .95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.text,
              style: const TextStyle(color: Cores.corTextPreto),
            ),
          ],
        ),
      ),
    );
  }
}
