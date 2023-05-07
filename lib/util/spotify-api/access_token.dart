import 'dart:convert';

import 'package:elixir/util/pkce.dart';
import 'package:elixir/util/spotify-api/spotify_app_config.dart';
import 'package:http/http.dart' as http;

Future<String> getToken(String authCode) async {
  String body = Uri.encodeFull(joinParameters({
    "grant_type": "authorization_code",
    "code": authCode,
    "redirect_uri": SpotifyConfig.redirectURI,
    "client_id": SpotifyConfig.clientID,
    "code_verifier": SpotifyConfig.getCodeVerififer(),
  }));

  http.Response res = await http.post(
    Uri.parse("https://accounts.spotify.com/api/token"),
    headers: {"Content-Type": "application/x-www-form-urlencoded"},
    body: body,
  );

  if (res.statusCode == 200) {
    SpotifyConfig.setUserToken(json.decode(res.body)['access_token']);
    return SpotifyConfig.getUserToken();
  } else {
    print("Error getting user's token");
    print(res.body);
    return "error";
  }
}
