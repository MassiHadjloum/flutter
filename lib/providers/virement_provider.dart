import 'dart:convert';

import 'package:bnparisbas/constants/data.dart';
import 'package:bnparisbas/models/beneficaires.dart';
import 'package:bnparisbas/models/virements.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VirementProvider with ChangeNotifier {
  final List<Beneficaires> _beneficaires = [
  
  ];
  final List<Virements> _virements = [];

  int compare(Beneficaires a, Beneficaires b) {
    int cmp = a.name.compareTo(b.name);
    return cmp;
  }

  void fetchBeneficaires(List benef) {
    _beneficaires.clear();
    for (var item in benef) {
      _beneficaires.add(Beneficaires.toBenefType(item));
    }
    //notifyListeners();
    //print("tailleeee   ${_beneficaires.length}");
  }

  void fetchVirement(List virements){
    _virements.clear();
     for (var item in virements) {
      _virements.add(Virements.toVirmtType(item));
    }
  }

  Future<dynamic> getBeneficaireFromServer(String _id) async {
    final url = Uri.parse(
        "http://192.168.43.66:5000/bnpserver/$_id/getAllBeneficaires");
    final response = await http.get(url);
    //print(json.decode(response.body));
    return json.decode(response.body)['beneficaires'];
  }

  Future<dynamic> getVirementsFromServer(String _id) async {
    final url = Uri.parse(
        "http://192.168.43.66:5000/bnpserver/$_id/getallvirements");
    final response = await http.get(url);
    //print(json.decode(response.body));
    return json.decode(response.body)['virements'];
    //fetchVirement(json.decode(response.body)['virements']);
  }

  Future<void> deleteBeneficaire(String _id, Beneficaires one) async {
    final idx = _beneficaires.indexWhere((element) => one.IBAN == element.IBAN);
    final url =
        Uri.parse("http://192.168.43.66:5000/bnpserver/$_id/deletebeneficaire");
    final response = await http.put(
      url,
      headers: Headers,
      body: json.encode(Beneficaires.toJsonBenef(one)),
    );
    if(json.decode(response.body)['success']){
      _beneficaires.removeAt(idx);
    }
  }

  Future<void> addVirement(String _id, Virements data) async {
    final url = Uri.parse("http://192.168.43.66:5000/bnpserver/$_id/addvirement");
    final response = await http.put(
      url, headers: Headers, body: json.encode(Virements.toJSONVirement(data)) 
    );
    print(json.decode(response.body));
  }


  List<Beneficaires> get getBeneficaires {
    _beneficaires.sort((a, b) => compare(a, b));
    return [..._beneficaires];
  }

  List<Virements> get getVirements {
    return [..._virements];
  }



  Future<void> addBeneficaires(Beneficaires one, String _id) async {
    final url =
        Uri.parse("http://192.168.43.66:5000/bnpserver/$_id/addbeneficaire");
    try {
      final response = await http.put(
        url,
        headers: Headers,
        body: json.encode(Beneficaires.toJsonBenef(one)),
      );
      if (json.decode(response.body)['success']) {
        _beneficaires.add(one);
        //print("length ${_beneficaires.length} $_beneficaires");
      }
      notifyListeners();
    } catch (err) {
      rethrow;
    }
  }

  Beneficaires get getFirst {
    return _beneficaires.first;
  }

  Future<void> removeBeneficaires(Beneficaires one) async {
    _beneficaires.removeWhere((element) => one.IBAN == element.IBAN);
    notifyListeners();
  }
}



 /*  Beneficaires(name: "CHEBOUKH", IBAN: "FR76 3245 5567 5678 4456 2398 556"),
    Beneficaires(name: "FARINES", IBAN: "FR76 3345 3356 7689 6654 4436 776"),
    Beneficaires(name: "YANIS", IBAN: "FR76 3225 5567 5678 4456 2398 556"),
    Beneficaires(name: "TIFIRAQEST", IBAN: "FR46 3245 5567 5678 4456 2398 556"),
    Beneficaires(name: "TABHIMT", IBAN: "FR76 3265 5567 5678 4456 2398 556"),
    Beneficaires(name: "TAGHYOULT", IBAN: "FR76 3245 7567 5678 4456 2398 556"),
    Beneficaires(name: "KOUCI", IBAN: "FR76 3245 5567 4678 4456 2398 556"),
    Beneficaires(name: "YANIS", IBAN: "FR76 3245 5567 5678 4456 5398 556"),
    Beneficaires(name: "TIFIRAQEST", IBAN: "FR76 3245 5567 5678 8456 2398 556"),
    Beneficaires(name: "TABHIMT", IBAN: "FR76 3245 5567 5678 4450 2398 556"),
    Beneficaires(name: "TAGHYOULT", IBAN: "FR76 3245 5567 5678 1456 2398 556"),
    Beneficaires(name: "KOUCI", IBAN: "FR76 3245 5567 5678 4426 2398 556"), */