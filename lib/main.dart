import 'package:flutter/material.dart';

import 'presentation/screens/new_appointment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Appointment Screen',
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromRGBO(235, 244, 247, 1),
          primarySwatch: Colors.orange,
          fontFamily: 'Inter',
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromRGBO(235, 244, 247, 1),
            elevation: 0,
            textTheme: ThemeData.dark().textTheme.copyWith(
                headline6: TextStyle(
                    color: Colors.black87,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          )),
      routes: {
        NewAppointment.routeName: (ctx) =>
            NewAppointment(title: 'New Appointment')
      },
    );
  }
}
