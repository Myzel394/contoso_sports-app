// Import http
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> loginUser(
  final String firstName,
  final String lastName,
  final String nickname,
  final String gender,
  final DateTime birthDate,
) async {
  final response = await http.post(
    Uri.parse("https://contoso-sports-app.azurewebsites.net/api/user/create"
        "/$firstName"
        "/$lastName"
        "/$nickname"
        "/$gender"
        "/${birthDate.toIso8601String()}"),
  );

  final data = jsonDecode(response.body);
  final id = data["id"];

  final prefs = await SharedPreferences.getInstance();

  prefs.setString("user_id", id);
}
