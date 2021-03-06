import 'package:dio_api_demo/features/BreakingBad/presentation/cubit/breakingbad_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/BreakingBad/presentation/cubit/breakingbad_state.dart';
import 'features/BreakingBad/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  await di.init();
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
        create: (context) => sl<BreakingBadCubit>(),
        child: MyHomePage(),
      ),
    );
  }
}
