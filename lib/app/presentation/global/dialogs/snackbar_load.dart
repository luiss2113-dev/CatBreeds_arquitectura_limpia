import 'package:flutter/material.dart';

void showToastCat(BuildContext context, {String? message = "Cargando ..."}) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      backgroundColor: Colors.black,
      content: Text(message!),
      action: SnackBarAction(
          label: 'Omitir', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
