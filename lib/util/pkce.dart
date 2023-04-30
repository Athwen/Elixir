import 'dart:math';
import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

String generateRandomString(int length) {
  String text = "";
  String possible =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

  for (int i = 0; i < length; i++) {
    text += possible.characters.elementAt(Random().nextInt(possible.length));
  }

  return text;
}

String generateCodeChallenge(String codeVerifier) {
  List<int> bytes = utf8.encode(codeVerifier);
  Digest digest = sha256.convert(bytes);

  return base64Encode(digest.bytes);
}

String encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) => '${e.key}=${e.value}')
      .join('&');
}
