import 'dart:convert';

import 'package:elixir/util/spotify-api/spotify_app_config.dart';
import 'package:http/http.dart' as http;

Future<Map<String, String>> getProfile() async {
  String accessToken = SpotifyConfig.getUserToken();

  http.Response res = await http.post(
    Uri.parse("https://api.spotify.com/v1/me"),
    headers: {"Authorization": "Bearer $accessToken"},
  );

  if (res.statusCode == 200) {
    return jsonDecode(res.body);
  }

  return {"error": "Could not get user's profile"};
}
