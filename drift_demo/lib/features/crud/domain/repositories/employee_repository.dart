import 'package:dartz/dartz.dart';
import 'package:drift_demo/core/error/failure.dart';

import '../../data/datasources/local/database/employee_database.dart';

abstract class EmployeeRepository {
  Future<Either<Failure, void>> addEmployee(Employee employee);
  Future<Either<Failure, void>> deleteEmployee(Employee employee);
  Future<Either<Failure, void>> updateEmployee(Employee employee);
  Future<Either<Failure, List<Employee>>> getAllEmployee();
}
