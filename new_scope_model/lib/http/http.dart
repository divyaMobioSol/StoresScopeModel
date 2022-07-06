import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpMethods {
  static Future<dynamic> getHttpMethods(String url) async {
    try {
      final url1 = Uri.parse(url);
      final res = await http.get(url1);
      if (res.statusCode != 200 && res.statusCode != 201) {
        throw res.statusCode;
      }
      return jsonDecode(res.body);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
