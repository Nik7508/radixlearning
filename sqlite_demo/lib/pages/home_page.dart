import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/core/db_helper.dart';
import 'package:sqlite_demo/widgets/card_container.dart';

import '../cubit/crud_state.dart';
import '../model/clientModel.dart';
import '../cubit/crud_cubit.dart';
import 'addClient.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<CrudCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("List of data")),
      body: BlocBuilder<CrudCubit, CrudState>(
        builder: (context, state) {
          print(state);
          if (state is CrudSuccess) {
            return FutureBuilder<List<Client>>(
              future: cubit.getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("No Data"),
                  );
                } else {
                  print("data" + snapshot.data.toString());
                  return ListView(
                    children: List.generate(snapshot.data!.length, (index) {
                      return CardContainer(item: snapshot.data![index]);
                    }),
                  );
                }
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
