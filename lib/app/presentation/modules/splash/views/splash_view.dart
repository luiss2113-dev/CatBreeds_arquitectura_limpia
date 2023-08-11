import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../utils/screen_utils.dart';
import '../../../global/widgets/error_view.dart';
import '../../../routes/routes.dart';
import '../controller/splash_controler.dart';

///Vista de Splash para inicio de app
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool noInternet = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _verifyInternet();
    });
  }

  Future<void> _verifyInternet() async {
    setState(() {
      noInternet = false;
    });

    final hasInternet =
        await Provider.of<SplashController>(context, listen: false)
            .initSplash();

    if (hasInternet) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    } else {
      setState(() {
        noInternet = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = context.mediaQuery;

    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      width: media.size.width,
      height: media.size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: media.size.height * 0.01,
          ),
          SizedBox(
            height: media.size.height * 0.5,
            child: const Image(
              image: AssetImage('assets/images/title.jpg'),
            ),
          ),
          Lottie.asset(
            'assets/animations/animation_cat.zip',
            height: media.size.height * 0.25,
            width: media.size.width * 0.25,
          ),
          SizedBox(
            height: media.size.height * 0.01,
          ),
          if (noInternet)
            ErrorMessage(
                message: 'Verifica tu conexión a internet',
                onPressed: _verifyInternet)
        ],
      ),
    ));
  }
}
