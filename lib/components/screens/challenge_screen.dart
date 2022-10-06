import 'package:contoso_sports/api/get-challenges.dart';
import 'package:contoso_sports/components/widgets/add_form.dart';
import 'package:contoso_sports/components/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../foreign_types/challenge.dart';
import '../../foreign_types/user.dart';
import '../widgets/challenge_item.dart';
import '../widgets/profile_bar.dart';

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
      picturePath: "",
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
      picturePath: "",
    ),
  ),
];

final List<User> LEADERBOARD = [
  User(
    birthDate: DateTime.now(),
    favoriteTags: [],
    firstName: "Aaron",
    gender: "M",
    id: "abc",
    lastName: "Schmitt",
    nickname: "Eydam",
    picturePath: "assets/images/erik.jpg",
  ),
  User(
    birthDate: DateTime.now(),
    favoriteTags: [],
    firstName: "Howard",
    gender: "M",
    id: "abcd",
    lastName: "Wollowitz",
    nickname: "Eydam",
    picturePath: "assets/images/omid.jpg",
  ),
];

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({Key? key}) : super(key: key);

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  bool isSearching = false;
  final TextEditingController searchController = TextEditingController(
    text: "",
  );
  final List<Challenge> challenges = [];

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      queryChallenges();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    queryChallenges();
  }

  void queryChallenges() async {
    final result = await getChallenges(searchController.text);

    setState(() {
      challenges.clear();

      challenges.addAll(result);
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          if (index == 1) {
            showPlatformModalSheet(
              context: context,
              builder: (buildContext) => ModalSheet(
                child: AddForm(
                  onClose: () => Navigator.pop(buildContext),
                ),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: "New Challenges",
          ),
          BottomNavigationBarItem(
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1502101872923-d48509bff386?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&h=500&q=80"),
                  ),
                ),
                child: Icon(Icons.add, color: Colors.white, size: 40),
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "My Profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 500,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: challenges
                    .map(
                      (element) => Align(
                        child: ChallengeItem(
                          challenge: element,
                          key: Key(element.id),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Text(
              "Global Leaderboard",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 8),
            Column(
              children: List<Widget>.from(
                LEADERBOARD.map(
                  (element) => ProfileBar(
                    user: element,
                    key: Key(element.id),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
