import 'package:contoso_sports/components/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/screens/challenge_screen.dart';
import 'constants/themes.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings();

  final LinuxInitializationSettings initializationSettingsLinux =
      LinuxInitializationSettings(defaultActionName: 'Open notification');
  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
      linux: initializationSettingsLinux);
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
  );

  final prefs = await SharedPreferences.getInstance();
  final userId = prefs.getString("user_id");

  runApp(MyApp(
    initialRoute: userId == null ? "/" : "/challenge",
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({required this.initialRoute, Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: 'Flutter Demo',
      material: (_, __) => MaterialAppData(
        theme: LIGHT_THEME_MATERIAL,
        darkTheme: DARK_THEME_MATERIAL,
        themeMode: ThemeMode.system,
      ),
      cupertino: (_, __) => CupertinoAppData(
        theme: LIGHT_THEME_CUPERTINO,
      ),
      routes: {
        "/": (_) => const LoginScreen(),
        "/challenge": (_) => const ChallengeScreen(),
      },
      initialRoute: initialRoute,
    );
  }
}
