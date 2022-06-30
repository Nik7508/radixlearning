import 'package:drift_demo/features/crud/data/datasources/local/database/employee_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/crud_cubit.dart';
import '../cubit/crud_state.dart';

class UpdateClient extends StatefulWidget {
  UpdateClient({
    Key? key,
    required this.employee,
  }) : super(key: key);

  final Employee employee;

  @override
  State<UpdateClient> createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  TextEditingController employeeId = TextEditingController();
  TextEditingController employeeName = TextEditingController();
  TextEditingController employeeSalary = TextEditingController();
  TextEditingController employeeJoiningDate = TextEditingController();

  @override
  void initState() {
    employeeId.text = widget.employee.employeeId.toString();
    employeeName.text = widget.employee.employeeName.toString();
    employeeSalary.text = widget.employee.employeeSalary.toString();
    employeeJoiningDate.text = widget.employee.employeeJoiningDate.toString();

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
                controller: employeeId,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "First Name"),
                controller: employeeName,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last Name"),
                controller: employeeSalary,
              ),
              const SizedBox(height: 18),
              TextFormField(
                decoration: const InputDecoration(hintText: "Last Name"),
                controller: employeeJoiningDate,
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CrudCubit>(context).updateClient(Employee(
                        employeeId: int.parse(employeeId.text),
                        employeeName: employeeName.text,
                        employeeSalary: int.parse(employeeSalary.text),
                        employeeJoiningDate: employeeJoiningDate.text));
                  },
                  child: const Text("Update"))
            ],
          ),
        ),
      ),
    );
  }
}
