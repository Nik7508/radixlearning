import 'package:drift_demo/features/crud/domain/usecases/add_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/delete_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/get_all_employee.dart';
import 'package:drift_demo/features/crud/domain/usecases/update_employee.dart';
import 'package:drift_demo/features/crud/presentation/cubit/crud_cubit.dart';
import 'package:get_it/get_it.dart';

import 'features/crud/data/datasources/local/daos/employee_dao.dart';
import 'features/crud/data/datasources/local/database/employee_database.dart';
import 'features/crud/data/repositories/employee_repository_impl.dart';
import 'features/crud/domain/repositories/employee_repository.dart';

var sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(
    () => CrudCubit(
        addEmployee: sl(),
        getAllEmployee: sl(),
        deleteEmployee: sl(),
        updateEmployee: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => AddEmployee(repository: sl()));
  sl.registerLazySingleton(() => GetAllEmployee(repository: sl()));
  sl.registerLazySingleton(() => UpdateEmployee(repository: sl()));
  sl.registerLazySingleton(() => DeleteEmployee(repository: sl()));

// Repository
  sl.registerLazySingleton<EmployeeRepository>(
    () => EmployeeRepositoryImpl(dao: sl()),
  );
  sl.registerSingleton(AppDataBase(openConnection()));
  // Dio client
  sl.registerSingleton<EmployeeDao>(EmployeeDao(sl()));
}
