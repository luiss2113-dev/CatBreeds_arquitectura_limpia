import 'package:flutter/material.dart';

import '../../../../domain/models/breeds.dart';
import '../../../../utils/screen_utils.dart';
import '../../../global/widgets/images_custom.dart';
import '../../../global/widgets/subtitle.dart';

class LandingCat extends StatelessWidget {
  final Breeds breed;
  final Function() goToDetail;
  const LandingCat({
    super.key,
    required this.breed,
    required this.goToDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
        width: context.screenWidth,
        height: context.screenHeigt * 0.4,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Subtitle(
                    title: breed.nameCategory,
                  ),
                  IconButton(
                      onPressed: goToDetail,
                      icon: const Icon(Icons.info_outline))
                ],
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: context.screenWidth,
                height: context.screenHeigt * 0.23,
                child: Hero(
                    tag: breed.idImage,
                    child: ImageCustom(netWorkImageURL: breed.imageCat)),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Subtitle(
                    title: breed.origin ?? 'Desconocido',
                  ),
                  const SizedBox(width: 5),
                  Subtitle(
                    title: 'inteligencia ${breed.intelligence}',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
