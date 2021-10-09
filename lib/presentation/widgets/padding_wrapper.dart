import 'package:flutter/material.dart';

import '../../constants/app_style.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget myWidget;
  final double pad;
  const PaddingWrapper({Key? key, required this.myWidget, this.pad = AppStyle.avgPadding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: myWidget,
    );
  }
}
