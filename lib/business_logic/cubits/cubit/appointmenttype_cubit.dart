import 'package:bloc/bloc.dart';

part 'appointmenttype_state.dart';

class AppointmenttypeCubit extends Cubit<AppointmentTypeState> {
  AppointmenttypeCubit()
      : super(AppointmentTypeState(
            currValue: 'Site Visit'));

  void changeCurrValue(value) => emit(AppointmentTypeState(currValue: value));
}
