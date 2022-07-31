import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  double value_for_slider_presure = 0;
  double value_for_slider_levels = 0;
  double value_for_counter_presure = 0;
  double value_for_counter_levels = 0;

  bool clicked = false;

  void changeValueSliderpPresure(double value) {
    // changeValueCounterPresure();
    value_for_slider_presure = value;
    emit(ChanngeValueSliderSuccessState());
  }

  void changeValueSliderpLevels(double value) {
    //changeValueCounterPresure();
    value_for_slider_levels = value;
    emit(ChanngeValueSliderSuccessState());
  }

  void clickedBtn() {
    clicked = !clicked;
    emit(BtnClickedSuccessState());
  }
}
