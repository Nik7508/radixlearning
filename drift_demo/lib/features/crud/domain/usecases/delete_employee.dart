import 'package:drift_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift_demo/core/usecases/usecase.dart';
import 'package:drift_demo/features/crud/domain/repositories/employee_repository.dart';

import '../../data/datasources/local/database/employee_database.dart';

class DeleteEmployee extends UseCase<void, Employee> {
  final EmployeeRepository repository;

  DeleteEmployee({required this.repository});

  @override
  Future<Either<Failure, void>> call(Employee employee) async {
    return await repository.deleteEmployee(employee);
  }
}
