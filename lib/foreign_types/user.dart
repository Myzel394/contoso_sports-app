import 'tag.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String nickname;
  final String gender;
  final DateTime birthDate;
  final List<Tag> favoriteTags;
  final String picturePath;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    required this.gender,
    required this.birthDate,
    required this.favoriteTags,
    required this.picturePath,
  });
}
