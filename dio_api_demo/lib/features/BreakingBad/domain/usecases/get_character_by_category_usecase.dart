import 'package:dio_api_demo/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio_api_demo/core/usecases/usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/repositories/breaking_bad_character_repository.dart';

class GetCharacterByCategoryUsecase
    extends UseCase<List<BreakingBadCharacterModel>, CategoryParams> {
  final BreakingBadCharacterRepository repository;

  GetCharacterByCategoryUsecase({required this.repository});

  @override
  Future<Either<Failure, List<BreakingBadCharacterModel>>> call(
      CategoryParams params) async {
    return await repository.getCharacterByCategory(params.category);
  }
}

class CategoryParams {
  final String category;

  CategoryParams({required this.category});
}
