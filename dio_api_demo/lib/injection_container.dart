import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio_api_demo/core/network/network_info.dart';
import 'package:dio_api_demo/features/BreakingBad/data/datasources/breaking_bad_character_remote_data_source.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/repositories/breaking_bad_character_repository.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_all_characters_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_character_by_category_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_character_by_id_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_character_by_name_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_random_character_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/presentation/cubit/breakingbad_cubit.dart';
import 'package:get_it/get_it.dart';

var sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => BreakingBadCubit(sl(), sl(), sl(), sl(), sl()));

  //usecases
  sl.registerLazySingleton(() => GetAllCharactersUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetRandomCharacterUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCharacterByIdUsecase(repository: sl()));
  sl.registerLazySingleton(
      () => GetCharacterByCategoryUsecase(repository: sl()));
  sl.registerLazySingleton(() => GetCharacterByNameUsecase(repository: sl()));

  //repository
  sl.registerLazySingleton<BreakingBadCharacterRepository>(() =>
      BreakingBadCharacterRepositoryImpl(
          networkInfo: sl(), remoteDataSource: sl()));

  //datasurces
  sl.registerLazySingleton<BreakingBadCharacterRemoteDataSource>(
      () => BreakingBadCharacterRemoteDataSourceImpl(dio: sl()));

  // external
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: Connectivity()));
  sl.registerLazySingleton(() => Dio());
}
