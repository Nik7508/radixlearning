import 'package:dartz/dartz.dart';
import 'package:dio_api_demo/core/error/exception.dart';
import 'package:dio_api_demo/core/error/failure.dart';
import 'package:dio_api_demo/core/network/network_info.dart';
import 'package:dio_api_demo/features/BreakingBad/data/datasources/breaking_bad_character_remote_data_source.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';

abstract class BreakingBadCharacterRepository {
  Future<Either<Failure, List<BreakingBadCharacterModel>>> getAllCharacters();
  Future<Either<Failure, BreakingBadCharacterModel>> getCharacterById(int id);
  Future<Either<Failure, List<BreakingBadCharacterModel>>>
      getCharacterByCategory(String category);
  Future<Either<Failure, BreakingBadCharacterModel>> getRandomCharacter();
  Future<Either<Failure, List<BreakingBadCharacterModel>>> getCharacterByName(
      String name);
}

class BreakingBadCharacterRepositoryImpl
    extends BreakingBadCharacterRepository {
  final NetworkInfo networkInfo;
  final BreakingBadCharacterRemoteDataSource remoteDataSource;

  BreakingBadCharacterRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<BreakingBadCharacterModel>>>
      getAllCharacters() async {
    if (await networkInfo.isConnected()) {
      try {
        final res = await remoteDataSource.getAllCharacters();
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(SoketFailure());
      }
    } else {
      return Left(SoketFailure());
    }
  }

  @override
  Future<Either<Failure, List<BreakingBadCharacterModel>>>
      getCharacterByCategory(String category) async {
    if (await networkInfo.isConnected()) {
      try {
        final res = await remoteDataSource.getCharacterByCategory(category);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(SoketFailure());
      }
    } else {
      return Left(SoketFailure());
    }
  }

  @override
  Future<Either<Failure, BreakingBadCharacterModel>> getCharacterById(
      int id) async {
    if (await networkInfo.isConnected()) {
      try {
        final res = await remoteDataSource.getCharacterById(id);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(SoketFailure());
      }
    } else {
      return Left(SoketFailure());
    }
  }

  @override
  Future<Either<Failure, List<BreakingBadCharacterModel>>> getCharacterByName(
      String name) async {
    if (await networkInfo.isConnected()) {
      try {
        final res = await remoteDataSource.getCharacterByName(name);
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(SoketFailure());
      }
    } else {
      return Left(SoketFailure());
    }
  }

  @override
  Future<Either<Failure, BreakingBadCharacterModel>>
      getRandomCharacter() async {
    if (await networkInfo.isConnected()) {
      try {
        final res = await remoteDataSource.getRandomCharacter();
        return Right(res);
      } on ServerException {
        return Left(ServerFailure());
      } on SocketException {
        return Left(SoketFailure());
      }
    } else {
      return Left(SoketFailure());
    }
  }
}
