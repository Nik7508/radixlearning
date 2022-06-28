import 'package:drift_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift_demo/core/usecases/usecase.dart';
import 'package:drift_demo/features/crud/domain/repositories/employee_repository.dart';

import '../../data/datasources/local/database/employee_database.dart';

class GetAllEmployee extends UseCase<List<Employee>, NoParams> {
  final EmployeeRepository repository;

  GetAllEmployee({required this.repository});

  @override
  Future<Either<Failure, List<Employee>>> call(NoParams params) async {
    return await repository.getAllEmployee();
  }
}
