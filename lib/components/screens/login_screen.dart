import 'package:contoso_sports/api/login-user.dart';
import 'package:contoso_sports/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final nickNameController = TextEditingController();
  final genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign up",
                style: getTitleTextStyle(context),
              ),
              const SizedBox(height: 32),
              PlatformTextField(
                controller: firstNameController,
                material: (_, __) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    icon: Icon(Icons.title),
                    labelText: 'First Name',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'First Name',
                  prefix: Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 16),
              PlatformTextField(
                controller: lastNameController,
                material: (_, __) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    icon: Icon(Icons.description),
                    labelText: 'Last Name',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Last Name',
                  prefix: Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 16),
              PlatformTextField(
                controller: nickNameController,
                material: (_, __) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: 'Nickname',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  placeholder: 'Nickname',
                  prefix: Icon(Icons.account_circle),
                ),
              ),
              const SizedBox(height: 16),
              PlatformTextField(
                controller: genderController,
                material: (_, __) => MaterialTextFieldData(
                  decoration: InputDecoration(
                    icon: Icon(Icons.female_rounded),
                    labelText: 'Gender',
                  ),
                ),
                cupertino: (_, __) => CupertinoTextFieldData(
                  prefix: Icon(Icons.female_rounded),
                  placeholder: "Gender",
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () async {
                  await loginUser(
                    firstNameController.text,
                    lastNameController.text,
                    nickNameController.text,
                    genderController.text,
                    DateTime.now(),
                  );

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/challenge",
                    (route) => true,
                  );
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
