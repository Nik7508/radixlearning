import 'package:dio_api_demo/core/usecases/usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_all_characters_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_character_by_category_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_character_by_name_usecase.dart';
import 'package:dio_api_demo/features/BreakingBad/domain/usecases/get_random_character_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_character_by_id_usecase.dart';
import 'breakingbad_state.dart';

class BreakingBadCubit extends Cubit<BreakingBadState> {
  final GetAllCharactersUsecase _getAllCharacters;
  final GetCharacterByCategoryUsecase _getCharacterByCategory;
  final GetCharacterByNameUsecase _getCharacterByName;
  final GetCharacterByIdUsecase _getCharacterById;
  final GetRandomCharacterUsecase _getRandomCharacter;

  BreakingBadCubit(
      this._getAllCharacters,
      this._getCharacterByCategory,
      this._getCharacterByName,
      this._getCharacterById,
      this._getRandomCharacter)
      : super(BreakingbadInitial());

  getAllCharacter() async {
    final res = await _getAllCharacters.call(NoParams());
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(BreakingbadSuccess(characters: success));
    });
  }

  getCharacterByCategory(String category) async {
    final res =
        await _getCharacterByCategory.call(CategoryParams(category: category));
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(BreakingbadSuccess(characters: success));
    });
  }

  getCharacterByName(String name) async {
    final res = await _getCharacterByName.call(NameParams(name: name));
    res.fold((failure) {
      print(failure);
    }, (success) {
      emit(BreakingbadSuccess(characters: success));
    });
  }

  getCharacterById(int id) async {
    final res = await _getCharacterById.call(IdParams(id: id));
    res.fold((failure) {
      print(failure);
    }, (success) {
      List<BreakingBadCharacterModel> list = [];
      list.add(success);
      emit(BreakingbadSuccess(characters: list));
    });
  }

  getRandomCharacter() async {
    final res = await _getRandomCharacter.call(NoParams());
    res.fold((failure) {
      print(failure);
    }, (success) {
      List<BreakingBadCharacterModel> list = [];
      list.add(success);
      emit(BreakingbadSuccess(characters: list));
    });
  }
}
