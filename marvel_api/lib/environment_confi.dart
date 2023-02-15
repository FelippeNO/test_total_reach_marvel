import 'dart:convert';

import 'package:crypto/crypto.dart';

class EnvironmentConfig {
  static const String baseUrl = 'http://gateway.marvel.com/v1/public/';

  static Map<String, String> getBaseParameters() {
    const String apiKey = '';
    const String apiPrivateKey = '';
    final DateTime timeStamp = DateTime.now();
    final String hash =
        md5.convert(utf8.encode((timeStamp.millisecondsSinceEpoch).toString() + apiPrivateKey + apiKey)).toString();

    return {
      'apikey': apiKey,
      'ts': timeStamp.millisecondsSinceEpoch.toString(),
      'hash': hash,
    };
  }
}
