import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String title;
  final EdgeInsets padding;
  const Subtitle({
    super.key,
    this.title = 'Nombre Raza',
    this.padding = const EdgeInsets.all(10.0)
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .displayMedium),
    );
  }
}