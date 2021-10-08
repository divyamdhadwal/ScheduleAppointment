import 'package:flutter/material.dart';

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
    this.height = 60.0,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      width: width,
      height: 60.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: gradient,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
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
