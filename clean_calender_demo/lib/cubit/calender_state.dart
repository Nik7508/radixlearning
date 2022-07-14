abstract class CalenderState {}

class CalenderInitial extends CalenderState {}

class DateSelectState extends CalenderState {
  final DateTime? inTime, outTime;

  DateSelectState({required this.inTime, required this.outTime});
}

class ErrorState extends CalenderState {
  final String error;

  ErrorState({required this.error});
}
