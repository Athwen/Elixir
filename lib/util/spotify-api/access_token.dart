import 'package:elixir/util/pkce.dart';
import 'package:elixir/util/spotify-api/spotify_app_config.dart';

void getToken(String authCode) {
  String body = encodeQueryParameters({
    "grant_type": "authorization_code",
    "code": authCode,
    "redirect_uri": SpotifyConfig.redirectURI,
    "client_id": SpotifyConfig.clientID,
    "code_verifier": SpotifyConfig.getCodeVerififer(),
  });
}

void getProfile() {}
