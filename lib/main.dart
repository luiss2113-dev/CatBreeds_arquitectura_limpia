import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/my_app.dart';
import 'app/presentation/global/controller/cat_breeds_controller.dart';
import 'app/presentation/modules/home/controller/cat_breeds_state.dart';
import 'app/presentation/modules/splash/controller/splash_controler.dart';
import 'app/presentation/modules/splash/controller/splash_state.dart';
import 'app/utils/injections.dart';

void main() async {
  await initInjection();
  runApp(
      MultiProvider(providers: [
    ChangeNotifierProvider(
        create: (context) => CatBreedsController(const CatBreedsState(),
            catsBreedsRepository: getSl())),
    ChangeNotifierProvider(
        create: (context) => SplashController(const SplashState(),
            connectivityRepository: getSl())),
  ], child: const MyApp()));

}

