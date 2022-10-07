import 'package:contoso_sports/utils/show_notification.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:flutter/material.dart';

import '../../foreign_types/challenge.dart';

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
    return GestureDetector(
      onTap: () {
        showNotification(
            'Challenge: ${challenge.title}', challenge.description);
      },
      child: Card(
        margin: EdgeInsets.all(15),
        color: getSheetColor(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (challenge.imagePath is String &&
                  challenge.imagePath != "") ...[
                SizedBox(
                  height: 200,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(challenge.imagePath!),
                  ),
                ),
                const SizedBox(height: 16),
              ],
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    challenge.title,
                    textAlign: TextAlign.center,
                    style: getTitleTextStyle(context).copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    challenge.description,
                    style: getCaptionTextStyle(context).copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 22),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.date_range_rounded,
                        color: getCaptionTextStyle(context).color,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        challenge.startDate.toIso8601String(),
                        style: getCaptionTextStyle(context).copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.show_chart,
                        color: getCaptionTextStyle(context).color,
                        size: 22,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        challenge.endDate.toIso8601String(),
                        style: getCaptionTextStyle(context).copyWith(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.ac_unit,
                        color: DIFFICULTY_COLOR_MAP[challenge.difficulty],
                      ),
                      const SizedBox(width: 2),
                      Text(
                        challenge.difficulty.toString(),
                        style: TextStyle(
                          color: DIFFICULTY_COLOR_MAP[challenge.difficulty],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Row(
                    children: <Widget>[
                      Text(
                        challenge.points.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Icon(Icons.star_rounded, color: Color(0xFFFFD300)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
