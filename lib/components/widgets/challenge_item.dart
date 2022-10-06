import 'package:flutter/material.dart';

import '../../foreign_types/challenge.dart';
import '../../utils/theme.dart';
import 'element_tag.dart';

const DIFFICULTY_COLOR_MAP = {
  0: Colors.green,
  1: Colors.green,
  2: Colors.green,
  3: Colors.green,
  4: Colors.yellow,
  5: Colors.yellow,
  6: Colors.yellow,
  7: Colors.orange,
  8: Colors.orange,
  9: Colors.red,
  10: Colors.red,
};

class ChallengeItem extends StatelessWidget {
  final Challenge challenge;

  const ChallengeItem({required this.challenge, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      challenge.difficulty.toString(),
                      style: TextStyle(
                        color: DIFFICULTY_COLOR_MAP[challenge.difficulty],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          challenge.title,
                          style: getBodyTextTextStyle(context).copyWith(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          challenge.description,
                          style: getBodyTextTextStyle(context),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Icon(
                              Icons.date_range_rounded,
                              color: getCaptionTextStyle(context).color,
                            ),
                            SizedBox(width: 2),
                            Text(
                              challenge.startDate.toIso8601String(),
                              style: getCaptionTextStyle(context),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.show_chart,
                              color: getCaptionTextStyle(context).color,
                            ),
                            SizedBox(width: 2),
                            Text(
                              challenge.endDate.toIso8601String(),
                              style: getCaptionTextStyle(context),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              challenge.points.toString(),
                              style: getBodyTextTextStyle(context).copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.star_rounded,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: List<Widget>.from(
                challenge.tags.map(
                  (tag) => ElementTag(
                    tag: tag,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
