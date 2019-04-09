import 'package:meta/meta.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
