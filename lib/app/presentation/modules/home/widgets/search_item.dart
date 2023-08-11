
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/screen_utils.dart';
import '../../../global/controller/cat_breeds_controller.dart';

class SearcherItem extends StatefulWidget {
  final TextEditingController controller;
  const SearcherItem({super.key, required this.controller});

  @override
  State<SearcherItem> createState() => _SearcherItemState();
}

class _SearcherItemState extends State<SearcherItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05),
      width: context.screenWidth,
      height: context.screenHeigt * 0.1,
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: widget.controller,
            style: const TextStyle(color: Colors.black),
            maxLines: 1,
            decoration: const InputDecoration(
                hintText: 'Buscar',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            keyboardType: TextInputType.text,
            onChanged: (value) {
              if (value == '') {
                Provider.of<CatBreedsController>(context, listen: false)
                    .filterCats('');
              }
            },
          )),
          IconButton(
              splashColor: Colors.amber,
              color: Colors.black,
              onPressed: () {
                if (widget.controller.text != '') {
                  Provider.of<CatBreedsController>(context, listen: false)
                      .filterCats(widget.controller.text);
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
    );
  }
}
