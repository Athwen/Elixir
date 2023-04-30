import '../pkce.dart';

String genSpotifyAuthURL() {
  const clientID = "b0b80ff4663045549b971b4c1a49250b";
  const redirectUri =
      "http://ec2-3-144-70-69.us-east-2.compute.amazonaws.com:3000";

  String state = generateRandomString(16);
  String codeVerifier = generateRandomString(128);
  String scope = "user-read-private user-read-email";
  String codeChallenge = generateCodeChallenge(codeVerifier);

  String url = "https://accounts.spotify.com/authorize?${encodeQueryParameters(
    <String, String>{
      "response_type": "code",
      "client_id": clientID,
      "scope": scope,
      "redirect_uri": redirectUri,
      "state": state,
      "code_challenge_method": "S256",
      "code_challenge": codeChallenge,
    },
  )!}";

  return url;
}
