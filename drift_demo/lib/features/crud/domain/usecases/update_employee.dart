import 'package:drift_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:drift_demo/core/usecases/usecase.dart';
import '../../data/datasources/local/database/employee_database.dart';
import 'package:drift_demo/features/crud/domain/repositories/employee_repository.dart';

class UpdateEmployee extends UseCase<void, Employee> {
  final EmployeeRepository repository;

  UpdateEmployee({required this.repository});

  @override
  Future<Either<Failure, void>> call(Employee employee) async {
    return await repository.updateEmployee(employee);
  }
}
