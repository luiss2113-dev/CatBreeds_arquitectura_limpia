
import 'package:flutter/material.dart';

class TitleCustom extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  const TitleCustom({
    super.key,
    this.title = 'Nombre Raza',
    this.padding = const EdgeInsets.all(0.0)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(title,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold)),
    );
  }
}