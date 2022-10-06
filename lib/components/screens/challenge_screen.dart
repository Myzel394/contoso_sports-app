import 'package:flutter/material.dart';

import '../../foreign_types/challenge.dart';
import '../../foreign_types/user.dart';
import '../widgets/challenge_item.dart';

final List<Challenge> CHALLENGES = [
  Challenge(
    id: "abc",
    description: "Run with me as fast as you can!",
    title: "Run 500 kilometers in one run",
    difficulty: 9,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 2)),
    points: 500,
    tags: [],
    imagePath: "assets/images/run.jpg",
    user: User(
      birthDate: DateTime.now(),
      favoriteTags: [],
      firstName: "Aaron",
      gender: "M",
      id: "abc",
      lastName: "Schmitt",
      nickname: "Eydam",
    ),
  ),
  Challenge(
    id: "abcddd",
    description: "Be silent for a day",
    title: "I'm speechless",
    difficulty: 10,
    startDate: DateTime.now(),
    endDate: DateTime.now().add(Duration(days: 4)),
    points: 50,
    tags: [],
    user: User(
      birthDate: DateTime.now(),
      favoriteTags: [],
      firstName: "Aaron",
      gender: "M",
      id: "abc",
      lastName: "Schmitt",
      nickname: "Eydam",
    ),
  ),
];

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                controller: searchController,
              )
            : Text("Challenges"),
        actions: [
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });

                    searchController.text = "";
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => setState(() {
                    isSearching = true;
                  }),
                ),
        ],
      ),
      body: Align(
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: CHALLENGES
              .map(
                (element) => Align(
                    child: ChallengeItem(
                        challenge: element, key: Key(element.id))),
              )
              .toList(),
        ),
      ),
    );
  }
}
