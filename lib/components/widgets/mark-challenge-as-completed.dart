import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> markChallengeAsCompleted(
  final String challengeId,
) async {
  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString("user_id");

  await http.post(
    Uri.parse(
      "https://contoso-sports.azurewebsites.net/api/HttpCompleteChallengeTrigger?",
    ),
    body: jsonEncode({
      "user_id": userId,
      "challenge_id": challengeId,
    }),
  );
}
