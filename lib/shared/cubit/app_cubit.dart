import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isBottomSheetShown = false;
  IconData fbiIcon = Icons.add;

  void bottomSheetShown({required IconData icon, required bool isBottom}) {
    isBottomSheetShown = isBottom;
    fbiIcon = icon;
    emit(AppIsBottomSheetShown());
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var playerName = TextEditingController();
  Database? database;
  List cards = [];

  void createDataBase() async {
    await openDatabase(
      'skrata.db',
      version: 1,
      onCreate: (database, version) {
        database
            .execute('CREATE TABLE Cards (id INTEGER PRIMARY KEY, name TEXT)')
            .then((value) {});
      },
      onOpen: (database) {
        getFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  void insertToDatabase({required String name}) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert('INSERT INTO Cards(name) VALUES("$name")')
          .then((value) {
        emit(AppInsertIntoDatabase());
        getFromDatabase(database);
      });
    });
  }

  void getFromDatabase(database) async {
    await database!.rawQuery('SELECT *FROM Cards').then((value) {
      cards = value;
      emit(AppGetFromDatabase());
    });
  }

  void deleteDatabase({required String id}) async {
    await database!
        .rawDelete('DELETE FROM Cards WHERE id = ?', [id]).then((value) {
      getFromDatabase(database);
      emit(AppDeleteDatabase());
    });
  }
}
