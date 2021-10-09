import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyType;
  final TextInputAction completeAction;
  final TextEditingController myController;
  final String hintText;
  const CustomTextFormField(
      {Key? key,
      this.keyType = TextInputType.name,
      this.completeAction = TextInputAction.next,
      required this.myController,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: hintText, border: InputBorder.none),
      keyboardType: keyType,
      textInputAction: completeAction,
      autocorrect: false,
      controller: myController,
      validator: (value) => null,
    );
  }
}
