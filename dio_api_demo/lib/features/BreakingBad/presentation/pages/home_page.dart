import 'package:dio_api_demo/features/BreakingBad/presentation/widgets/card_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/breakingbad_cubit.dart';
import '../cubit/breakingbad_state.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of data"),
      ),
      body: BlocBuilder<BreakingBadCubit, BreakingBadState>(
        builder: (context, state) {
          if (state is BreakingbadSuccess) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return CardContainer(item: state.characters[index]);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          BlocProvider.of<BreakingBadCubit>(context).getCharacterById(1);
        },
      ),
    );
  }
}
