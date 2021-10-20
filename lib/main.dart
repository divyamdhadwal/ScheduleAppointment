import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_appointment/business_logic/cubits/cubit/formchange_cubit.dart';

import 'constants/app_style.dart';
import 'business_logic/cubits/cubit/appointmenttype_cubit.dart';
import 'presentation/screens/new_appointment.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppointmenttypeCubit>(
          create: (BuildContext context) => AppointmenttypeCubit(),
        ),
        BlocProvider<FormchangeCubit>(
            create: (BuildContext context) => FormchangeCubit())
      ],
      //create: (context) => AppointmenttypeCubit(),
      child: MaterialApp(
          title: 'New Appointment Screen',
          theme: ThemeData(
              scaffoldBackgroundColor: AppStyle.backgroundColor,
              primarySwatch: AppStyle.primarySwatchColor,
              fontFamily: AppStyle.defFontStyle,
              appBarTheme: AppBarTheme(
                backgroundColor: AppStyle.backgroundColor,
                elevation: 0,
                textTheme: ThemeData.dark().textTheme.copyWith(
                    headline6: TextStyle(
                        color: Colors.black87,
                        fontSize: AppStyle.h6Font,
                        fontWeight: FontWeight.bold)),
              )),
          routes: {
            NewAppointment.routeName: (ctx) =>
                NewAppointment(title: 'New Appointment')
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(
                builder: (ctx) => NewAppointment(title: 'New Appointment'));
          }),
    );
  }
}
