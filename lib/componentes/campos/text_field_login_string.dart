// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, no_logic_in_create_state, overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:atividade_lista/componentes/cores/Cores.dart';
import 'package:atividade_lista/componentes/fontes/fontes.dart';

class TextFieldLoginStringWidget extends StatefulWidget {
  TextFieldLoginStringWidget({
    required this.placeholder,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
    Key? key,
  }) : super(key: key);

  final GlobalKey<_TextFieldLoginStringWidgetState> key =
      GlobalKey<_TextFieldLoginStringWidgetState>();

  final String placeholder;
  final String Function(String? str)? validator;
  final TextInputAction? textInputAction;
  final void Function(String? str)? onFieldSubmitted;

  String get text => key.currentState!.controller.text;

  bool valid() {
    if (validator != null) key.currentState!.validate();
    return key.currentState!.valid();
  }

  void validate() {
    if (validator != null) key.currentState!.validate();
  }

  @override
  State<TextFieldLoginStringWidget> createState() =>
      _TextFieldLoginStringWidgetState(
        textInputAction: textInputAction,
      );
}

class _TextFieldLoginStringWidgetState
    extends State<TextFieldLoginStringWidget> {
  _TextFieldLoginStringWidgetState({
    this.textInputAction,
  });
  final FocusNode focusNode = FocusNode();
  final TextInputAction? textInputAction;

  final TextEditingController controller = TextEditingController();
  bool visible = false;
  bool focused = false;
  String textChanged = '';
  String errorText = '';

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() => textChanged = controller.text);
    });
    focusNode.addListener(() {
      setState(() => focused = focusNode.hasFocus);
    });
    return Column(
      children: [
        Material(
          elevation: 5,
          shadowColor: Colors.grey,
          child: Container(
            decoration: const BoxDecoration(
              gradient: Cores.corDeFundoDegrade,
            ),
            child: TextField(
              textInputAction: textInputAction,
              onChanged: (value) {
                String error = '';
                if (widget.validator != null) {
                  String? validatedString = widget.validator!(value);
                  error = validatedString;
                }
                setState(() {
                  errorText = error;
                });
              },
              obscuringCharacter: '*',
              autocorrect: false,
              controller: controller,
              focusNode: focusNode,
              onSubmitted: widget.onFieldSubmitted,
              style: Fontes.getRoboto(
                cor: Cores.corTextPreto,
                fontSize: 19,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.4),
                label: Padding(
                  padding: focused || textChanged.isNotEmpty
                      ? const EdgeInsets.only(bottom: 24.0)
                      : const EdgeInsets.all(0),
                  child: Text(
                    widget.placeholder,
                    style: Fontes.getRoboto(
                      letterSpacing: 0,
                      cor: Colors.white,
                    ),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText.isNotEmpty ? Colors.red : Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText.isNotEmpty ? Colors.red : Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(1),
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: errorText.isNotEmpty ? Colors.red : Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: errorText.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    errorText,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bool valid() => errorText.isEmpty;

  void validate() {
    String error = '';
    if (widget.validator != null) {
      String? validatedString = widget.validator!(controller.text);
      error = validatedString;
    }
    setState(() {
      errorText = error;
    });
  }
}
