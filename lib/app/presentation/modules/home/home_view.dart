import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/controller/cat_breeds_controller.dart';
import '../../global/widgets/app_bar.dart';
import '../../global/widgets/loading_view.dart';
import '../../global/widgets/scafold_cumtom.dart';
import 'widgets/body_view_cats.dart';

///Vista de widgets de landing, lista de Cats
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<CatBreedsController>(context, listen: false)
            .getCateBeerds(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ScaffoldContainer(
                appBar: const CustomAppBar(),
                body: FadeIn(
                  child: ConsumerListCats(
                    callAgain: () {
                
                    },
                  ),
                ));
          }
          return Scaffold(
            body: FadeIn(child: const LoadingView()),
          );
        });
  }
}
