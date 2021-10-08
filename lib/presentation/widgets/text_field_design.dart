import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TextFieldDesign extends StatelessWidget {
  final Widget? formWidget;
  final double widgetMargin;
  final double verticalPadding;
  final double horizontalPadding;
  const TextFieldDesign({
    Key? key,
    this.formWidget,
    this.widgetMargin = 15.0,
    this.verticalPadding = 10,
    this.horizontalPadding = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: EdgeInsets.all(widgetMargin),
      style: NeumorphicStyle(
        shadowLightColor: Colors.white,
        shadowDarkColor: Colors.black,
        color: Color.fromRGBO(235, 244, 247, 1),
        shape: NeumorphicShape.concave,
        depth: -3,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(5)),
        lightSource: LightSource.topLeft,
      ),
      padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: horizontalPadding),
      child: formWidget,
    );
  }
}
