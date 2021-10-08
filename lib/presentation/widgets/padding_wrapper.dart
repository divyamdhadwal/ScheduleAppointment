import 'package:flutter/material.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget myWidget;
  final double pad;
  const PaddingWrapper({Key? key, required this.myWidget, this.pad = 15.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(pad),
      child: myWidget,
    );
  }
}
