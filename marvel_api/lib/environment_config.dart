import 'dart:convert';

import 'package:crypto/crypto.dart';

class EnvironmentConfig {
  static const String baseUrl = 'http://gateway.marvel.com/v1/public/';

  static Map<String, String> getBaseParameters() {
    const String apiKey = '2af16d589d9800df6df6653920d7bd6e';
    const String apiPrivateKey = 'ed4ea7d5863217625d1271c34e4b079d519d5524';
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
