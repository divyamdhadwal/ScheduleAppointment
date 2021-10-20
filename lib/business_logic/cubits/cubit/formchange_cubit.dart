import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'formchange_state.dart';

class FormchangeCubit extends Cubit<FormChangeState> {
  FormchangeCubit() : super(FormChangeState(showResults: false));

  void showResultsChange(val) => emit(FormChangeState(showResults: val));
}
