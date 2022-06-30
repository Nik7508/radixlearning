import 'package:equatable/equatable.dart';

class Employee extends Equatable {
  int? employeeId;
  String? employeeName;
  int? employeeSalary;
  String? employeeJoiningDate;

  Employee(
      {this.employeeId,
      this.employeeName,
      this.employeeSalary,
      this.employeeJoiningDate});

  @override
  List<Object?> get props =>
      [employeeId, employeeName, employeeSalary, employeeJoiningDate];
}
