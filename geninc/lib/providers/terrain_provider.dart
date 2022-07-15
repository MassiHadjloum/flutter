

import 'package:flutter/widgets.dart';
import 'package:geninc/data/data.dart';
import 'package:geninc/model/ville.dart';

class TerrainProvider with ChangeNotifier {
  List<Map<String, List<Ville>>> _holeList = [];

  List<Map<String, List<Ville>>> get getholeList {
    return _holeList;
  }

  List<List<Ville>> prepareHoleList() {
    List<List<Ville>> list = [];
    VILLES.sort((a, b) => a.compare(a, b));
    //print(VILLES);
    int start, end;
    const alpha = 'ABCDEFJHIGKLMNOPQRSTUVWXYZ';
    alpha.split('').forEach((e) {
      start = VILLES.indexWhere((ville) => ville.name[0] == e);
      end = VILLES.lastIndexWhere((ville) => ville.name[0] == e);
      if (start != -1 && end != -1) {
        print("$start, $end, $e, ");
        list.add(VILLES.sublist(start, end + 1));
      }
    });
    return list;
  }




}