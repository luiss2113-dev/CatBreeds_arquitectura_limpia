import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

///Clase para verificaci[on] de conexi[on] con implementacion para web y mobile
class InternetChecker {
  Future<bool> hasInternet() async {
    try {
      if (kIsWeb) {
        final respnse = await get(Uri.parse('8.8.8.8'));
        return respnse.statusCode == 200;
      } else {
        final list = await InternetAddress.lookup('8.8.8.8');
        return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
      }
    } catch (e) {
      return false;
    }
  }
}
