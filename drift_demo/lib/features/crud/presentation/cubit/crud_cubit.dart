import 'dart:async';

import 'package:drift_demo/core/usecases/usecase.dart';
import 'package:drift_demo/features/crud/domain/usecases/add_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/delete_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/get_all_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/update_employee.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/local/database/employee_database.dart';
import 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  final AddEmployee addEmployee;
  final GetAllEmployee getAllEmployee;
  final DeleteEmployee deleteEmployee;
  final UpdateEmployee updateEmployee;

  CrudCubit(
      {required this.updateEmployee,
      required this.deleteEmployee,
      required this.getAllEmployee,
      required this.addEmployee})
      : super(CrudInitial()) {
    getData();
  }
  createClient(String employeeId, String employeeName, String employeeSalary,
      String employeeJoiningDate) async {
    emit(CrudLoading());
    if (employeeId.isEmpty) {
      emit(CrudError(error: "Please enter proper id"));
    } else if (employeeName.isEmpty) {
      emit(CrudError(error: "Please enter employee name"));
    } else if (employeeSalary.isEmpty) {
      emit(CrudError(error: "Please enter Salary"));
    } else if (employeeJoiningDate.isEmpty) {
      emit(CrudError(error: "Please enter joining date"));
    } else {
      var res = await addEmployee.call(Employee(
          employeeId: int.parse(employeeId),
          employeeName: employeeName,
          employeeSalary: int.parse(employeeSalary),
          employeeJoiningDate: employeeJoiningDate));
      res.fold(
        (failure) {
          print(failure);
        },
        (success) {
          getData();
        },
      );
    }
  }

  getData() async {
    var res = await getAllEmployee.call(NoParams());
    res.fold((failure) {
      emit(CrudSuccess(employees: []));
    }, (success) {
      emit(CrudSuccess(employees: success));
    });
  }

  deleteClient(Employee employee) async {
    emit(CrudLoading());
    var res = await deleteEmployee.call(employee);
    res.fold(
      (failure) {
        print(failure);
      },
      (success) {
        getData();
      },
    );
  }

  updateClient(Employee employee) async {
    emit(CrudLoading());
    if (employee.employeeName.isEmpty) {
      emit(CrudError(error: "Please enter employee name"));
    } else if (employee.employeeJoiningDate.isEmpty) {
      emit(CrudError(error: "Please enter joining date"));
    } else {
      var res = await updateEmployee.call(employee);
      res.fold(
        (failure) {
          print(failure);
        },
        (success) {
          getData();
        },
      );
    }
  }
}
