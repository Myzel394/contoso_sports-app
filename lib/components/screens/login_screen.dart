import 'package:contoso_sports/api/login-user.dart';
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
      body: Column(
        children: [
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              icon: Icon(Icons.title),
              labelText: 'First Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: lastNameController,
            decoration: InputDecoration(
              icon: Icon(Icons.description),
              labelText: 'Last Name',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: nickNameController,
            decoration: InputDecoration(
              icon: Icon(Icons.account_circle),
              labelText: 'Nickname',
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: genderController,
            decoration: InputDecoration(
              icon: Icon(Icons.female_rounded),
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
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
