import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/screen_utils.dart';
import '../../../global/controller/cat_breeds_controller.dart';
import '../../../global/widgets/error_view.dart';
import '../../../global/widgets/subtitle.dart';
import '../../../routes/routes.dart';
import 'landig_cat.dart';

class ConsumerListCats extends StatelessWidget {
  final Function() callAgain;
  const ConsumerListCats({super.key, required this.callAgain});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatBreedsController>(
      builder: (context, value, child) {
        final listCatsBreed = value.stateCurrent.breeds;

        if (value.stateCurrent.failure != '') {
          return ErrorMessage(
              message: value.stateCurrent.failure, onPressed: () {});
        }

        if (listCatsBreed.isEmpty) {
          return const Center(
            child: Subtitle(title: 'No hay datos'),
          );
        }

        return SizedBox(
          width: double.infinity,
          height: context.screenHeigt * 0.9,
          child: ListView.builder(
            itemCount: listCatsBreed.length,
            itemBuilder: (context, index) {
              return LandingCat(
                breed: listCatsBreed[index],
                goToDetail: () {
                  value.selectBreed(listCatsBreed[index]);
                  Navigator.pushNamed(context, Routes.detail);
                },
              );
            },
          ),
        );
      },
    );
  }
}
