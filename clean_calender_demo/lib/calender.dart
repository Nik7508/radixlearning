import 'package:clean_calender_demo/select_city_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import 'cubit/calender_cubit.dart';
import 'cubit/calender_state.dart';

class SelectCheckInDateInCalender extends StatelessWidget {
  late DateTime? checkInTime, checkOutTime;

  SelectCheckInDateInCalender(
      {super.key, required this.checkInTime, required this.checkOutTime});

  final cubit = CalenderCubit();

  @override
  Widget build(BuildContext context) {
    cubit.init(checkInTime, checkOutTime);
    return BlocConsumer<CalenderCubit, CalenderState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      bloc: cubit,
      builder: (context, state) {
        if (state is DateSelectState) {
          checkInTime = state.inTime;
          checkOutTime = state.outTime;
          cubit.init(checkInTime, checkOutTime);
        }

        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            title: const Text(
              "Select Dates",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  cubit.clearCalender();
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                      child: Text(
                    'reset'.toUpperCase(),
                    style: const TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400)),
                    child: ScrollableCleanCalendar(
                      calendarController: cubit.cleanCalendarController!,
                      layout: Layout.BEAUTY,
                      calendarCrossAxisSpacing: 0,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(children: [
                    Row(
                      children: [
                        Expanded(
                          child: SelectCityContainer(
                            label: "CHECK-IN DATE",
                            detail: (checkInTime == null)
                                ? "Select Date"
                                : "${checkInTime!.day} ${DateFormat("MMMM").format(checkInTime as DateTime).substring(0, 3)}",
                            subdetail: (checkInTime == null)
                                ? ""
                                : "'${checkInTime!.year.toString().substring(2)}, ${DateFormat('EEEE').format(checkInTime as DateTime).substring(0, 3)}",
                            iconData: Icons.calendar_today_rounded,
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SelectCityContainer(
                            label: "CHECK-OUT DATE",
                            detail: (checkOutTime == null)
                                ? "Select Date"
                                : "${checkOutTime!.day} ${DateFormat("MMMM").format(checkOutTime as DateTime).substring(0, 3)}",
                            subdetail: (checkOutTime == null)
                                ? ""
                                : "'${checkOutTime!.year.toString().substring(2)}, ${DateFormat('EEEE').format(checkOutTime as DateTime).substring(0, 3)}",
                            iconData: Icons.calendar_today_rounded,
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            "checkInTime": checkInTime,
                            "checkOutTime": checkOutTime
                          });
                        },
                        child: const Text(
                          'DONE',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
