import '../../data/datasources/local/database/employee_database.dart';

abstract class CrudState {}

class CrudInitial extends CrudState {}

class CrudLoading extends CrudState {}

class CrudError extends CrudState {
  final String error;

  CrudError({required this.error});
}

class CrudSuccess extends CrudState {
  final List<Employee> employees;

  CrudSuccess({required this.employees});
}
