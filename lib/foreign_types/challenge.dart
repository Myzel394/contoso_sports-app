import 'tag.dart';
import 'user.dart';

class Challenge {
  final String id;
  final DateTime startDate;
  final DateTime endDate;
  final String title;
  final List<Tag> tags;
  final String description;
  final User user;
  final int difficulty;
  final int points;
  final String? imagePath;

  const Challenge({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.title,
    required this.tags,
    required this.description,
    required this.user,
    required this.difficulty,
    required this.points,
    this.imagePath,
  });
}
