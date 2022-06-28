import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/crud_cubit.dart';
import '../cubit/crud_state.dart';

class AddClient extends StatelessWidget {
  AddClient({Key? key}) : super(key: key);

  TextEditingController employeeId = TextEditingController();
  TextEditingController employeeName = TextEditingController();
  TextEditingController employeeSalary = TextEditingController();
  TextEditingController employeeJoiningDate = TextEditingController();

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
          title: const Text("Add Client"),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Id"),
                keyboardType: TextInputType.number,
                controller: employeeId,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Employee Name"),
                controller: employeeName,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Employee Salary"),
                controller: employeeSalary,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Employee j"),
                controller: employeeJoiningDate,
              ),
              const SizedBox(
                height: 9,
              ),
              BlocBuilder<CrudCubit, CrudState>(
                builder: (context, state) {
                  return Align(
                    alignment: const Alignment(.95, 0),
                    child: Text(
                      (state is CrudError) ? "*${state.error}" : "",
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 9),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CrudCubit>(context).createClient(
                        employeeId.text,
                        employeeName.text,
                        employeeSalary.text,
                        employeeJoiningDate.text);
                  },
                  child: const Text("Create"))
            ],
          ),
        ),
      ),
    );
  }
}
