import 'package:clean_calender_demo/cubit/calender_cubit.dart';
import 'package:clean_calender_demo/cubit/calender_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectRoom extends StatelessWidget {
  const SelectRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(
            elevation: 1,
            title: const Text(
              'Select Rooms',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
            ),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: [
              Container(
                padding: const EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const RoomGuestContainer(
            title: 'Number of rooms',
          ),
          const SizedBox(
            height: 8,
          ),
          // RoomGuestCount(
          //   title: 'Adults',
          //   subTitle: "Age 13 years & above",
          // ),
          // RoomGuestCount(
          //   title: 'Children',
          //   subTitle: "Age 12 years & below",
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('DONE'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RoomGuestContainer extends StatelessWidget {
  const RoomGuestContainer({
    Key? key,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CalenderCubit>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
                text: TextSpan(
                    text: title,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    children: [
                  TextSpan(
                    text: (subTitle == null) ? "" : "\n$subTitle",
                    style: TextStyle(
                        color: Colors.grey.withOpacity(.7), fontSize: 14),
                  )
                ])),
            Container(
                height: 32,
                width: 80,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey.shade400),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(6))),
                child: BlocBuilder<CalenderCubit, CalenderState>(
                  builder: (context, state) {
                    return DropdownButton(
                      underline: const SizedBox(),
                      value: cubit.rooms,
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.blue,
                      ),
                      items: List.generate(20, (index) {
                        index += 1;
                        return DropdownMenuItem(
                            value: index.toString(),
                            child: Text(index.toString()));
                      }),
                      onChanged: (String? value) {
                        cubit.selectRoom(value!);
                      },
                    );
                  },
                ))
          ],
        ));
  }
}
