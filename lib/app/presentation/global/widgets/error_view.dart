import 'package:flutter/material.dart';

import 'subtitle.dart';

class ErrorMessage extends StatelessWidget {
  final Function() onPressed;
  final String message;
  const ErrorMessage(
      {super.key, required this.onPressed, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Subtitle(title: message),
        ),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.refresh))
      ],
    );
  }
}
