class BottomIndicatorState {
  final double index;
  BottomIndicatorState(this.index);
}

class BottomIndicatorInitialState extends BottomIndicatorState {
  BottomIndicatorInitialState() : super(1);
}

class BottomIndicatorIndexChangeState extends BottomIndicatorState {
  BottomIndicatorIndexChangeState(double index) : super(index);
}
