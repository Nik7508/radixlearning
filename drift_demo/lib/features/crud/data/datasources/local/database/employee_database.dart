import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

part 'employee_database.g.dart';

@DataClassName("Employee")
class EmployeeTable extends Table {
  IntColumn get employeeId => integer()();
  TextColumn get employeeName => text()();
  IntColumn get employeeSalary => integer()();
  TextColumn get employeeJoiningDate => text()();

  @override
  Set<Column> get primaryKey => {employeeId};
}

@DriftDatabase(tables: [EmployeeTable], daos: [])
class AppDataBase extends _$AppDataBase {
  AppDataBase(super.e);

  @override
  int get schemaVersion => 1;
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getDatabasesPath();
    final file = File(p.join(dbFolder, 'employeedb.sqlite'));
    return NativeDatabase(file);
  });
}
