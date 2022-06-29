import 'package:dio_api_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_api_demo/core/usecases/usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/repositories/breaking_bad_character_repository.dart';

class GetRandomCharacterUsecase
    extends UseCase<BreakingBadCharacterModel, NoParams> {
  final BreakingBadCharacterRepository repository;

  GetRandomCharacterUsecase({required this.repository});

  @override
  Future<Either<Failure, BreakingBadCharacterModel>> call(
      NoParams params) async {
    return await repository.getRandomCharacter();
  }
}
