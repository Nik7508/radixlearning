import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio_api_demo/core/constants/Strings.dart';
import 'package:dio_api_demo/core/error/exception.dart';

import '../../domain/models/breaking_bad_character_model.dart';

abstract class BreakingBadCharacterRemoteDataSource {
  Future<List<BreakingBadCharacterModel>> getAllCharacters();
  Future<BreakingBadCharacterModel> getCharacterById(int id);
  Future<List<BreakingBadCharacterModel>> getCharacterByCategory(
      String category);
  Future<BreakingBadCharacterModel> getRandomCharacter();
  Future<List<BreakingBadCharacterModel>> getCharacterByName(String name);
}

class BreakingBadCharacterRemoteDataSourceImpl
    extends BreakingBadCharacterRemoteDataSource {
  final Dio dio;

  BreakingBadCharacterRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<BreakingBadCharacterModel>> getAllCharacters() async {
    try {
      String url = "${Strings.BaseUrl}characters";
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        List<BreakingBadCharacterModel> charactersList = [];
        final jsonList = res.data;

        for (var element in jsonList) {
          charactersList.add(BreakingBadCharacterModel.fromJson(element));
        }
        return charactersList;
      } else {
        throw ServerException();
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.connectTimeout) {
        throw SocketException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<BreakingBadCharacterModel>> getCharacterByCategory(
      String category) async {
    try {
      String url = "${Strings.BaseUrl}characters";
      final res = await dio.get(url, queryParameters: {"category": category});
      if (res.statusCode == 200) {
        List<BreakingBadCharacterModel> charactersList = [];
        final jsonList = res.data;

        for (var element in jsonList) {
          charactersList.add(BreakingBadCharacterModel.fromJson(element));
        }
        return charactersList;
      } else {
        throw ServerException();
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.connectTimeout) {
        throw SocketException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BreakingBadCharacterModel> getCharacterById(int id) async {
    try {
      String url = "${Strings.BaseUrl}characters/$id";
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        List<BreakingBadCharacterModel> charactersList = [];
        final jsonList = res.data;

        for (var element in jsonList) {
          charactersList.add(BreakingBadCharacterModel.fromJson(element));
        }
        return charactersList[0];
      } else {
        throw ServerException();
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.connectTimeout) {
        throw SocketException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<List<BreakingBadCharacterModel>> getCharacterByName(
      String name) async {
    try {
      String url = "${Strings.BaseUrl}characters";
      final res = await dio.get(url, queryParameters: {"name": name});
      if (res.statusCode == 200) {
        List<BreakingBadCharacterModel> charactersList = [];
        final jsonList = res.data;

        for (var element in jsonList) {
          charactersList.add(BreakingBadCharacterModel.fromJson(element));
        }
        return charactersList;
      } else {
        throw ServerException();
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.connectTimeout) {
        throw SocketException();
      } else {
        throw ServerException();
      }
    }
  }

  @override
  Future<BreakingBadCharacterModel> getRandomCharacter() async {
    try {
      String url = "${Strings.BaseUrl}character/random";
      final res = await dio.get(url);
      if (res.statusCode == 200) {
        List<BreakingBadCharacterModel> charactersList = [];
        final jsonList = res.data;

        for (var element in jsonList) {
          charactersList.add(BreakingBadCharacterModel.fromJson(element));
        }
        return charactersList[0];
      } else {
        throw ServerException();
      }
    } on DioError catch (err) {
      if (err.type == DioErrorType.connectTimeout) {
        throw SocketException();
      } else {
        throw ServerException();
      }
    }
  }
}
