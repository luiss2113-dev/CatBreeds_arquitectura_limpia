import 'package:flutter/material.dart';

import '../../../data/helpers/constants.dart';
import '../../../utils/screen_utils.dart';

class ImageCustom extends StatelessWidget {
  final String netWorkImageURL;
  const ImageCustom({super.key, required this.netWorkImageURL});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      netWorkImageURL,
      fit: BoxFit.fill,
      // When image is loading from the server it takes some time
      // So we will show progress indicator while loading
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    loadingProgress.expectedTotalBytes!
                : null,
          ),
        );
      },
      errorBuilder: (context, exception, stackTrace) {
        return Image.asset(
          Constants.errorImage,
          fit: BoxFit.cover,
          height: context.screenHeigt * 0.23,
          width: double.infinity,
        );
      },
    );
  }
}
