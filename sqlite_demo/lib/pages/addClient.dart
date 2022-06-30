import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/cubit/crud_cubit.dart';

import '../cubit/crud_state.dart';

class AddClient extends StatelessWidget {
  AddClient({Key? key}) : super(key: key);

  TextEditingController id = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<CrudCubit, CrudState>(
      listener: (context, state) {
        if (state is CrudSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text("Add Client"),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Id"),
                keyboardType: TextInputType.number,
                controller: id,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: InputDecoration(hintText: "First Name"),
                controller: firstName,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: InputDecoration(hintText: "Last Name"),
                controller: lastName,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CrudCubit>(context)
                        .createClient(id.text, firstName.text, lastName.text);
                  },
                  child: const Text("Create"))
            ],
          ),
        ),
      ),
    );
  }
}
