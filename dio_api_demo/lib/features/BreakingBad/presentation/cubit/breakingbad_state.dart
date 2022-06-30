import 'package:dio_api_demo/features/BreakingBad/domain/models/breaking_bad_character_model.dart';

abstract class BreakingBadState {}

class BreakingbadInitial extends BreakingBadState {}

class BreakingbadLoading extends BreakingBadState {}

class BreakingbadError extends BreakingBadState {
  final String error;

  BreakingbadError({required this.error});
}

class BreakingbadSuccess extends BreakingBadState {
  final List<BreakingBadCharacterModel> characters;

  BreakingbadSuccess({required this.characters});
}
