import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/screen_utils.dart';
import '../../global/controller/cat_breeds_controller.dart';
import '../../global/widgets/app_bar.dart';
import '../../global/widgets/images_custom.dart';
import '../../global/widgets/subtitle.dart';
import '../../global/widgets/title_custom.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

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
            child: Hero(
                tag: catSelected.idImage,
                child: ImageCustom(
                  netWorkImageURL: catSelected.imageCat,
                )),
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
                      Subtitle(title: catSelected.originCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Description'),
                      Subtitle(title: catSelected.descriptionCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Temperament'),
                      Subtitle(title: catSelected.temperamentCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Dog Friendly'),
                      Subtitle(title: catSelected.dogFriendlyCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Energy Level'),
                      Subtitle(title: catSelected.energyLevelCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Social Needs'),
                      Subtitle(title: catSelected.socialNeedsCat),
                      SizedBox(height: context.screenHeigt * 0.01),
                      const TitleCustom(title: 'Wikipedia'),
                      InkWell(
                        onTap: () =>
                            _launchUrl(Uri.parse(catSelected.wikipediaUrlCat)),
                        child: const Text(
                          'Saber Más',
                          style: TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ]),
      );
    });
  }
}
