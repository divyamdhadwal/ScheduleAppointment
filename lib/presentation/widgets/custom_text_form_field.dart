import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController myController;
  final String? hintText;
  const CustomTextFormField({Key? key,required this.myController, this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: hintText, border: InputBorder.none),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      controller: myController,
      validator: (value) => null,
    );
  }
}
