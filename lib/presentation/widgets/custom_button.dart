import 'package:flutter/material.dart';

import '../../constants/app_style.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Gradient? gradient;
  final double? width;
  final double? height;
  final void Function() onPressed;

  const CustomButton({
    Key? key,
    required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = AppStyle.buttonHeight,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppStyle.avgPadding),
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppStyle.defRadius),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: AppStyle.btShadowColor,
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
