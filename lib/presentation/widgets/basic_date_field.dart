import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'text_field_design.dart';

class BasicDateField extends StatelessWidget {
  final TextEditingController myController;
  final format = DateFormat("yyyy-MM-dd");
  BasicDateField({required this.myController});
  @override
  Widget build(BuildContext context) {
    return TextFieldDesign(
        formWidget: DateTimeField(
      decoration: InputDecoration(
        labelText: 'Pick a Date',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.calendar_today),
      ),
      textInputAction: TextInputAction.next,
      controller: myController,
      format: format,
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
    ));
  }
}
