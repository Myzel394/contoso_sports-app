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
  final int points;
  final int nChallenges;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.nickname,
    required this.gender,
    required this.birthDate,
    required this.favoriteTags,
    required this.picturePath,
    required this.points,
    this.nChallenges = 0,
  });

  static User fromJSON(data) {
    return User(
      firstName: data["firstName"],
      lastName: data["lastName"],
      nickname: data["nickName"],
      id: data["id"],
      gender: data["gender"],
      birthDate: DateTime.parse(data["birthDate"]),
      picturePath: "assets/images/erik.jpg",
      favoriteTags: [],
      points: data["points"],
      nChallenges: data["nChallenges"],
    );
  }
}
