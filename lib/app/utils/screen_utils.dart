import 'package:flutter/material.dart';

///Clase extensi[on] de pantalla con contexto para obtener size de ancestros
extension ScreenUtilExt on BuildContext {
  MediaQueryData get mediaQuery {
    final media = findAncestorWidgetOfExactType<MediaQuery>();
    return media!.data;
  }

  Size get screenSize => mediaQuery.size;

  double get screenHeigt => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;

}
