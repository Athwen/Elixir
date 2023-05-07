import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpotifyConfig {
  static const clientID = "b0b80ff4663045549b971b4c1a49250b";
  // static const redirectURI = (kReleaseMode)
  //     ? "https://elixir-6c470.web.app/redirect"
  //     : "http://localhost:5000/redirect";
  static const redirectURI = "https://elixir-6c470.web.app/landing";

  // static String _codeVerifier = "";
  // static String _userToken = "";

  static late SharedPreferences _prefs;

  static Future<void> setPrefInstance() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setCodeVerififer(String codeVerifier) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("codeVerifier", codeVerifier);
  }

  static String getCodeVerififer() {
    return _prefs.getString("codeVerifier") ??
        "error: couldnt get codeVerifier from shared preferences";
  }

  static void setUserToken(String userToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("userToken", userToken);
    // _userToken = userToken;
  }

  static String getUserToken() {
    return _prefs.getString("userToken") ??
        "error: couldnt get userToken from shared preferences";
  }
}
