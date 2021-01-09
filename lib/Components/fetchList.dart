import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> fetchList(url) async {
  http.Response response = await http.get(url);
  return jsonDecode(response.body);
}
