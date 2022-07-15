import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/models/htt_exceptions.dart';

class Auth with ChangeNotifier {
  String? _token;
  DateTime? _expiresDate;
  String? _userId;
  Timer? _authTimer;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_expiresDate != null &&
        _expiresDate!.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String? get userId {
    return _userId;
  }

  Future<void> _authenticate(String email, String password, String urll) async {
    final url = Uri.parse(urll);
    try {
      final res = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final resData = json.decode(res.body);
      _token = resData['idToken'];
      _userId = resData['localId'];
      _expiresDate = DateTime.now().add(
        Duration(
          seconds: int.parse(resData['expiresIn']),
        ),
      );
      if (resData['error'] != null) {
        throw HttpException(resData['error']['message']);
      }
      _autoLogout();
      notifyListeners();
      final prefs = await SharedPreferences.getInstance();
      print("$_userId $_token $_expiresDate");
      final userData = json.encode(
        {
          'token': _token!,
          'userId': _userId!,
          '_expiresDate': _expiresDate!.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } catch (error) {
      print(error);
      rethrow;
    }
  }

  Future<bool> tryAutoLog() async {
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('userData')) {
      return false;
    }
    final extractedData = json.decode(prefs.getString('userData')!) as Map<String, Object>;
    print(extractedData);
    final expiryDate = DateTime.parse(extractedData['_expiresDate'] as String);
    if(expiryDate.isBefore(DateTime.now())){
      return false;
    }
    _token = extractedData['token'] as String;
    _userId = extractedData['userId'] as String;
    _expiresDate = expiryDate;
    notifyListeners();
    return true;
  }

  Future<void> signup(String mail, String password) async {
    return _authenticate(mail, password,
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCgAuEeE3yE6n3l1IFwF92HLdWQflBqBck");
  }

  Future<void> login(String mail, String password) async {
    return _authenticate(mail, password,
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCgAuEeE3yE6n3l1IFwF92HLdWQflBqBck");
  }

  void logout() {
    _token = null;
    _userId = null;
    _expiresDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    notifyListeners();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    final seconds = _expiresDate!.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: seconds), logout);
  }
}
