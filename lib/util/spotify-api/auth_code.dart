import 'package:elixir/util/spotify-api/spotify_app_config.dart';

import '../pkce.dart';

String genSpotifyAuthURL() {
  const clientID = SpotifyConfig.clientID;
  const redirectUri = SpotifyConfig.redirectURI;

  String state = generateRandomString(16);
  String codeVerifier = generateRandomString(128);

  SpotifyConfig.setCodeVerififer(codeVerifier);

  String scope = "user-read-private user-read-email";
  String codeChallenge = generateCodeChallenge(codeVerifier);

  print(codeVerifier);
  print(codeChallenge);

  String url = "https://accounts.spotify.com/authorize?${joinParameters(
    <String, String>{
      "response_type": "code",
      "client_id": clientID,
      "scope": scope,
      "redirect_uri": redirectUri,
      "state": state,
      "code_challenge_method": "S256",
      "code_challenge": codeChallenge,
    },
  )}";

  return url;
}
