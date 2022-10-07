import 'package:contoso_sports/api/get-challenges.dart';
import 'package:contoso_sports/api/get-leaderboard.dart';
import 'package:contoso_sports/components/widgets/add_form.dart';
import 'package:contoso_sports/components/widgets/help_sheet.dart';
import 'package:contoso_sports/components/widgets/modal_sheet.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../foreign_types/challenge.dart';
import '../../foreign_types/user.dart';
import '../widgets/challenge_item.dart';
import '../widgets/profile_bar.dart';

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
  final List<User> leaderboard = [];

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      queryChallenges();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});

    queryChallenges();
    queryLeaderboard();
  }

  void queryChallenges() async {
    final result = await getChallenges(searchController.text);

    setState(() {
      challenges.clear();

      challenges.addAll(result);
    });
  }

  void queryLeaderboard() async {
    final result = await getLeaderboard();

    setState(() {
      leaderboard.clear();

      leaderboard.addAll(result);
    });
  }

  @override
  void dispose() {
    super.dispose();

    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HelpSheet(
      child: PlatformScaffold(
        appBar: PlatformAppBar(
          title: isSearching
              ? TextField(
                  controller: searchController,
                )
              : const Text("Challenges"),
          trailingActions: [
            isSearching
                ? PlatformIconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                      });

                      searchController.text = "";
                    },
                  )
                : PlatformIconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => setState(() {
                      isSearching = true;
                    }),
                  ),
          ],
        ),
        bottomNavBar: PlatformNavBar(
          itemChanged: (index) {
            if (index == 1) {
              showPlatformModalSheet(
                context: context,
                material: MaterialModalSheetData(
                  isDismissible: true,
                  enableDrag: true,
                  isScrollControlled: true,
                  backgroundColor: getSheetColor(context),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.zero,
                    ),
                  ),
                ),
                cupertino: CupertinoModalSheetData(
                  barrierDismissible: true,
                  semanticsDismissible: true,
                ),
                builder: (buildContext) => ModalSheet(
                  child: AddForm(
                    onClose: () {
                      Navigator.pop(buildContext);
                      queryChallenges();
                    },
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
                  width: 50,
                  height: 50,
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
              PlatformWidget(
                material: (_, __) => SizedBox(height: 32),
                cupertino: (_, __) => SizedBox(height: 120),
              ),
              Text(
                "New Challenges for you",
                style: getTitleTextStyle(context),
              ),
              SizedBox(
                height: 260,
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
                  leaderboard.map(
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
      ),
    );
  }
}
