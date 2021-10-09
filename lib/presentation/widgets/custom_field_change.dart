import 'package:flutter/material.dart';

class CustomFieldChange extends StatelessWidget {
  final TextEditingController myController;
  final Function onChangedEvent;
  final String hintText;
  const CustomFieldChange(
      {Key? key,
      required this.myController,
      required this.hintText,
      required this.onChangedEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:
          InputDecoration(labelText: hintText, border: InputBorder.none),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      onChanged: (res) => this.onChangedEvent(res),
      autocorrect: false,
      controller: myController,
      validator: (value) => null,
    );
  }
}
