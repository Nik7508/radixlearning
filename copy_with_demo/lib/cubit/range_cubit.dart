import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'range_state.dart';

class RangeCubit extends Cubit<RangeChange> {
  RangeCubit() : super(RangeChange(val1: 0, val2: 0));

  void testCopy(val) {
    emit(state.copyWith(val1: val));
  }

  void testCopy2(val2) {
    emit(state.copyWith(val2: val2));
  }
}
