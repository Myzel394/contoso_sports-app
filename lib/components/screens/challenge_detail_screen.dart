import 'package:contoso_sports/components/screens/scan_qr_code.dart';
import 'package:contoso_sports/components/widgets/mark-challenge-as-completed.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../foreign_types/challenge.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final Challenge challenge;

  const ChallengeDetailScreen({
    required this.challenge,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Challenge Information'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Scan the QR code to complete the challenge",
                textAlign: TextAlign.center,
                style: getTitleTextStyle(context),
              ),
              Spacer(),
              Column(
                children: [
                  Text(
                    "Your reward:",
                    style: getSubTitleTextStyle(context),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        challenge.points.toString(),
                        style: getBodyTextTextStyle(context).copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.star_rounded,
                        color: Color(0xFFFFD300),
                        size: 32,
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () async {
                  await Permission.camera.request();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScanQRCode(
                        onScan: (data) async {
                          await markChallengeAsCompleted(challenge.id);

                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  height: MediaQuery.of(context).size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                  child: Icon(
                    Icons.camera_alt_rounded,
                    color: Color(0xFF222222),
                    size: 30,
                  ),
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.flag,
                          color: getCaptionTextStyle(context).color),
                      const SizedBox(width: 4),
                      Text(
                        challenge.title,
                        style: getCaptionTextStyle(context),
                      )
                    ],
                  ),
                ],
              ),
              Spacer(),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("CANCEL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
