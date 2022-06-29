import 'package:dio_api_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_api_demo/core/usecases/usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/repositories/breaking_bad_character_repository.dart';

class GetAllCharactersUsecase
    extends UseCase<List<BreakingBadCharacterModel>, NoParams> {
  final BreakingBadCharacterRepository repository;

  GetAllCharactersUsecase({required this.repository});

  @override
  Future<Either<Failure, List<BreakingBadCharacterModel>>> call(
      NoParams params) async {
    return await repository.getAllCharacters();
  }
}
