import 'package:flutter/material.dart';

import '../../../data/helpers/constants.dart';
import '../../../utils/screen_utils.dart';
import 'title_custom.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const CustomAppBar({super.key, this.title});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (title == null)
           Expanded(
                child:
            Image.asset(Constants.logo, fit: BoxFit.contain, height: 60)),
          if (title != null)
            Container(
                width: context.screenWidth * 0.77,
                alignment: Alignment.center,
                child:
                    TitleCustom(title: title!, padding: const EdgeInsets.all(0))),
        ],
      ),
      centerTitle: true,
    );
  }
}
