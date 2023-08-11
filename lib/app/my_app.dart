import 'package:flutter/material.dart';

import 'presentation/global/themes.dart';
import 'presentation/routes/app_routes.dart';
import 'presentation/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      theme: AppTheme.lighTheme,
    );
  }
}
