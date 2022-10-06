// Import http
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String> hello(String value) async {
  print("GETTING");
  final response = await http.post(
    Uri.parse("https://contoso-sports.azurewebsites.net/api/HttpTestTrigger"),
    body: json.encode({
      "value": value,
    }),
  );
  print("DANACH");

  print(response.body);

  return "test";
}
