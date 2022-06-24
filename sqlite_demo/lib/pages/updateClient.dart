import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/cubit/crud_cubit.dart';

import '../cubit/crud_state.dart';

class UpdateClient extends StatefulWidget {
  UpdateClient(
      {Key? key,
      required this.id,
      required this.firstName,
      required this.lastName})
      : super(key: key);

  final int id;
  final String firstName, lastName;

  @override
  State<UpdateClient> createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  TextEditingController id = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  @override
  void initState() {
    id.text = widget.id.toString();
    firstName.text = widget.firstName.toString();
    lastName.text = widget.lastName.toString();

    super.initState();
  }

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
          title: const Text("Update Client"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(enabled: false),
                keyboardType: TextInputType.number,
                controller: id,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "First Name"),
                controller: firstName,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last Name"),
                controller: lastName,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CrudCubit>(context)
                        .updateClient(id.text, firstName.text, lastName.text);
                  },
                  child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
