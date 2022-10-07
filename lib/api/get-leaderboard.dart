// Import http
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../foreign_types/user.dart';

Future<List<User>> getLeaderboard() async {
  final response = await http.get(
    Uri.parse(
        "https://contoso-sports-app.azurewebsites.net/api/leaderboard/global"),
  );

  final data = jsonDecode(response.body);

  return [
    User.fromJSON(data["First"]),
    User.fromJSON(data["Second"]),
    User.fromJSON(data["Third"]),
  ];
}
