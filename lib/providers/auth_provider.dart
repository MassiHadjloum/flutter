import 'dart:convert';

import 'package:bnparisbas/constants/data.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  late String _token;
  late DateTime _expiryDate;
  late String _userId;
  late Map<String, dynamic> _user;

  Future<Map<String, dynamic>> login(
      String clientNumber, String secretNumber) async {
   
    try {
      final url = Uri.parse("http://192.168.43.66:5000/bnpserver/login");
      final res = await http.post(
        url,
        headers: Headers,
        body: json.encode(
          {
            "clientnumber": clientNumber,
            "secretnumber": secretNumber,
          },
        ),
      );
      //final response = json.decode(res.body) as Map<String, dynamic>;
      _user = json.decode(res.body);
      return json.decode(res.body);
    } catch (err) {
      rethrow;
    }
  }


  Map<String, dynamic> get getUser {
    return _user;
  } 

}
