import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_demo/model/clientModel.dart';
import 'package:sqlite_demo/core/checker.dart';
import 'package:sqlite_demo/core/db_helper.dart';
import 'crud_state.dart';

class CrudCubit extends Cubit<CrudState> {
  CrudCubit() : super(CrudInitial()) {
    emit(CrudSuccess());
  }
  createClient(String id, String firstName, String lastName) async {
    emit(CrudLoading());
    if (!Checker.isNumeric(id) || id.isEmpty) {
      emit(CrudError(error: "Please enter proper id"));
    } else if (firstName.isEmpty) {
      emit(CrudError(error: "Please enter first name"));
    } else if (lastName.isEmpty) {
      emit(CrudError(error: "Please enter last name"));
    } else {
      var res = await DBHelper.db.newClient(
          Client(firstName: firstName, id: int.parse(id), lastName: lastName));
      emit(CrudSuccess());
    }
  }

  Future<List<Client>> getData() async {
    var res = await DBHelper.db.getAllClients();
    return res;
  }

  deleteClient(int id) async {
    emit(CrudLoading());
    await DBHelper.db.deleteClient(id);
    emit(CrudSuccess());
  }

  updateClient(String id, String firstName, String lastName) async {
    emit(CrudLoading());
    await DBHelper.db.updateClient(
        Client(id: int.parse(id), firstName: firstName, lastName: lastName));
    emit(CrudSuccess());
  }
}
