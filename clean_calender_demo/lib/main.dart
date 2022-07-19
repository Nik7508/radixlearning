import 'package:clean_calender_demo/cubit/calender_cubit.dart';
import 'package:clean_calender_demo/pages/search_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CalenderCubit(),
        child: SearchHotelsPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
