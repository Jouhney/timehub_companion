import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timehub_companion/objects/sign_in.dart';
import 'package:timehub_companion/services/supabase.dart';

Future<void> sharedPrefs(email, passwd) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString('email', email);
  _prefs.setString('passwd', passwd);
}

checkPreferencesForUser() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  var _userEmail = _prefs.getString('email');
  var _userPasswd = _prefs.getString('passwd');

  if (_userEmail != null && _userPasswd != null) {
    signIn(_userEmail, _userPasswd);
    print('session recovered');
    return 1;
  } else {
    print('new session');
    runApp(SignIn());
  }
}
