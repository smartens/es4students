import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
   String serviceName = "moodle_mobile_app";
   
  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    final String url = "https://moodle.uni-due.de/login/token.php?username=$username&password=$password&service=$serviceName";

    var res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    if(res != null)
    {
      Map jsonModel = jsonDecode(res.body);
      if(jsonModel['token'] != null)
      {
        return jsonModel['token'];
      }
      else{
       throw new Exception('Benutzername oder Passwort ist falsch!');
      }
    }
  }

  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /// delete from keystore/keychain
    prefs.remove('token');
  }

  Future<void> persistToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') ?? false) {
      return true;
    } else {
      return false;
    }
    /// read from keystore/keychain
    //await Future.delayed(Duration(seconds: 1));
    //return false;
  }
}
