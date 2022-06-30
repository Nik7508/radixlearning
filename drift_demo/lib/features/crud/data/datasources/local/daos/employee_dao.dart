import 'package:drift/drift.dart';

import '../../../../../../core/error/exception.dart';

import '../database/employee_database.dart';
part 'employee_dao.g.dart';

@DriftAccessor(tables: [EmployeeTable])
class EmployeeDao extends DatabaseAccessor<AppDataBase>
    with _$EmployeeDaoMixin {
  final AppDataBase db;

  EmployeeDao(this.db) : super(db);

  Future<void> insertEmployee(Employee employee) async {
    try {
      await into(employeeTable).insert(employee);
    } catch (err) {
      print(err);
      throw ServerException();
    }
  }

  Future<void> deleteEmployee(Employee employee) async {
    try {
      await delete(employeeTable).delete(employee);
    } catch (err) {
      print(err);
      throw ServerException();
    }
  }

  Future<void> updateEmployee(Insertable<Employee> employee) async {
    print("sdas" + employee.toString());
    try {
      await update(employeeTable).replace(employee);
    } catch (err) {
      print(err);
      throw ServerException();
    }
  }

  Future<List<Employee>> getEmployee() async {
    try {
      var res = await select(employeeTable).get();
      return res;
    } catch (err) {
      print(err);
      throw ServerException();
    }
  }
}
