import 'dart:developer';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/bottom_indicator_cubit.dart';
import 'package:task2/pages/onBoardPage.dart';
import 'package:task2/style/colors.dart';

import 'cubit/bottom_indicator_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) => BottomIndicatorCubit(),
          child: Indicator(),
        ));
  }
}

class Indicator extends StatelessWidget {
  Indicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double index = 0;
    return Scaffold(
      backgroundColor: backgroundDark,
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            decoration: BoxDecoration(color: backgroundDark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/spadeIcon.png",
                  width: 70,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Daily reminders.".toUpperCase(),
                  style: TextStyle(
                      color: white, fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  "Stay on track with custom daily reminders.",
                  style: TextStyle(color: white, fontSize: 18),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<BottomIndicatorCubit, BottomIndicatorState>(
                      builder: (context, state) {
                        return DotsIndicator(
                          dotsCount: 5,
                          position: (state is BottomIndicatorIndexChangeState)
                              ? state.index
                              : 0,
                          decorator: DotsDecorator(
                            activeSize: const Size(24.0, 9.0),
                            activeColor: Colors.red,
                            color: white,
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<BottomIndicatorCubit>(context)
                            .nextIndicator();
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(color: white, fontSize: 24),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
