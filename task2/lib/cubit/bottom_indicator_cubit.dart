import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/bottom_indicator_state.dart';

class BottomIndicatorCubit extends Cubit<BottomIndicatorState> {
  var index;
  BottomIndicatorCubit() : super(BottomIndicatorInitialState()) {
    index = state.index;
  }

  nextIndicator() {
    log("call");
    if (index < 5) {
      emit(BottomIndicatorIndexChangeState(index++));
    }
  }
}
