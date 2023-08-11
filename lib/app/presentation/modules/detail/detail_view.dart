import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/helpers/constants.dart';
import '../../../utils/screen_utils.dart';
import '../../global/controller/cat_breeds_controller.dart';
import '../../global/widgets/app_bar.dart';
import '../../global/widgets/subtitle.dart';
import '../../global/widgets/title_custom.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatBreedsController>(builder: (context, state, child) {
      final catSelected = state.stateCurrent.breed;
      return Scaffold(
        appBar: CustomAppBar(title: catSelected.name),
        body: Column(children: [
          SizedBox(
            width: context.screenWidth,
            height: context.screenHeigt * 0.4,
            child: Image.network(
              '${Constants.images}${catSelected.referenceImageId}.jpg',
              height: context.screenHeigt * 0.4,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
              width: context.screenWidth,
              height: context.screenHeigt * 0.48,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const TitleCustom(title: 'Origin'),
                      Subtitle(title: catSelected.origin ?? 'Desconocido'),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Description'),
                      Subtitle(title: catSelected.description ?? 'Desconocido'),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Temperament'),
                      Subtitle(title: catSelected.temperament ?? 'Desconocido'),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Dog Friendly'),
                      Subtitle(title: '${catSelected.dogFriendly}'),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Energy Level'),
                      Subtitle(title: '${catSelected.energyLevel}'),
                       SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Social Needs'),
                      Subtitle(title: '${catSelected.socialNeeds}'),
                       SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Wikipedia'),
                      Subtitle(title: '${catSelected.wikipediaUrl}'),
                      
                    ],
                  ),
                ),
              ))
        ]),
      );
    });
  }
}
