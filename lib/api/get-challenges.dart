// Import http
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../foreign_types/challenge.dart';

Future<List<Challenge>> getChallenges(String title) async {
  final response = await http.get(
    Uri.parse(
        "https://contoso-sports.azurewebsites.net/api/HttpQueryTrigger?title=${title == '' ? 'NONE' : title}"),
  );

  final challenges = jsonDecode(response.body)["found_challenges"];

  return List<Challenge>.from(
      challenges.map((data) => Challenge.fromJSON(data)));
}
