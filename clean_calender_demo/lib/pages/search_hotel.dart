import 'package:clean_calender_demo/widgets/search_hotel.dart';
import 'package:clean_calender_demo/widgets/select_dates.dart';
import 'package:clean_calender_demo/widgets/select_city_container.dart';
import 'package:clean_calender_demo/widgets/select_rooms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant.dart';
import '../cubit/calender_cubit.dart';
import '../cubit/calender_state.dart';

class SearchHotelsPage extends StatelessWidget {
  const SearchHotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalenderCubit>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.arrow_back,
                color: Colors.grey,
              )),
          title: const Text(
            'Hotels & Home stays',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: BlocBuilder<CalenderCubit, CalenderState>(
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    SelectCityContainer(
                      label: "CITY/AREA/LANDMARK/PROPERTY NAME",
                      detail: "Ahmedabad",
                      subDetail: "India",
                      iconData: Icons.location_on_outlined,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                                  value:
                                      BlocProvider.of<CalenderCubit>(context),
                                  child: SearchHotel(),
                                )));
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SelectCityContainer(
                            label: "CHECK-IN DATE",
                            detail: (cubit.inTime == null)
                                ? "Select Date"
                                : "${Constant.convertDate(cubit.inTime!)}",
                            subDetail: (cubit.inTime == null)
                                ? ""
                                : "${Constant.convertSubDate(cubit.inTime!)}",
                            iconData: Icons.calendar_today_rounded,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                        value: BlocProvider.of<CalenderCubit>(
                                            context),
                                        child: SelectDates(),
                                      )));
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: SelectCityContainer(
                            label: "CHECK-OUT DATE",
                            detail: (cubit.outTime == null)
                                ? "Select Date"
                                : "${Constant.convertDate(cubit.outTime!)}",
                            subDetail: (cubit.outTime == null)
                                ? ""
                                : "${Constant.convertSubDate(cubit.outTime!)}",
                            iconData: Icons.calendar_today_rounded,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                        value: BlocProvider.of<CalenderCubit>(
                                            context),
                                        child: SelectDates(),
                                      )));
                            },
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SelectCityContainer(
                        label: "rooms & Guests".toUpperCase(),
                        // detail: "1 Room, 2 Adults",
                        detail: "${cubit.rooms} Room",
                        iconData: Icons.person,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (_) => BlocProvider.value(
                                    value: cubit,
                                    child: SelectRoom(),
                                  ));
                        }),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          'SEARCH HOTELS',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightBlue[700],
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            );
          },
        ));
  }
}
