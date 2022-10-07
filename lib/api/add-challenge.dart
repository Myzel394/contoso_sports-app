// Import http
import 'package:http/http.dart' as http;

Future<void> addChallenge(
  String title,
  String description,
  DateTime startDate,
  DateTime endDate,
  int difficulty,
  int points,
) async {
  final response = await http.post(
    Uri.parse(
      "https://contoso-sports-app.azurewebsites.net"
      "/api"
      "/challenge"
      "/create"
      "/$title"
      "/${startDate.toIso8601String()}"
      "/${endDate.toIso8601String()}"
      "/$description"
      "/$difficulty"
      "/$points",
    ),
  );
}
