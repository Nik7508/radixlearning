import 'package:drift_demo/features/crud/data/datasources/local/database/employee_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/crud_state.dart';
import '../cubit/crud_cubit.dart';
import '../widgets/card_container.dart';
import 'addClient.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CrudCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of data"),
      ),
      body: BlocBuilder<CrudCubit, CrudState>(
        builder: (context, state) {
          if (state is CrudSuccess) {
            return ListView(
              children: List.generate(state.employees.length, (index) {
                return CardContainer(item: state.employees[index]);
              }),
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddClient(),
              ));
        },
      ),
    );
  }
}
