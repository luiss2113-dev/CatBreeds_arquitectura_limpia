import 'package:flutter/material.dart';

import '../../../../data/helpers/constants.dart';
import '../../../../domain/models/breeds.dart';
import '../../../../utils/screen_utils.dart';
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
                    title: breed.name ?? 'Desconocido',
                  ),
                  IconButton(
                      onPressed: goToDetail,
                      icon: const Icon(Icons.info_outline))
                ],
              ),
              const SizedBox(height: 5),
              Container(
                color: Colors.lightBlue,
                child: Image.network(
                  '${Constants.images}${breed.referenceImageId}.jpg',
                  height: context.screenHeigt * 0.23,
                  fit: BoxFit.fill,
                ),
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
