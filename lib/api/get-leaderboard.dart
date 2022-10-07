// Import http
import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List<String>> getLeaderboard() async {
  final response = await http.get(
    Uri.parse(
        "https://contoso-sports-app.azurewebsites.net/api/leaderboard/global"),
  );

  final data = jsonDecode(response.body);

  return [
    data["First"],
    data["Second"],
    data["Third"],
  ];
}
