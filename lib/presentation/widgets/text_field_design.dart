import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../constants/app_style.dart';

class TextFieldDesign extends StatelessWidget {
  final Widget? formWidget;
  final double widgetMargin;
  final double verticalPadding;
  final double horizontalPadding;
  const TextFieldDesign({
    Key? key,
    this.formWidget,
    this.widgetMargin = AppStyle.avgPadding,
    this.verticalPadding = AppStyle.tfdVerticalPad,
    this.horizontalPadding = AppStyle.tfdHorizontalPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.all(widgetMargin),
      style: NeumorphicStyle(
        shadowLightColor: Colors.white,
        shadowDarkColor: Colors.black,
        color: AppStyle.backgroundColor,
        shape: NeumorphicShape.concave,
        depth: -3,
        boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(AppStyle.lessRadius)),
        lightSource: LightSource.topLeft,
      ),
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: formWidget,
    );
  }
}
