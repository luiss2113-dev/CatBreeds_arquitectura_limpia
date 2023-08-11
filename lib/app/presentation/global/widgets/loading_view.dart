import 'package:flutter/material.dart';

import '../../../utils/screen_utils.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth,
      height: context.screenHeigt,
      child: const Center(child: CircularProgressIndicator()));
  }
}
