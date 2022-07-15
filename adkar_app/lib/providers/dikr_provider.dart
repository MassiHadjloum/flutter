import 'dart:async';

import 'package:adkar_app/database/database.dart';
import 'package:adkar_app/models/dikr.dart';
import 'package:flutter/cupertino.dart';

class DikrProvider with ChangeNotifier {
  List<Dikr> _adkar = [];

  Future<void> load() async {
    Future<List<Dikr>> list = SQLiteDatabase.db.getMousabihaList();
    list.then((value) {
      _adkar = [...value];
      notifyListeners();
    });
  }

  List<Dikr> get getMousabihaList {
    return _adkar;
  }

  Future<void> update(Dikr tasbih) async {
    final idx = _adkar.indexWhere((element) => element.id == tasbih.id);
    _adkar[idx].total = tasbih.total;
    SQLiteDatabase.db.update(tasbih);
    notifyListeners();
  }

  Future<void> insertTasbih(Dikr tasbih) async {
    _adkar.add(tasbih);
    SQLiteDatabase.db.insert(tasbih);
    notifyListeners();
  }

  Future<void> deleteTasbih(String id) async {
    _adkar.removeWhere((element) => element.id == id);
    SQLiteDatabase.db.deleteTasbih(id);
    notifyListeners();
  }

  Future<void> updateResetTotal(Dikr tasbih) async {
    final idx = _adkar.indexWhere((element) => element.id == tasbih.id);
    _adkar[idx].total = 0;
    SQLiteDatabase.db.updateResetTotal(tasbih);
    notifyListeners();
  }

  void removeDikr(String id) {
    _adkar.removeWhere((element) => element.id == id);
    //print(_adkar.length);
    notifyListeners();
  }

  // for showing messages
  var _show = false;
  bool get getHide {
    return _show;
  }

  void hide(bool value) {
    _show = value;
    notifyListeners();
  }
}
