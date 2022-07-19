part of 'range_cubit.dart';

abstract class RangeState extends Equatable {}

class RangeInitial extends RangeState {
  @override
  List<Object?> get props => [];
}

class RangeChange extends RangeState {
  final double val1;
  final double val2;

  RangeChange({required this.val1, required this.val2});

  RangeChange copyWith({double? val1, double? val2}) {
    return RangeChange(val1: val1 ?? this.val1, val2: val2 ?? this.val2);
  }

  @override
  List<Object?> get props => [val1, val2];
}
