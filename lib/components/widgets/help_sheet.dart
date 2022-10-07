import 'package:contoso_sports/components/widgets/help_content_text.dart';
import 'package:contoso_sports/components/widgets/modal_sheet.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class HelpSheet extends StatefulWidget {
  final Widget child;

  const HelpSheet({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<HelpSheet> createState() => _HelpSheetState();
}

class _HelpSheetState extends State<HelpSheet> {
  bool isShowingSheet = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      showHelpSheet();
    });
  }

  void showHelpSheet() async {
    setState(() {
      isShowingSheet = true;
    });

    await showPlatformModalSheet(
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
      builder: (_) => ModalSheet(
        child: Column(
          children: <Widget>[
            Text(
              'Welcome to Contoso\'s Sports!',
              textAlign: TextAlign.center,
              style: getTitleTextStyle(context),
            ),
            const SizedBox(height: 16),
            Text(
              'With Contoso\'s Sports, you can earn points by completing challenges.'
              ' Push your boundaries everyday and challenge your with friends'
              ' with your own challenges!',
              style: getBodyTextTextStyle(context),
            ),
            const SizedBox(height: 32),
            HelpContentText(
              icon: Icon(Icons.touch_app_rounded,
                  color: getCaptionTextStyle(context).color),
              text:
                  'Tap on a challenge to learn more about it, and long press it to'
                  ' show it in your notifications.',
            ),
            const SizedBox(height: 12),
            HelpContentText(
              icon: Icon(Icons.show_chart,
                  color: getCaptionTextStyle(context).color),
              text: 'Raise in the leaderboard by completing challenges'
                  ' and show off your hard progress!',
            ),
            const SizedBox(height: 12),
            HelpContentText(
              icon: Icon(Icons.add_circle,
                  color: getCaptionTextStyle(context).color),
              text: 'See how your friends are doing and challenge them'
                  ' to a new challenge!',
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Got it!'),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );

    setState(() {
      isShowingSheet = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      alignment: Alignment.bottomCenter,
      curve: Curves.easeOutSine,
      scale: isShowingSheet ? .95 : 1,
      duration: const Duration(milliseconds: 500),
      child: widget.child,
    );
  }
}
