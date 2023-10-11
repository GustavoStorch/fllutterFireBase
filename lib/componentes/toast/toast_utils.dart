// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:atividade_lista/componentes/cores/Cores.dart';
import 'package:flutter/material.dart';

enum ToastType { success, error, warning }

class ToastUtils {
  static BuildContext? routerOutletContext;
  static const int SECONDS_DURATION = 7;
  static OverlayState? state;

  static void showCustomToastSucess(BuildContext? context, String message) =>
      insertToast(
        routerOutletContext == null ? context! : routerOutletContext!,
        _createOverlayEntry(
          message,
          ToastType.success,
        ),
      );

  static void showCustomToastError(BuildContext? context, String message) =>
      insertToast(
        routerOutletContext == null ? context! : routerOutletContext!,
        _createOverlayEntry(
          message,
          ToastType.error,
        ),
      );

  static void showCustomToastWarning(BuildContext? context, String message) =>
      insertToast(
        routerOutletContext == null ? context! : routerOutletContext!,
        _createOverlayEntry(
          message,
          ToastType.warning,
        ),
      );

  static void insertToast(BuildContext context, OverlayEntry overlay) {
    OverlayState? state = Overlay.maybeOf(context);
    if (state != null) {
      state.insert(overlay);
      Timer(
        const Duration(seconds: SECONDS_DURATION),
        () {
          overlay.remove();
        },
      );
    }
  }

  static Icon _getIconByType(ToastType type) {
    switch (type) {
      case ToastType.error:
        return const Icon(
          Icons.cancel,
          fill: 1,
          color: Cores.corIconeToastBackgroundErro,
        );
      case ToastType.success:
        return const Icon(
          Icons.check_circle,
          color: Cores.corIconeSucesso,
        );
      case ToastType.warning:
        return const Icon(
          Icons.cancel,
          fill: 1,
          color: Cores.corIconeToastWarning,
        );
    }
  }

  static String _getTextByType(ToastType type) {
    switch (type) {
      case ToastType.error:
        return 'Erro';
      case ToastType.success:
        return 'Sucesso';
      case ToastType.warning:
        return 'Atenção';
    }
  }

  static Color _getCorByType(ToastType type) {
    switch (type) {
      case ToastType.error:
        return Cores.corToastBackgroundErro;
      case ToastType.success:
        return Cores.corToastSucesso;
      case ToastType.warning:
        return Cores.corToastBackgroundWarning;
    }
  }

  static OverlayEntry _createOverlayEntry(
    String message,
    ToastType type,
  ) {
    OverlayEntry? entry;
    entry = OverlayEntry(
      maintainState: false,
      builder: (context) {
        return Positioned(
          top: 30,
          width: 400,
          right: 0,
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              onTap: () {
                if (entry != null) entry.remove();
              },
              child: Container(
                constraints: const BoxConstraints(minHeight: 60),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 13,
                  bottom: 10,
                ),
                decoration: BoxDecoration(
                  color: _getCorByType(type),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    _getIconByType(type),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          _getTextByType(type),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Wrap(
                          children: [
                            SizedBox(
                              width: 260,
                              child: Text(
                                message,
                                softWrap: true,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Cores.corTextoSucesso,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
    return entry;
  }
}
