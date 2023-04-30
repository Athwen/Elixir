class SpotifyConfig {
  static const clientID = "b0b80ff4663045549b971b4c1a49250b";
  static const redirectURI =
      "http://ec2-3-144-70-69.us-east-2.compute.amazonaws.com:3000";

  static String _codeVerifier = "";

  static void setCodeVerififer(String codeVerifier) {
    _codeVerifier = codeVerifier;
  }

  static String getCodeVerififer() {
    return _codeVerifier;
  }
}
