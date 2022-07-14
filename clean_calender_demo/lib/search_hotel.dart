import 'package:clean_calender_demo/calender.dart';
import 'package:clean_calender_demo/select_city_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchHotelspage extends StatelessWidget {
  SearchHotelspage({Key? key}) : super(key: key);

  final checkInTime = DateTime.now();
  final checkOutTime = DateTime.now().add(const Duration(days: 1));
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
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
            'Hotels & Homestays',
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(children: [
                SelectCityContainer(
                  label: "CITY/AREA/LANDMARK/PROPERTY NAME",
                  detail: "Ahmedabad",
                  subdetail: "India",
                  iconData: Icons.location_on_outlined,
                  onTap: () {},
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SelectCityContainer(
                        label: "CHECK-IN DATE",
                        detail:
                            "${checkInTime.day} ${DateFormat("MMMM").format(checkInTime as DateTime).substring(0, 3)}  ",
                        subdetail:
                            "'${checkInTime.year.toString().substring(2)}, ${DateFormat('EEEE').format(checkInTime as DateTime).substring(0, 3)}",
                        iconData: Icons.calendar_today_rounded,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectCheckInDateInCalender(
                                    checkInTime: checkInTime,
                                    checkOutTime: checkOutTime,
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
                        detail:
                            "${checkOutTime.day} ${DateFormat("MMMM").format(checkOutTime as DateTime).substring(0, 3)}  ",
                        subdetail:
                            "'${checkOutTime.year.toString().substring(2)}, ${DateFormat('EEEE').format(checkOutTime as DateTime).substring(0, 3)}",
                        iconData: Icons.calendar_today_rounded,
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SelectCheckInDateInCalender(
                                    checkInTime: checkInTime,
                                    checkOutTime: checkOutTime,
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
                  detail: "1 Room, 2 Adults",
                  iconData: Icons.person,
                  onTap: () {
                    scaffoldKey.currentState!.showBottomSheet((context) {
                      return Container(
                        height: 100,
                        width: double.infinity,
                        color: Colors.black,
                      );
                    });
                  },
                ),
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
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
