abstract class CrudState {}

class CrudInitial extends CrudState {}

class CrudLoading extends CrudState {}

class CrudError extends CrudState {
  final String error;

  CrudError({required this.error});
}

class CrudSuccess extends CrudState {}
