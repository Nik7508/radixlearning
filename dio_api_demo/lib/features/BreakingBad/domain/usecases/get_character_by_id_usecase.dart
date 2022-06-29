import 'package:dio_api_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_api_demo/core/usecases/usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/repositories/breaking_bad_character_repository.dart';

class GetCharacterByIdUsecase
    extends UseCase<BreakingBadCharacterModel, IdParams> {
  final BreakingBadCharacterRepository repository;

  GetCharacterByIdUsecase({required this.repository});

  @override
  Future<Either<Failure, BreakingBadCharacterModel>> call(
      IdParams params) async {
    return await repository.getCharacterById(params.id);
  }
}

class IdParams {
  final int id;
  IdParams({required this.id});
}
