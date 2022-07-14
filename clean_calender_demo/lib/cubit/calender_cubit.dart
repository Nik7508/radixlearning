import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CleanCalendarController? cleanCalendarController;

  CalenderCubit() : super(CalenderInitial());
  init(checkInTime, checkOutTime) {
    cleanCalendarController = CleanCalendarController(
        minDate: DateTime.now(),
        maxDate: DateTime.now().add(const Duration(days: 365)),
        onRangeSelected: (checkInTime, checkOutTime) {
          var ch = checkInTime;
          if (checkOutTime != null) {
            final diff = checkOutTime.difference(checkInTime).inDays;
            if (diff > 30) {
              emit(ErrorState(
                  error: "You can book hotel rooms for only 30 days."));
              emit(DateSelectState(inTime: checkInTime, outTime: null));
            } else {
              if (checkInTime == checkOutTime) {
                emit(DateSelectState(inTime: checkInTime, outTime: null));
              } else {
                emit(DateSelectState(
                    inTime: checkInTime, outTime: checkOutTime));
              }
            }
          } else {
            emit(DateSelectState(inTime: checkInTime, outTime: null));
          }
        },
        initialDateSelected: checkInTime,
        endDateSelected: checkOutTime);
  }

  clearCalender() {
    cleanCalendarController!.clearSelectedDates();
    emit(DateSelectState(
        inTime: DateTime.now(),
        outTime: DateTime.now().add(Duration(days: 1))));
  }
}
