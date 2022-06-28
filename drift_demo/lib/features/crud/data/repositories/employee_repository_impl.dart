import 'package:drift_demo/core/error/exception.dart';
import 'package:drift_demo/features/crud/data/datasources/local/daos/employee_dao.dart';

import 'package:drift_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift_demo/features/crud/domain/repositories/employee_repository.dart';

import '../datasources/local/database/employee_database.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeDao dao;

  EmployeeRepositoryImpl({required this.dao});

  @override
  Future<Either<Failure, void>> addEmployee(Employee employee) async {
    try {
      await dao.insertEmployee(employee);
      return Right(null);
    } on InsertException {
      return Left(InsertFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteEmployee(Employee employee) async {
    try {
      await dao.deleteEmployee(employee);
      return Right(null);
    } on InsertException {
      return Left(InsertFailure());
    }
  }

  @override
  Future<Either<Failure, List<Employee>>> getAllEmployee() async {
    final res = await dao.getEmployee();
    return Right(res);
  }

  @override
  Future<Either<Failure, void>> updateEmployee(Employee employee) async {
    print("dsf" + employee.toString());
    try {
      await dao.updateEmployee(employee);
      return Right(null);
    } on InsertException {
      return Left(InsertFailure());
    }
  }
}
