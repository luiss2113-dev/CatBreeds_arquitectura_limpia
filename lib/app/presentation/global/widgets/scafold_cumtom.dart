import 'package:flutter/material.dart';

class ScaffoldContainer extends StatefulWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;

  const ScaffoldContainer({
    Key? key,
    this.body,
    this.appBar,
  }) : super(key: key);

  @override
  State<ScaffoldContainer> createState() => _ScaffoldContainerState();
}

class _ScaffoldContainerState extends State<ScaffoldContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widget.appBar,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: [
                widget.body ?? Container(),
              ],
            ),
          ),
        ));
  }
}
