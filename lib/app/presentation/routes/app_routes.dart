import 'package:flutter/material.dart';

import '../modules/detail/detail_view.dart';
import '../modules/home/home_view.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

///Generaci[on] de rutas como getter para control de navegaci[on]
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.home: (context) => const HomeView(),
    Routes.detail: (context) => const DetailView(),
  };
}
