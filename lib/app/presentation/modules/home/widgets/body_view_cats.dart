import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/screen_utils.dart';
import '../../../global/controller/cat_breeds_controller.dart';
import '../../../global/dialogs/snackbar_load.dart';
import '../../../global/widgets/error_view.dart';
import '../../../global/widgets/subtitle.dart';
import '../../../routes/routes.dart';
import 'landig_cat.dart';
import 'search_item.dart';

class ConsumerListCats extends StatefulWidget {
  final Function() callAgain;
  const ConsumerListCats({super.key, required this.callAgain});

  @override
  State<ConsumerListCats> createState() => _ConsumerListCatsState();
}

class _ConsumerListCatsState extends State<ConsumerListCats> {
  late ScrollController _controller;
  final TextEditingController _controllerSearcher = TextEditingController();

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      if (_controllerSearcher.text == '') {
        Provider.of<CatBreedsController>(context, listen: false)
            .getNewCatsbreed();
        showToastCat(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CatBreedsController>(
      builder: (context, value, child) {
        final listCatsBreed = value.stateCurrent.breeds;

        if (value.stateCurrent.failure != '') {
          return ErrorMessage(
              message: value.stateCurrent.failure,
              onPressed: () {
                Provider.of<CatBreedsController>(context, listen: false)
                    .getCateBeerds();
              });
        }

        if (listCatsBreed.isEmpty) {
          return const Center(
            child: Subtitle(title: 'No hay datos'),
          );
        }

        return Column(
          children: [
            SearcherItem(controller: _controllerSearcher),
            SizedBox(
                width: context.screenWidth,
                height: context.screenHeigt * 0.8,
                child: ListView.builder(
                    controller: _controller,
                    itemCount: listCatsBreed.length,
                    itemBuilder: (context, index) {
                      return LandingCat(
                        breed: listCatsBreed[index],
                        goToDetail: () {
                          value.selectBreed(listCatsBreed[index]);
                          Navigator.pushNamed(context, Routes.detail);
                        },
                      );
                    })),
          ],
        );
      },
    );
  }
}
