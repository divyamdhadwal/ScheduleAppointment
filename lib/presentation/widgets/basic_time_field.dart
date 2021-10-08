import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'text_field_design.dart';

class BasicTimeField extends StatelessWidget {
  final TextEditingController myController;
  final format = DateFormat("HH:mm");
  BasicTimeField({required this.myController});
  @override
  Widget build(BuildContext context) {
    return TextFieldDesign(
        formWidget: DateTimeField(
      controller: myController,
      decoration: InputDecoration(
        labelText: 'Pick a Time',
        border: InputBorder.none,
        suffixIcon: Icon(Icons.access_time_outlined),
      ),
      textInputAction: TextInputAction.done,
      format: format,
      onShowPicker: (context, currentValue) async {
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
        );
        return DateTimeField.convert(time);
      },
    ));
  }
}
