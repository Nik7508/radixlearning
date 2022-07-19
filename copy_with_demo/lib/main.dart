import 'package:copy_with_demo/cubit/range_cubit.dart';
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
          create: (context) => RangeCubit(),
          child: Range(),
        ));
  }
}

class Range extends StatelessWidget {
  const Range({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RangeCubit, RangeChange>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Slider(
                  value: state.val1,
                  onChanged: (val) {
                    BlocProvider.of<RangeCubit>(context).testCopy(val);
                  }),
              Slider(
                  value: state.val2,
                  onChanged: (val2) {
                    BlocProvider.of<RangeCubit>(context).testCopy2(val2);
                  })
            ],
          );
        },
      ),
    );
  }
}
